package main;

import static main.Util.*;

import java.io.BufferedReader;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.*;

public class App {
    static String changeId;
    static String branchName;
    static String appUser;
    static String appWorkspace;
    static String apexShema;
    static String dbHost;
    static String dbPort;
    static String dbServiceName;
    static String dbUser;
    static String dbPassword;
    static Integer intervalSec;

    public static void main(String[] args) throws Exception {

        // Enter data using BufferReader
        BufferedReader consReader = new BufferedReader(new InputStreamReader(System.in));

        // Read property file
        try {
            Util.ReadPropertyFile();
        } catch (Exception e) {
            Util.NewPropertyFile();
        }

        appUser = GetPropertyValue("apex.user", "Enter the APEX user, this should be the developer's login",
                consReader);
        appWorkspace = GetPropertyValue("apex.workspace", "Enter the name of the APEX workspace you want to monitor",
                consReader);
        apexShema = GetPropertyValue("apex.shema", "Enter shema name where APEX is installed (APEX_XXXXXX)",
                consReader);
        dbHost = GetPropertyValue("database.host", "Enter the host where the database is installed", consReader);
        dbPort = GetPropertyValue("database.port", "Enter the port the database is using", consReader);
        dbServiceName = GetPropertyValue("database.servicename", "Enter the Database service name", consReader);
        dbUser = GetPropertyValue("database.user",
                "Enter the name of the database user who has read and write privileges to the APEX_" + apexShema
                        + "  schema. (It could be SYSTEM) ",
                consReader);
        dbPassword = GetPasswordProperty("database.password", "Enter the password to connect to the database",
                consReader);
        String intervalSecStr = GetPropertyValue("util.interval",
                "Set the refresh interval in seconds (Recommended value - 5 sec)", consReader);

        if (intervalSecStr == null) {
            intervalSec = 5;
        } else {
            intervalSec = Integer.valueOf(intervalSecStr);
        }

        // load driver
        Class.forName("oracle.jdbc.OracleDriver");
        System.out.println("Oracle JDBC driver loaded ok.");
        Connection conn = DriverManager.getConnection(
                "jdbc:oracle:thin:" + dbUser + "/" + dbPassword + "@" + dbHost + ":" + dbPort + "/" + dbServiceName);
        System.out.println("Connected to DB");
        // ------------------------------------------------------------------------------------------------------------------

        String lastChangeId = "select max(s.id) change_id "
                + "from "+apexShema+".wwv_flow_builder_audit_trail s join "+apexShema+".wwv_flow_authorized f ON s.flow_id = f.application_id "
                + "where s.flow_user = ? and f.workspace = ?";

        String exportScript = "DECLARE v_files  apex_t_export_files; v_components  apex_t_varchar2 := apex_t_varchar2(); "
                + "BEGIN  v_components.extend(1); v_components(1) :=  :object_name; "
                + "v_files := apex_export.get_application(p_application_id => :app_id, p_components => v_components); "
                + ":page_script := v_files(1).contents; END;";

        String selectChanges = "with a as ( "
                + "select s.id change_id,s.flow_id app_id,object_name,s.flow_table, s.flow_table_pk object_id, COUNT(s.id) OVER (PARTITION BY s.scn) cnt  FROM "
                + apexShema + ".wwv_flow_builder_audit_trail s join " + apexShema
                + ".wwv_flow_authorized f ON s.flow_id = f.application_id "
                + "where s.flow_table in ('WWV_FLOW_LISTS_OF_VALUES$','WWV_FLOW_STEPS') "
                + "and s.flow_user = ? and f.workspace = ? and id > ? and "
                + "s.flow_table_pk not in (select object_id from "+apexShema+".wwv_flow_lock_page where flow_id = s.flow_id and locked_by = s.flow_user)"
                + "order by s.audit_date desc) " + "select distinct "
                + "max(change_id) over(partition by object_id) change_id, "
                + "max(app_id) over(partition by object_id) app_id, "
                + "max(object_name) over(partition by object_id) object_name, "
                + "max(flow_table) over(partition by object_id) flow_table, "
                + "max(object_id) over(partition by object_id) object_id " + "from a where cnt = 1 order by 1 desc ";

                System.out.println(selectChanges);
        java.util.TimerTask task = new java.util.TimerTask() {
            @Override
            public void run() {
                try {

                    PreparedStatement st;
                    CallableStatement cs;
                    ResultSet rs;

                    // -- last change_id --

                    if (changeId == null) {
                        st = conn.prepareStatement(lastChangeId);
                        st.setString(1, appUser);
                        st.setString(2, appWorkspace);
                        rs = st.executeQuery();
                        while (rs.next()) {
                            changeId = rs.getString("CHANGE_ID");
                        }
                        rs.close();
                        st.close();
                        System.out.println("Change ID: " + changeId);

                    }

                    // --- select changes ---
                    st = conn.prepareStatement(selectChanges);
                    st.setString(1, appUser);
                    st.setString(2, appWorkspace);
                    st.setString(3, changeId);

                    rs = st.executeQuery();
                    while (rs.next()) {
                        String appId = rs.getString("APP_ID");
                        String objectName = rs.getString("OBJECT_NAME");
                        String objectId = rs.getString("OBJECT_ID");
                        changeId = rs.getString("CHANGE_ID");
                        String flowTable = rs.getString("FLOW_TABLE");

                        cs = conn.prepareCall(exportScript);

                        if (flowTable.equals("WWV_FLOW_STEPS")) {
                            cs.setString("object_name", "PAGE:" + objectId);
                        }

                        if (flowTable.equals("WWV_FLOW_LISTS_OF_VALUES$")) {
                            cs.setString("object_name", "LOV:" + objectId);
                        }

                        cs.setString("app_id", appId);
                        cs.registerOutParameter("page_script", Types.CLOB);

                        cs.execute();
                        String pageScript = cs.getString("page_script");
                        cs.close();

                        String fileName = objectName.toLowerCase() + ".sql";

                        if (flowTable.equals("WWV_FLOW_STEPS")) {
                            fileName = "./f" + appId + "/application/pages/page_"
                                    + String.format("%05d", Integer.valueOf(objectId)) + ".sql";
                        }

                        if (flowTable.equals("WWV_FLOW_LISTS_OF_VALUES$")) {
                            fileName = "./f" + appId + "/application/shared_components/user_interface/lovs/"
                                    + objectName.toLowerCase() + ".sql";
                        }
                        FileWriter fileWriter;
                        try {
                            fileWriter = new FileWriter(fileName);

                        } catch (Exception e) {
                            System.out.println("The files of the exported application (application " + appId
                                    + ") were not found! Please export the application from apex (zip) and unpack it into the current directory.");
                            System.out.println("The new version of the page will be written in " + fileName);
                            return;
                        }
                        PrintWriter printWriter = new PrintWriter(fileWriter);

                        printWriter.print(pageScript);
                        printWriter.close();
                        System.out.println("Loaded file: " + fileName);

                    }
                    rs.close();
                    st.close();

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        };

        java.util.Timer timer = new java.util.Timer(true);// true to run timer as daemon thread
        timer.schedule(task, 0, intervalSec * 1000);// Run task every n second

        try {
            Thread.sleep(60 * 1000 * 60 * 24); // Cancel task after 24 hourse.
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        timer.cancel();

    }
}
