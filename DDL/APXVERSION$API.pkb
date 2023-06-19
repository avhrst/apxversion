CREATE OR REPLACE PACKAGE BODY APXVERSION$API AS
 /******************************************************************************
       NAME:       APXVERSION$API
       PURPOSE:

       REVISIONS:
       Ver        Date        Author           Description
       ---------  ----------  ---------------  ------------------------------------
       1.0        8/20/2022      avhrs       1. Created this package body.
    ******************************************************************************/
    FUNCTION ENCODEBASE64 (
        INCLEARCHAR IN OUT NOCOPY CLOB
    ) RETURN CLOB IS
        DEST_LOB     BLOB;
        LANG_CONTEXT INTEGER := DBMS_LOB.DEFAULT_LANG_CTX;
        DEST_OFFSET  INTEGER := 1;
        SRC_OFFSET   INTEGER := 1;
        READ_OFFSET  INTEGER := 1;
        WARNING      INTEGER;
        CLOBLEN      INTEGER := DBMS_LOB.GETLENGTH (INCLEARCHAR);
        AMOUNT       INTEGER := 1440; -- must be a whole multiple of 3
 -- size of a whole multiple of 48 is beneficial to get NEW_LINE after each 64 characters
        BUFFER       RAW (1440);
        RES          CLOB := EMPTY_CLOB ();
    BEGIN
        IF INCLEARCHAR IS NULL OR NVL (CLOBLEN, 0) = 0 THEN
            RETURN NULL;
        ELSIF CLOBLEN <= 24000 THEN
            RES := UTL_RAW.CAST_TO_VARCHAR2 ( UTL_ENCODE.BASE64_ENCODE ( UTL_RAW.CAST_TO_RAW (INCLEARCHAR)));
            RES := REPLACE (REPLACE (RES, CHR (13), NULL), CHR (10), NULL);
            RETURN RES;
        END IF;
 -- UTL_ENCODE.BASE64_ENCODE is limited to 32k/(3/4), process in chunks if bigger
        DBMS_LOB.CREATETEMPORARY (DEST_LOB, TRUE);
        DBMS_LOB.CONVERTTOBLOB (DEST_LOB, INCLEARCHAR, DBMS_LOB.LOBMAXSIZE, DEST_OFFSET, SRC_OFFSET, DBMS_LOB.DEFAULT_CSID, LANG_CONTEXT, WARNING);
        LOOP
            EXIT WHEN READ_OFFSET >= DEST_OFFSET;
            DBMS_LOB.READ (DEST_LOB, AMOUNT, READ_OFFSET, BUFFER);
            RES := RES
                || UTL_RAW.CAST_TO_VARCHAR2 ( UTL_ENCODE.BASE64_ENCODE (BUFFER));
            READ_OFFSET := READ_OFFSET + AMOUNT;
        END LOOP;
        DBMS_LOB.FREETEMPORARY (DEST_LOB);
        RES := REPLACE (REPLACE (RES, CHR (13), NULL), CHR (10), NULL);
        RETURN RES;
    END ENCODEBASE64;
    FUNCTION ORA_HASH_CLOB (
        P_CLOB IN CLOB
    ) RETURN CLOB IS
        TYPE T_ORA_HASH_TAB IS
            TABLE OF NUMBER INDEX BY BINARY_INTEGER;
        L_ORA_HASH_TAB      T_ORA_HASH_TAB;
        L_LINE              VARCHAR2 (4000);
        L_ORA_HASH_KEY      NUMBER;
        L_ORA_HASH_CLOB_KEY CLOB;
    BEGIN
        FOR I IN 1 .. CEIL (LENGTH (P_CLOB) / 4000) LOOP
            L_LINE := TO_CHAR (SUBSTR (P_CLOB, (I - 1) * 4000 + 1, 4000));
            SELECT
                ORA_HASH (L_LINE) INTO L_ORA_HASH_KEY
            FROM
                DUAL;
            L_ORA_HASH_TAB (I) := L_ORA_HASH_KEY;
        END LOOP;
        FOR I IN 1 .. L_ORA_HASH_TAB.COUNT LOOP
            L_ORA_HASH_CLOB_KEY := L_ORA_HASH_CLOB_KEY
                || TO_CLOB (L_ORA_HASH_TAB (I));
        END LOOP;
        RETURN L_ORA_HASH_CLOB_KEY;
    END;
    PROCEDURE SET_HEADERS AS
    BEGIN
        APEX_WEB_SERVICE.G_REQUEST_HEADERS (1).NAME := 'User-Agent';
        APEX_WEB_SERVICE.G_REQUEST_HEADERS (1).VALUE := 'oracle-db';
        APEX_WEB_SERVICE.G_REQUEST_HEADERS (2).NAME := 'Authorization';
        APEX_WEB_SERVICE.G_REQUEST_HEADERS (2).VALUE := 'Bearer '
            || U_.GIT_TOKEN;
    END;
    FUNCTION USER_PROFILE (
        P_USER IN VARCHAR2
    ) RETURN CLOB AS
        L_REQUEST_URL VARCHAR2 (1024);
        L_RESULT      CLOB;
    BEGIN
        L_REQUEST_URL := G_BASE_URL
            || '/users/'
            || P_USER;
        SET_HEADERS;
        L_RESULT := APEX_WEB_SERVICE.MAKE_REST_REQUEST (P_URL => L_REQUEST_URL, P_HTTP_METHOD => 'GET');
        RETURN L_RESULT;
    END;
    FUNCTION GET_FILE_SHA (
        P_FILE_NAME IN VARCHAR2
    ) RETURN VARCHAR2 AS
        L_REQUEST_URL VARCHAR2 (1024);
        L_RESULT      CLOB;
        L_STATUS_CODE INT;
    BEGIN
        L_REQUEST_URL := G_BASE_URL
            || '/repos/'
            || U_.GIT_USER
            || '/'
            || A_.APP_REPO
            || '/contents/'
            || P_FILE_NAME;
        SET_HEADERS;
        APEX_WEB_SERVICE.G_REQUEST_HEADERS (3).NAME := 'Content-Type';
        APEX_WEB_SERVICE.G_REQUEST_HEADERS (3).VALUE := 'application/json';
        L_RESULT := APEX_WEB_SERVICE.MAKE_REST_REQUEST (P_URL => L_REQUEST_URL, P_HTTP_METHOD => 'GET');
        L_STATUS_CODE := APEX_WEB_SERVICE.G_STATUS_CODE;
        IF L_STATUS_CODE = 200 THEN
            APEX_JSON.PARSE (L_RESULT);
            RETURN APEX_JSON.GET_VARCHAR2 (
                P_PATH => 'sha'
            );
        END IF;
        RETURN NULL;
    END;
    PROCEDURE PUSH_FILE (
        P_FILE_NAME IN VARCHAR2,
        P_FILE IN CLOB
    ) AS
        L_REQUEST_URL VARCHAR2 (1024);
        L_RESULT      CLOB;
        L_BASE64      CLOB;
        L_JSON        CLOB;
        L_STATUS_CODE INT;
        L_SHA         VARCHAR2 (255);
        L_FILE_CLOB   CLOB := P_FILE;
    BEGIN
        L_SHA := GET_FILE_SHA (P_FILE_NAME => P_FILE_NAME);
        L_REQUEST_URL := G_BASE_URL
            || '/repos/'
            || U_.GIT_USER
            || '/'
            || A_.APP_REPO
            || '/contents/'
            || P_FILE_NAME;
        L_BASE64 := ENCODEBASE64 (INCLEARCHAR => L_FILE_CLOB);
        APEX_JSON.INITIALIZE_CLOB_OUTPUT;
        APEX_JSON.OPEN_OBJECT;
        APEX_JSON.WRITE ('message', 'commit '
            || P_FILE_NAME);
        APEX_JSON.WRITE ('content', L_BASE64);
        APEX_JSON.WRITE ('sha', L_SHA);
        APEX_JSON.CLOSE_OBJECT;
        L_JSON := APEX_JSON.GET_CLOB_OUTPUT;
        APEX_JSON.FREE_OUTPUT;
        SET_HEADERS;
        APEX_WEB_SERVICE.G_REQUEST_HEADERS (3).NAME := 'Content-Type';
        APEX_WEB_SERVICE.G_REQUEST_HEADERS (3).VALUE := 'application/json';
        L_RESULT := APEX_WEB_SERVICE.MAKE_REST_REQUEST (P_URL => L_REQUEST_URL, P_HTTP_METHOD => 'PUT', P_BODY => L_JSON);
        L_STATUS_CODE := APEX_WEB_SERVICE.G_STATUS_CODE;
 --       IF l_status_code = 200
 --      THEN
 --      END IF;
 --  exception when others then
 --  null;
        DBMS_OUTPUT.PUT_LINE (L_RESULT);
    END;
    FUNCTION IS_EXIST_APXVERSION_FILE (
        P_FILE_NAME IN VARCHAR2
    ) RETURN BOOLEAN AS
        L_EX INT;
    BEGIN
        SELECT
            COUNT (*) INTO L_EX
        FROM
            APXVERSION$FILES
        WHERE
            REPO_NAME = A_.APP_REPO
            AND BRANCH_NAME = A_.APP_BRANCH
            AND FILE_NAME = P_FILE_NAME;
        IF L_EX = 1 THEN
            RETURN TRUE;
        END IF;
        RETURN FALSE;
    END;
    PROCEDURE GET_FILE_INFO (
        R_ IN OUT APXVERSION$FILES%ROWTYPE
    ) AS
        L_PAGE_ID INT;
    BEGIN
        IF INSTR (R_.FILE_NAME, '/application/pages/') != 0 THEN
            BEGIN
                L_PAGE_ID := TO_NUMBER ( SUBSTR ( R_.FILE_NAME, INSTR (R_.FILE_NAME, '/application/pages/') + 20, 5));
                SELECT
                    DISTINCT MAX (DEVELOPER) KEEP (DENSE_RANK LAST
                ORDER BY
                    AUDIT_DATE) OVER () DEVELOPER,
                    MAX (AUDIT_DATE) KEEP (DENSE_RANK LAST
                ORDER BY
                    AUDIT_DATE) OVER () AUDIT_DATE INTO R_.DEVELOPER,
                    R_.AUDIT_DATE
                FROM
                    APEX_DEVELOPER_ACTIVITY_LOG
                WHERE
                    APPLICATION_ID = A_.APP_ID
                    AND PAGE_ID = L_PAGE_ID;
            EXCEPTION
                WHEN OTHERS THEN
                    NULL;
            END;
        END IF;
        IF R_.DEVELOPER IS NULL THEN
            R_.DEVELOPER := A_.DEVELOPER;
            R_.AUDIT_DATE := A_.AUDIT_DATE;
        END IF;
        SELECT
            * INTO U_
        FROM
            APXVERSION$USERS
        WHERE
            USER_NAME = R_.DEVELOPER;
    END;
    PROCEDURE EXPORT_APP AS
        L_FILES     APEX_T_EXPORT_FILES;
        L_CONTENT   CLOB;
        R_          APXVERSION$FILES%ROWTYPE;
        L_FILE_NAME VARCHAR2 (1024);
        L_FILE_HASH VARCHAR2 (255);
        L_NEW       BOOLEAN;
    BEGIN
        L_FILES := APEX_EXPORT.GET_APPLICATION (P_APPLICATION_ID => A_.APP_ID, P_SPLIT => TRUE, P_WITH_DATE => FALSE, P_TYPE => G_EXPORT_TYPE);
        FOR I IN 1 .. L_FILES.COUNT LOOP
            R_ := NULL;
            L_NEW := FALSE;
            L_FILE_NAME := L_FILES (I).NAME;
            DBMS_OUTPUT.PUT_LINE ('Source:    '
                || L_FILE_NAME);
            L_CONTENT := L_FILES (I).CONTENTS;
            L_FILE_HASH := ORA_HASH_CLOB (
                P_CLOB => L_CONTENT
            );
            IF IS_EXIST_APXVERSION_FILE (L_FILE_NAME) = FALSE THEN
                L_NEW := TRUE;
                R_.REPO_NAME := A_.APP_REPO;
                R_.BRANCH_NAME := A_.APP_BRANCH;
                R_.FILE_NAME := L_FILE_NAME;
                R_.SH1 := L_FILE_HASH;
                R_.APP_ID := A_.APP_ID;
            ELSE
                SELECT
                    * INTO R_
                FROM
                    APXVERSION$FILES
                WHERE
                    REPO_NAME = A_.APP_REPO
                    AND BRANCH_NAME = A_.APP_BRANCH
                    AND FILE_NAME = L_FILE_NAME;
            END IF;
            GET_FILE_INFO (R_);
            IF L_NEW = TRUE OR L_FILE_HASH != R_.SH1 THEN
                PUSH_FILE (
                    P_FILE_NAME => L_FILE_NAME,
                    P_FILE => L_CONTENT
                );
            END IF;
            IF L_NEW = TRUE THEN
                INSERT INTO APXVERSION$FILES VALUES R_;
            ELSIF L_FILE_HASH != R_.SH1 THEN
                R_.SH1 := L_FILE_HASH;
                UPDATE APXVERSION$FILES
                SET
                    ROW = R_
                WHERE
                    REPO_NAME = A_.APP_REPO
                    AND BRANCH_NAME = A_.APP_BRANCH
                    AND FILE_NAME = L_FILE_NAME;
            END IF;
        END LOOP;
    END;
    PROCEDURE VERSIONING_WORKSPACE AS
        CURSOR CUR1 IS
            SELECT
                DISTINCT L.APPLICATION_ID,
                MAX (L.AUDIT_DATE) KEEP (DENSE_RANK LAST
            ORDER BY
                L.AUDIT_DATE) OVER (
                PARTITION BY L.APPLICATION_ID) AUDIT_DATE, MAX (L.DEVELOPER) KEEP (DENSE_RANK LAST ORDER BY L.AUDIT_DATE) OVER (PARTITION BY L.APPLICATION_ID) DEVELOPER
            FROM
                APEX_DEVELOPER_ACTIVITY_LOG L
                JOIN APXVERSION$APP A
                ON L.APPLICATION_ID = A.APP_ID
            WHERE
                L.AUDIT_DATE > A.AUDIT_DATE
    BEGIN
        FOR C1 IN CUR1 LOOP
            SELECT
                * INTO A_
            FROM
                APXVERSION$APP
            WHERE
                APP_ID = C1.APPLICATION_ID;
 --- save audit date --
        A_.AUDIT_DATE := C1.AUDIT_DATE;
        A_.DEVELOPER := C1.DEVELOPER;
        EXPORT_APP;
        UPDATE APXVERSION$APP
        SET
            ROW = A_
        WHERE
            APP_ID = C1.APPLICATION_ID;
    END LOOP;
END;
END APXVERSION$API;
/