CREATE TABLE APXVERSION$FILES (
  SH1 VARCHAR2(255 BYTE) COLLATE USING_NLS_COMP,
  REPO_NAME VARCHAR2(255 BYTE) COLLATE USING_NLS_COMP,
  FILE_NAME VARCHAR2(1024 BYTE) COLLATE USING_NLS_COMP,
  BRANCH_NAME VARCHAR2(255 BYTE) COLLATE USING_NLS_COMP,
  AUDIT_DATE DATE,
  DEVELOPER VARCHAR2(255 BYTE) COLLATE USING_NLS_COMP,
  APP_ID INTEGER
) DEFAULT COLLATION USING_NLS_COMP LOGGING NOCOMPRESS NO INMEMORY NOCACHE RESULT_CACHE (
  MODE DEFAULT
) NOPARALLEL;