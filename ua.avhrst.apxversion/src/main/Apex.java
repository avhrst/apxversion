package main;

public class Apex {

    static String listOfFlowObject = "'WWV_FLOW_LISTS_OF_VALUES$','WWV_FLOW_STEPS','WWV_FLOW_LISTS'";

    public static String getObjectName(String flowTable, String objectId) {
        String lRes = objectId;
        switch (flowTable) {

        case ("WWV_FLOW_STEPS"):
            lRes = "PAGE:" + objectId;
            break;
        case ("WWV_FLOW_LISTS_OF_VALUES$"):
            lRes = "LOV:" + objectId;
            break;
        case ("WWV_FLOW_LISTS"):
            lRes = "LIST:" + objectId;
            break;

        }

        return lRes;
    }

    static String convertObjectNametoFileName(String objectName) {

        String lRes = objectName.toLowerCase();
        lRes = lRes.replace(" ", "_");
        return lRes;
    }

    public static String getFileName(String appId, String flowTable, String objectId, String objectName) {
        String fileName = objectName.toLowerCase() + ".sql";
        switch (flowTable) {

        case ("WWV_FLOW_STEPS"):
            fileName = "./f" + appId + "/application/pages/page_" + String.format("%05d", Integer.valueOf(objectId))
                    + ".sql";
            break;
        case ("WWV_FLOW_LISTS_OF_VALUES$"):
            fileName = "./f" + appId + "/application/shared_components/user_interface/lovs/" + objectName.toLowerCase()
                    + ".sql";
            break;

        case ("WWV_FLOW_LISTS"):
            fileName = "./f" + appId + "/application/shared_components/navigation/lists/"
                    + convertObjectNametoFileName(objectName) + ".sql";
            break;

        }
        return fileName;
    }
}
