package main;

import static main.Util.*;

import java.io.BufferedReader;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.*;


public class App {
    static String lockId;
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

        appUser =  GetPropertyValue("apex.user","Enter the APEX user, this should be the developer's login",consReader);
        appWorkspace =  GetPropertyValue("apex.workspace","Enter the name of the APEX workspace you want to monitor",consReader);
        apexShema =  GetPropertyValue("apex.shema","Enter shema name where APEX is installed (APEX_XXXXXX)",consReader);
        dbHost =  GetPropertyValue("database.host","Enter the host where the database is installed",consReader);
        dbPort =  GetPropertyValue("database.port","Enter the port the database is using",consReader);
        dbServiceName =  GetPropertyValue("database.servicename","Enter the Database service name",consReader);
        dbUser =  GetPropertyValue("database.user","Enter the name of the database user who has read and write privileges to the APEX_" + apexShema  + "  schema. (It could be SYSTEM) ",consReader);
        dbPassword = GetPasswordProperty("database.password","Enter the password to connect to the database",consReader);
        String intervalSecStr  =  GetPropertyValue("util.interval","Set the refresh interval in seconds (Recommended value - 5 sec)",consReader);

        if (intervalSecStr == null) {
            intervalSec = 5;
        } else {
            intervalSec = Integer.valueOf(intervalSecStr);
        }
        
        lockId = props.getProperty("util.lockId");
        if (lockId == null) {
            lockId = "0";
            SetProperty( "util.lockId", lockId);
        }
        System.out.println("Start lockID: " + lockId);

        // load driver
        Class.forName("oracle.jdbc.OracleDriver");
        System.out.println("Oracle JDBC driver loaded ok.");
        Connection conn = DriverManager.getConnection(
                "jdbc:oracle:thin:" + dbUser + "/" + dbPassword + "@" + dbHost + ":" + dbPort + "/" + dbServiceName);
        System.out.println("Connected to DB");
        // ------------------------------------------------------------------------------------------------------------------

        String selectLockedPages = "SELECT lock_id,lock_flow APP_ID,lock_page PAGE_ID FROM " + apexShema
                + ".wwv_flow_lock_page_log " + "WHERE "
                + "lock_id IN ( SELECT MAX(lock_id) OVER(PARTITION BY lock_flow, lock_page ORDER BY lock_id DESC) lock_id "
                + "FROM " + apexShema + ".wwv_flow_lock_page_log "
                + "WHERE developer = ? AND lock_id > ? AND action = 'UNLOCK' "
                + ") and action = 'UNLOCK' order by lock_id";

        String exportPageScript = "DECLARE v_files  apex_t_export_files; v_components  apex_t_varchar2 := apex_t_varchar2(); "
                + "BEGIN  v_components.extend(1); v_components(1) := 'PAGE:' || :page_id; "
                + "v_files := apex_export.get_application(p_application_id => :app_id, p_components => v_components); "
                + ":page_script := v_files(1).contents; END;";

        String selectPageChanges = "select s.id page_id, s.flow_id application_id,f.workspace_id from " + apexShema
                + ".wwv_flow_steps s join " + apexShema + ".wwv_flow_authorized f on s.flow_id = f.application_id "
                + "where s.last_updated_on >= sysdate  - interval '" + intervalSec + "' second "
                + "and s.last_updated_by = ? and f.workspace = ? " + "and s.id not in (select object_id from "
                + apexShema + ".wwv_flow_lock_page where flow_id = s.flow_id) "
                + "and s.id not in (select lock_page from " + apexShema
                + ".wwv_flow_lock_page_log where lock_flow = s.flow_id and action_date >= sysdate  - interval '"
                + intervalSec + "' second  ) " + "order by s.last_updated_on desc ";

        String lockPageScript = "begin insert into " + apexShema
                + ".wwv_flow_lock_page(flow_id,object_id,locked_by,locked_on,security_group_id) "
                + "values(:app_id,:page_id,:app_user,sysdate,:workspace_id); commit; "
                + "exception when others then null; end;";

        java.util.TimerTask task = new java.util.TimerTask() {
            @Override
            public void run() {
                try {

                    PreparedStatement st;
                    CallableStatement cs;
                    ResultSet rs;

                    st = conn.prepareStatement(selectLockedPages);
                    st.setString(1, appUser);
                    st.setString(2, lockId);

                    rs = st.executeQuery();
                    while (rs.next()) {
                        Integer appId = rs.getInt("APP_ID");
                        Integer pageId = rs.getInt("PAGE_ID");
                        lockId = rs.getString("LOCK_ID");

                        cs = conn.prepareCall(exportPageScript);
                        cs.setInt("page_id", pageId);
                        cs.setInt("app_id", appId);
                        cs.registerOutParameter("page_script", Types.CLOB);

                        cs.execute();
                        String pageScript = cs.getString("page_script");
                        cs.close();

                        String fileName = "./f" + appId + "/application/pages/page_" + String.format("%05d", pageId)
                                + ".sql";
                                FileWriter fileWriter;
                                try {
                            fileWriter = new FileWriter(fileName);
                            
                        } catch (Exception e) {
                            System.out.println("The files of the exported application (application "+appId+ ") were not found! Please export the application from apex (zip) and unpack it into the current directory.");
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

                    if (lockId != null) {
                        SetProperty("util.lockId", lockId);
                    }

                    st = conn.prepareStatement(selectPageChanges);
                    st.setString(1, appUser);
                    st.setString(2, appWorkspace);
                    rs = st.executeQuery();
                    while (rs.next()) {
                        Integer appId = rs.getInt("APPLICATION_ID");
                        Integer pageId = rs.getInt("PAGE_ID");
                        BigDecimal workspaceId = rs.getBigDecimal("WORKSPACE_ID");

                        System.out.println("Unblocked page found. " + "Application " + appId + ", page " + pageId);

                        cs = conn.prepareCall(lockPageScript);
                        cs.setInt(":app_id", appId);
                        cs.setInt(":page_id", pageId);
                        cs.setString(":app_user", appUser);
                        cs.setBigDecimal(":workspace_id", workspaceId);
                        cs.execute();
                        cs.close();
                        System.out.println("Application " + appId + ", page " + pageId + " locked");
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
