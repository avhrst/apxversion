CREATE TABLE APXVERSION$USERS
(
  USER_NAME  VARCHAR2(100 BYTE) COLLATE USING_NLS_COMP,
  GIT_TOKEN  VARCHAR2(255 BYTE) COLLATE USING_NLS_COMP,
  GIT_USER   VARCHAR2(100 BYTE) COLLATE USING_NLS_COMP
)
DEFAULT COLLATION USING_NLS_COMP
LOGGING 
NOCOMPRESS 
NO INMEMORY
NOCACHE
RESULT_CACHE (MODE DEFAULT)
NOPARALLEL;
