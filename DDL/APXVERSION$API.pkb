CREATE OR REPLACE PACKAGE BODY APXVERSION$API
AS
    /******************************************************************************
       NAME:       APXVERSION$API
       PURPOSE:

       REVISIONS:
       Ver        Date        Author           Description
       ---------  ----------  ---------------  ------------------------------------
       1.0        8/20/2022      avhrs       1. Created this package body.
    ******************************************************************************/



    FUNCTION EncodeBASE64 (InClearChar IN OUT NOCOPY CLOB)
        RETURN CLOB
    IS
        dest_lob       BLOB;
        lang_context   INTEGER := DBMS_LOB.DEFAULT_LANG_CTX;
        dest_offset    INTEGER := 1;
        src_offset     INTEGER := 1;
        read_offset    INTEGER := 1;
        warning        INTEGER;
        ClobLen        INTEGER := DBMS_LOB.GETLENGTH (InClearChar);

        amount         INTEGER := 1440;       -- must be a whole multiple of 3
        -- size of a whole multiple of 48 is beneficial to get NEW_LINE after each 64 characters
        buffer         RAW (1440);
        res            CLOB := EMPTY_CLOB ();
    BEGIN
        IF InClearChar IS NULL OR NVL (ClobLen, 0) = 0
        THEN
            RETURN NULL;
        ELSIF ClobLen <= 24000
        THEN
            res :=
                UTL_RAW.CAST_TO_VARCHAR2 (
                    UTL_ENCODE.BASE64_ENCODE (
                        UTL_RAW.CAST_TO_RAW (InClearChar)));
            res := REPLACE (REPLACE (res, CHR (13), NULL), CHR (10), NULL);

            RETURN res;
        END IF;

        -- UTL_ENCODE.BASE64_ENCODE is limited to 32k/(3/4), process in chunks if bigger

        DBMS_LOB.CREATETEMPORARY (dest_lob, TRUE);
        DBMS_LOB.CONVERTTOBLOB (dest_lob,
                                InClearChar,
                                DBMS_LOB.LOBMAXSIZE,
                                dest_offset,
                                src_offset,
                                DBMS_LOB.DEFAULT_CSID,
                                lang_context,
                                warning);

        LOOP
            EXIT WHEN read_offset >= dest_offset;
            DBMS_LOB.READ (dest_lob,
                           amount,
                           read_offset,
                           buffer);
            res :=
                   res
                || UTL_RAW.CAST_TO_VARCHAR2 (
                       UTL_ENCODE.BASE64_ENCODE (buffer));
            read_offset := read_offset + amount;
        END LOOP;

        DBMS_LOB.FREETEMPORARY (dest_lob);
        res := REPLACE (REPLACE (res, CHR (13), NULL), CHR (10), NULL);
        RETURN res;
    END EncodeBASE64;

    FUNCTION ora_hash_clob (p_clob IN CLOB)
        RETURN CLOB
    IS
        TYPE t_ora_hash_tab IS TABLE OF NUMBER
            INDEX BY BINARY_INTEGER;

        l_ora_hash_tab        t_ora_hash_tab;
        l_line                VARCHAR2 (4000);
        l_ora_hash_key        NUMBER;
        l_ora_hash_clob_key   CLOB;
    BEGIN
        FOR i IN 1 .. CEIL (LENGTH (p_clob) / 4000)
        LOOP
            l_line := TO_CHAR (SUBSTR (p_clob, (i - 1) * 4000 + 1, 4000));

            SELECT ORA_HASH (l_line) INTO l_ora_hash_key FROM DUAL;

            l_ora_hash_tab (i) := l_ora_hash_key;
        END LOOP;

        FOR i IN 1 .. l_ora_hash_tab.COUNT
        LOOP
            l_ora_hash_clob_key :=
                l_ora_hash_clob_key || TO_CLOB (l_ora_hash_tab (i));
        END LOOP;

        RETURN l_ora_hash_clob_key;
    END;

    PROCEDURE set_headers
    AS
    BEGIN
        apex_web_service.g_request_headers (1).name := 'User-Agent';
        apex_web_service.g_request_headers (1).VALUE := 'oracle-db';

        apex_web_service.g_request_headers (2).name := 'Authorization';
        apex_web_service.g_request_headers (2).VALUE :=
            'Bearer ' || u_.GIT_TOKEN;
    END;

    FUNCTION user_profile (p_user IN VARCHAR2)
        RETURN CLOB
    AS
        l_request_url   VARCHAR2 (1024);
        l_result        CLOB;
    BEGIN
        l_request_url := g_base_url || '/users/' || p_user;
        set_headers;
        l_result :=
            apex_web_service.make_rest_request (p_url           => l_request_url,
                                                p_http_method   => 'GET');
        RETURN l_result;
    END;

    FUNCTION get_file_sha (p_file_name IN VARCHAR2)
        RETURN VARCHAR2
    AS
        l_request_url   VARCHAR2 (1024);
        l_result        CLOB;
        l_status_code   INT;
    BEGIN
        l_request_url :=
               g_base_url
            || '/repos/'
            || u_.GIT_USER
            || '/'
            || a_.APP_REPO
            || '/contents/'
            || p_file_name;

        set_headers;
        apex_web_service.g_request_headers (3).name := 'Content-Type';
        apex_web_service.g_request_headers (3).VALUE := 'application/json';

        l_result :=
            apex_web_service.make_rest_request (p_url           => l_request_url,
                                                p_http_method   => 'GET');

        l_status_code := apex_web_service.g_status_code;

        IF l_status_code = 200
        THEN
            APEX_JSON.parse (l_result);
            RETURN APEX_JSON.get_varchar2 (p_path => 'sha');
        END IF;

        RETURN NULL;
    END;



    PROCEDURE push_file (p_file_name IN VARCHAR2, p_file IN CLOB)
    AS
        l_request_url   VARCHAR2 (1024);
        l_result        CLOB;
        l_base64        CLOB;
        l_json          CLOB;
        l_status_code   INT;

        l_sha           VARCHAR2 (255);
        l_file_clob     CLOB := p_file;
    BEGIN
        l_sha := get_file_sha (p_file_name => p_file_name);

        l_request_url :=
               g_base_url
            || '/repos/'
            || u_.GIT_USER
            || '/'
            || a_.APP_REPO
            || '/contents/'
            || p_file_name;
        l_base64 := EncodeBASE64 (InClearChar => l_file_clob);
        apex_json.initialize_clob_output;
        apex_json.open_object;
        apex_json.write ('message', 'commit ' || p_file_name);
        apex_json.write ('content', l_base64);
        apex_json.write ('sha', l_sha);
        apex_json.close_object;
        l_json := apex_json.get_clob_output;
        apex_json.free_output;

        set_headers;
        apex_web_service.g_request_headers (3).name := 'Content-Type';
        apex_web_service.g_request_headers (3).VALUE := 'application/json';

        l_result :=
            apex_web_service.make_rest_request (p_url           => l_request_url,
                                                p_http_method   => 'PUT',
                                                p_body          => l_json);

        l_status_code := apex_web_service.g_status_code;

        --       IF l_status_code = 200
        --      THEN
        --      END IF;
        --  exception when others then
        --  null;

        DBMS_OUTPUT.put_line (l_result);
    END;


    FUNCTION is_exist_apxversion_file (p_file_name IN VARCHAR2)
        RETURN BOOLEAN
    AS
        l_ex   INT;
    BEGIN
        SELECT COUNT (*)
          INTO l_ex
          FROM APXVERSION$FILES
         WHERE     REPO_NAME = a_.APP_REPO
               AND BRANCH_NAME = a_.APP_BRANCH
               AND FILE_NAME = p_file_name;

        IF l_ex = 1
        THEN
            RETURN TRUE;
        END IF;

        RETURN FALSE;
    END;


    PROCEDURE get_file_info (r_ IN OUT APXVERSION$FILES%ROWTYPE)
    AS
        l_page_id   INT;
    BEGIN
        IF INSTR (r_.FILE_NAME, '/application/pages/') != 0
        THEN
            BEGIN
                l_page_id :=
                    TO_NUMBER (
                        SUBSTR (
                            r_.FILE_NAME,
                            INSTR (r_.FILE_NAME, '/application/pages/') + 20,
                            5));

                SELECT DISTINCT
                       MAX (developer)
                           KEEP (DENSE_RANK LAST ORDER BY AUDIT_DATE)
                           OVER ()    DEVELOPER,
                       MAX (AUDIT_DATE)
                           KEEP (DENSE_RANK LAST ORDER BY AUDIT_DATE)
                           OVER ()    AUDIT_DATE
                  INTO r_.DEVELOPER, r_.AUDIT_DATE
                  FROM APEX_DEVELOPER_ACTIVITY_LOG
                 WHERE application_id = a_.APP_ID AND page_id = l_page_id;
            EXCEPTION
                WHEN OTHERS
                THEN
                    NULL;
            END;
        END IF;

        IF r_.DEVELOPER IS NULL
        THEN
            r_.DEVELOPER := a_.DEVELOPER;
            r_.AUDIT_DATE := a_.AUDIT_DATE;
        END IF;

        SELECT *
          INTO u_
          FROM APXVERSION$USERS
         WHERE USER_NAME = r_.DEVELOPER;
    END;


    PROCEDURE export_app
    AS
        l_files       apex_t_export_files;
        l_content     CLOB;
        r_            APXVERSION$FILES%ROWTYPE;
        l_file_name   VARCHAR2 (1024);
        l_file_hash   VARCHAR2 (255);
        l_new         BOOLEAN;
    BEGIN
        l_files :=
            apex_export.get_application (p_application_id   => a_.APP_ID,
                                         p_split            => TRUE,
                                         p_with_date        => FALSE,
                                         p_type             => g_export_type);

        FOR i IN 1 .. l_files.COUNT
        LOOP
            r_ := NULL;
            l_new := FALSE;

            l_file_name := l_files (i).name;
            DBMS_OUTPUT.put_line ('Source:    ' || l_file_name);

            l_content := l_files (i).contents;
            l_file_hash := ora_hash_clob (p_clob => l_content);

            IF is_exist_apxversion_file (l_file_name) = FALSE
            THEN
                l_new := TRUE;
                r_.REPO_NAME := a_.APP_REPO;
                r_.BRANCH_NAME := a_.APP_BRANCH;
                r_.FILE_NAME := l_file_name;
                r_.SH1 := l_file_hash;
                r_.APP_ID := a_.APP_ID;
            ELSE
                SELECT *
                  INTO r_
                  FROM APXVERSION$FILES
                 WHERE     REPO_NAME = a_.APP_REPO
                       AND BRANCH_NAME = a_.APP_BRANCH
                       AND FILE_NAME = l_file_name;
            END IF;

            get_file_info (r_);


            IF l_new = TRUE OR l_file_hash != r_.SH1
            THEN
                push_file (p_file_name => l_file_name, p_file => l_content);
            END IF;


            IF l_new = TRUE
            THEN
                INSERT INTO APXVERSION$FILES
                     VALUES r_;
            ELSIF l_file_hash != r_.SH1
            THEN
                r_.SH1 := l_file_hash;


                UPDATE APXVERSION$FILES
                   SET row = r_
                 WHERE     REPO_NAME = a_.APP_REPO
                       AND BRANCH_NAME = a_.APP_BRANCH
                       AND FILE_NAME = l_file_name;
            END IF;
        END LOOP;
    END;


    PROCEDURE versioning_workspace
    AS
        CURSOR cur1 IS
            SELECT DISTINCT
                   l.application_id,
                   MAX (l.AUDIT_DATE)
                       KEEP (DENSE_RANK LAST ORDER BY l.AUDIT_DATE)
                       OVER (PARTITION BY l.application_id)    AUDIT_DATE,
                   MAX (l.developer)
                       KEEP (DENSE_RANK LAST ORDER BY l.AUDIT_DATE)
                       OVER (PARTITION BY l.application_id)    DEVELOPER
              FROM APEX_DEVELOPER_ACTIVITY_LOG  l
                   JOIN APXVERSION$APP a ON l.application_id = a.APP_ID
             WHERE l.AUDIT_DATE > a.AUDIT_DATE;
    BEGIN
        FOR c1 IN cur1
        LOOP
            SELECT *
              INTO a_
              FROM APXVERSION$APP
             WHERE APP_ID = c1.application_id;

            --- save audit date --
            a_.AUDIT_DATE := c1.AUDIT_DATE;
            a_.DEVELOPER := c1.DEVELOPER;

            export_app;

            UPDATE APXVERSION$APP
               SET row = a_
             WHERE APP_ID = c1.application_id;
        END LOOP;
    END;
END APXVERSION$API;
/
