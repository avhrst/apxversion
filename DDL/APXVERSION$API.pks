CREATE OR REPLACE PACKAGE APXVERSION$API
AS
    /******************************************************************************
       NAME:       APXVERSION$API
       PURPOSE:

       REVISIONS:
       Ver        Date        Author           Description
       ---------  ----------  ---------------  ------------------------------------
       1.0        8/20/2022      avhrs       1. Created this package.
    ******************************************************************************/

    a_              APXVERSION$APP%ROWTYPE;
    u_              APXVERSION$USERS%ROWTYPE;

    g_base_url      VARCHAR2 (255) := 'https://api.github.com';
    g_export_type   VARCHAR2 (50) := 'READABLE_JSON';

    FUNCTION user_profile (p_user IN VARCHAR2)
        RETURN CLOB;


    PROCEDURE versioning_workspace;
END APXVERSION$API;
/
