package main;

public class Apex {

    static String convertObjectNametoFileName(String objectName) {

        String lRes = objectName.toLowerCase();
        lRes = lRes.replace(" ", "_");
        return lRes;
    }

    public static ApexFile getFileName(String appId, String flowTable, String objectId, String objectName) {
        String fileName = null;
        String dirName = null;

        switch (flowTable) {

        case ("WWV_FLOW_STEPS"):
            dirName = "f" + appId + "/application/pages";
            fileName = "page_" + String.format("%05d", Integer.valueOf(objectId)) + ".sql";
            break;
        case ("WWV_FLOW_LISTS_OF_VALUES$"):
            dirName = "f" + appId + "/application/shared_components/user_interface/lovs";
            fileName = objectName.toLowerCase() + ".sql";
            break;
        case ("WWV_FLOW_LISTS"):
            dirName = "f" + appId + "/application/shared_components/navigation/lists";
            fileName = convertObjectNametoFileName(objectName) + ".sql";
            break;

        case ("WWV_FLOW_ITEMS"):
            dirName = "f" + appId + "/application/shared_components/logic/application_items";
            fileName = convertObjectNametoFileName(objectName) + ".sql";
            break;
        case ("WWV_FLOW_PROCESSING"):
            dirName = "f" + appId + "/application/shared_components/logic/application_processes";
            fileName = convertObjectNametoFileName(objectName) + ".sql";
            break;
        case ("WWV_FLOW_COMPUTATIONS"):
            dirName = "f" + appId + "/application/shared_components/logic/application_computations";
            fileName = convertObjectNametoFileName(objectName) + ".sql";
            break;
        case ("WWV_FLOW_AUTHENTICATIONS"):
            dirName = "f" + appId + "/application/shared_components/security/authentications";
            fileName = convertObjectNametoFileName(objectName) + ".sql";
            break;
        case ("WWV_FLOW_SECURITY_SCHEMES"):
            dirName = "f" + appId + "/application/shared_components/security/authorizations";
            fileName = convertObjectNametoFileName(objectName) + ".sql";
            break;

        case ("WWV_FLOW_MESSAGES$"):
            dirName = "f" + appId + "/application/shared_components/globalization";
            fileName = "messages.sql";
            break;

        case ("WWV_FLOWS"):
            dirName = "f" + appId + "/application";
            fileName = "create_application.sql";
            break;
        }

        ApexFile apexfile = new ApexFile(fileName, dirName);
        return apexfile;
    }
}
