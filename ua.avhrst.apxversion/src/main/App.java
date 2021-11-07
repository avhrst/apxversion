package main;

import static main.Util.*;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.sql.*;

import oracle.jdbc.pool.OracleDataSource;

public class App {
    static String changeId;
    static String branchName;
    static String apexUserName;
    static String apexWorkspace;
    static String apexInstalledShema;
    static String dbHost;
    static String dbPort;
    static String dbServiceName;
    static String dbSystemUser;
    static String dbApexUser;
    static String dbSystemUserPassword;
    static String dbApexUserPassword;
    static Integer intervalSec;
    static String changeIdFormat = "'YYYYMMDDHH24MISS'";
    static String mainPath;

    public static void main(String[] args) throws Exception {

        // Enter data using BufferReader
        BufferedReader consReader = new BufferedReader(new InputStreamReader(System.in));

        // Read property file
        try {
            Util.ReadPropertyFile();
        } catch (Exception e) {
            Util.NewPropertyFile();
        }

        mainPath = GetPropertyValue("apex.folder", "Enter the APEX app folder path (local path) ", consReader);
        dbHost = GetPropertyValue("database.host", "Enter the host where the database is installed", consReader);
        dbPort = GetPropertyValue("database.port", "Enter the port the database is using", consReader);
        dbServiceName = GetPropertyValue("database.servicename", "Enter the Database service name", consReader);
        apexInstalledShema = GetPropertyValue("apex.shema", "Enter shema name where APEX is installed (APEX_XXXXXX)",
                consReader).toUpperCase();
        dbSystemUser = GetPropertyValue("database.system.user",
                "Enter the name of the database user who has read and write privileges to the " + apexInstalledShema
                        + "  schema. (It could be SYSTEM) ",
                consReader).toUpperCase();
        dbSystemUserPassword = GetPasswordProperty("database.system.password",
                "Enter the password for user " + dbSystemUser, consReader);

        apexWorkspace = GetPropertyValue("apex.workspace", "Enter the name of the APEX workspace you want to monitor",
                consReader).toUpperCase();

        apexUserName = GetPropertyValue("apex.user", "Enter the APEX user, this should be the developer's login",
                consReader).toUpperCase();
        dbApexUser = GetPropertyValue("database.apex.user",
                "Enter the name of the database user who has read and write privileges to the (" + apexWorkspace
                        + ") WORKSPACE schema.",
                consReader).toUpperCase();
        dbApexUserPassword = GetPasswordProperty("database.apex.password", "Enter the password for user " + dbApexUser,
                consReader);

        String intervalSecStr = GetPropertyValue("util.interval",
                "Set the refresh interval in seconds (Recommended value - 5 sec)", consReader);

        if (intervalSecStr == null) {
            intervalSec = 5;
        } else {
            intervalSec = Integer.valueOf(intervalSecStr);
        }

        System.out.println("APEX file local path: " + mainPath);

       // changeId = props.getProperty("util.changeId");
       if (changeId != null) {
            System.out.println("Change ID: " + changeId);
        }

        // load driver
        Class.forName("oracle.jdbc.OracleDriver");
        System.out.println("Oracle JDBC driver loaded ok.");
        String jdbcUrl = "jdbc:oracle:thin:@" + dbHost + ":" + dbPort + "/" + dbServiceName;

        OracleDataSource ds = new OracleDataSource();
        ds.setURL(jdbcUrl);
        Connection conn = ds.getConnection(dbSystemUser, dbSystemUserPassword);
        Connection conn2 = ds.getConnection(dbApexUser, dbApexUserPassword);
        System.out.println("Connected to DB");
        // ------------------------------------------------------------------------------------------------------------------

        String lastChangeId = "select to_char(max(s.audit_date)," + changeIdFormat + ") change_id " + "from "
                + apexInstalledShema + ".wwv_flow_builder_audit_trail s join " + apexInstalledShema
                + ".wwv_flow_authorized f ON s.flow_id = f.application_id "
                + "where s.flow_user = ? and f.workspace = ?";

        String exportScript = "DECLARE v_files  apex_t_export_files; v_components  apex_t_varchar2 := apex_t_varchar2(); "
                + "v_app_id varchar2(10);  v_file_name varchar2(1024); "
                + "BEGIN  v_components.extend(1); v_app_id := :app_id; v_file_name :=  :file_name;  "
                + "v_files := apex_export.get_application(p_application_id => v_app_id, p_split => true); "
                + "for i in 1..v_files.count loop  " + "case v_files(i).name  "
                + "when v_file_name then :page_script := v_files(i).contents;  "
                + "when 'f'||v_app_id|| '/install.sql'  then :install_script := v_files(i).contents;  "
                + "else null; end case; end loop; END;";

        String selectChanges = "with a as ( "
                + "select s.audit_date,s.flow_id app_id,object_name,s.flow_table, s.flow_table_pk object_id, "
                + "s.SECURITY_GROUP_ID workspace_id,COUNT(s.id) OVER (PARTITION BY s.scn) cnt  FROM "
                + apexInstalledShema + ".wwv_flow_builder_audit_trail s join " + apexInstalledShema
                + ".wwv_flow_authorized f ON s.flow_id = f.application_id "
                + "where s.flow_user = ? and f.workspace = ? and s.audit_date > to_date(?," + changeIdFormat + ") and "
                + "s.flow_table not in ('WWV_FLOW_LIST_ITEMS','WWV_FLOW_MENU_OPTIONS') and "
                + "s.flow_table_pk not in (select object_id from " + apexInstalledShema
                + ".wwv_flow_lock_page where flow_id = s.flow_id and locked_by = s.flow_user)"
                + "order by s.audit_date desc) " + "select a1.*, to_char(a1.audit_date," + changeIdFormat
                + ") change_id, " + "(select count(*) from " + apexInstalledShema
                + ".wwv_flow_lock_page_log where action_date > a1.audit_date - interval '1' second "
                + "and ACTION = 'UNLOCK' and lock_flow = a1.app_id and lock_page = a1.object_id) is_unlock "
                + "from (select distinct " + "max(audit_date) over(partition by object_id) audit_date, "
                + "max(app_id) over(partition by object_id) app_id, "
                + "max(object_name) over(partition by object_id) object_name, "
                + "max(flow_table) over(partition by object_id) flow_table, "
                + "max(object_id) over(partition by object_id) object_id, "
                + "max(workspace_id) over(partition by object_id) workspace_id "
                + "from a where cnt = 1 order by 1 desc) a1 ";

                System.out.println(selectChanges);
        String lockPageScript = "begin insert into " + apexInstalledShema
                + ".wwv_flow_lock_page(flow_id,object_id,locked_by,locked_on,security_group_id) "
                + "values(:app_id,:page_id,:app_user,sysdate,:workspace_id); commit; "
                + "exception when others then null; end;";

        java.util.TimerTask task = new java.util.TimerTask() {
            @Override
            public void run() {
                try {
                    PreparedStatement st;
                    CallableStatement cs;
                    CallableStatement cs2;
                    ResultSet rs;
                    // -- last change_id --
                    if (changeId == null) {
                        st = conn.prepareStatement(lastChangeId);
                        st.setString(1, apexUserName);
                        st.setString(2, apexWorkspace);
                        rs = st.executeQuery();
                        while (rs.next()) {
                            changeId = rs.getString("CHANGE_ID");
                        }
                        rs.close();
                        st.close();
                        System.out.println("Loaded Change ID: " + changeId);
                    }

                    // --- select changes ---
                    st = conn.prepareStatement(selectChanges);
                    st.setString(1, apexUserName);
                    st.setString(2, apexWorkspace);
                    st.setString(3, changeId);

                    rs = st.executeQuery();
                    while (rs.next()) {
                        String appId = rs.getString("APP_ID");
                        String objectName = rs.getString("OBJECT_NAME");
                        String objectId = rs.getString("OBJECT_ID");
                        changeId = rs.getString("CHANGE_ID");
                        String flowTable = rs.getString("FLOW_TABLE");
                        String workspaceId = rs.getString("WORKSPACE_ID");
                        int isUnlock = rs.getInt("IS_UNLOCK");               

                        System.out.println("Type: " + flowTable + " for object: " + objectName + " changed ");
                        ApexFile apexFile = Apex.getFileName(appId, flowTable, objectId, objectName);

                        String fileName = apexFile.getFileName();
                        String dirName = apexFile.getDirName();

                        cs = conn2.prepareCall(exportScript);
                        cs.setString("app_id", appId);
                        cs.setString("file_name", dirName + "/" + fileName);

                        if (flowTable.equals("WWV_FLOW_STEPS")) {
                            if (isUnlock == 0) {
                                System.out.println(
                                        "Unblocked page found. " + "Application " + appId + ", page " + objectId);

                                cs2 = conn.prepareCall(lockPageScript);
                                cs2.setString(":app_id", appId);
                                cs2.setString(":page_id", objectId);
                                cs2.setString(":app_user", apexUserName);
                                cs2.setString(":workspace_id", workspaceId);
                                cs2.execute();
                                cs2.close();
                                System.out.println("Application " + appId + ", page " + objectId + " locked");
                            }
                        }
                        cs.registerOutParameter("page_script", Types.CLOB);
                        cs.registerOutParameter("install_script", Types.CLOB);
                        cs.execute();
                        String pageScript = cs.getString("page_script");
                        String installScript = cs.getString("install_script");
                        cs.close();

                        
                        if (fileName != null) {
                            saveFile(appId, dirName, fileName, pageScript);
                        }
                        saveFile(appId, "f" + appId, "install.sql", installScript);

                    }
                    rs.close();
                    st.close();

                    if (changeId != null) {
                        SetProperty("util.changeId", changeId);
                    }
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
