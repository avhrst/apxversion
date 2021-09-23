package main;
import static main.Util.*;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.*;
import java.util.Properties;
import javax.crypto.spec.SecretKeySpec;

import org.jasypt.util.text.BasicTextEncryptor;

public class App {

    static String lockId;
    static String branchName;
    static SecretKeySpec key;

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

        File propertiesFile = new File("config.properties");
        Properties props = new Properties();

         String secretKey = "PI31415926";
      
        // Enter data using BufferReader
        BufferedReader consReader = new BufferedReader(new InputStreamReader(System.in));

        // Read properties from disk
        FileReader reader = new FileReader(propertiesFile);
        props.load(reader);
        reader.close();

        appUser = props.getProperty("apex.user");
        if (appUser == null) {
            System.out.println("Enter the APEX user");
            appUser = consReader.readLine();
            SetProperty(propertiesFile, props, "apex.user", appUser);
        }

        appWorkspace = props.getProperty("apex.workspace");
        if (appWorkspace == null) {
            System.out.println("Enter the APEX workspace");
            appWorkspace = consReader.readLine();
            SetProperty(propertiesFile, props, "apex.workspace", appWorkspace);
        }

        apexShema = props.getProperty("apex.shema");
        if (apexShema == null) {
            System.out.println("Enter the APEX shema (APEX_XXXXXX)");
            apexShema = consReader.readLine();
            SetProperty(propertiesFile, props, "apex.shema", apexShema);
        }

        dbHost = props.getProperty("database.host");
        if (dbHost == null) {
            System.out.println("Enter the Database host");
            dbHost = consReader.readLine();
            SetProperty(propertiesFile, props, "database.host", dbHost);
        }

        dbPort = props.getProperty("database.port");
        if (dbPort == null) {
            System.out.println("Enter the Database port");
            dbPort = consReader.readLine();
            SetProperty(propertiesFile, props, "database.port", dbPort);
        }

        dbServiceName = props.getProperty("database.servicename");
        if (dbServiceName == null) {
            System.out.println("Enter the Database service name");
            dbServiceName = consReader.readLine();
            SetProperty(propertiesFile, props, "database.servicename", dbServiceName);
        }

        dbUser = props.getProperty("database.user");
        if (dbUser == null) {
            System.out.println("Enter the Database user name");
            dbUser = consReader.readLine();
            SetProperty(propertiesFile, props, "database.user", dbUser);
        }

        String encryptedPassword = props.getProperty("database.password");
        BasicTextEncryptor textEncryptor = new BasicTextEncryptor();
        textEncryptor.setPassword(secretKey);
        if (encryptedPassword == null) {
            System.out.println("Enter the password to connect to the database");
            dbPassword = consReader.readLine();
             encryptedPassword = textEncryptor.encrypt(dbPassword);
            SetProperty(propertiesFile, props, "database.password", encryptedPassword);
        } else {

             dbPassword = textEncryptor.decrypt(encryptedPassword);
        }

        String intervalSecStr = props.getProperty("util.interval");
        if (intervalSecStr == null) {
            intervalSec = 5;
            SetProperty(propertiesFile, props, "util.interval", intervalSec.toString());
        } else {

            intervalSec = Integer.valueOf(intervalSecStr);
        }
        lockId = props.getProperty("util.lockId");
        if (lockId == null) {
            lockId = "0";
            SetProperty(propertiesFile, props, "util.lockId", lockId);
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
                        FileWriter fileWriter = new FileWriter(fileName);
                        PrintWriter printWriter = new PrintWriter(fileWriter);

                        printWriter.print(pageScript);
                        printWriter.close();
                        System.out.println("Loaded file: " + fileName);
                    }
                    rs.close();
                    st.close();

                    if (lockId != null) {
                        SetProperty(propertiesFile, props, "util.lockId", lockId);
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
