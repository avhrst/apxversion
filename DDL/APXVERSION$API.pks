CREATE OR REPLACE PACKAGE APXVERSION$API AS
 /******************************************************************************
       NAME:       APXVERSION$API
       PURPOSE:

       REVISIONS:
       Ver        Date        Author           Description
       ---------  ----------  ---------------  ------------------------------------
       1.0        8/20/2022      avhrs       1. Created this package.
    ******************************************************************************/
    A_            APXVERSION$APP%ROWTYPE;
    U_            APXVERSION$USERS%ROWTYPE;
    G_BASE_URL    VARCHAR2 (255) := 'https://api.github.com';
    G_EXPORT_TYPE VARCHAR2 (50) := 'READABLE_JSON';
    FUNCTION USER_PROFILE (
        P_USER IN VARCHAR2
    ) RETURN CLOB;
    PROCEDURE VERSIONING_WORKSPACE;
END APXVERSION$API;
/