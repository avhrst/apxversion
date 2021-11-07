SET DEFINE OFF;

-- USER SQL
CREATE USER "APEX_VERSION_USER" IDENTIFIED BY "d2#l&Ps@8Acza";

-- ROLES
GRANT "CONNECT" TO "APEX_VERSION_USER";

--  PRIVILEGES
GRANT SELECT ON "APEX_210100"."WWV_FLOW_BUILDER_AUDIT_TRAIL" TO "APEX_VERSION_USER";

GRANT SELECT ON "APEX_210100"."WWV_FLOW_AUTHORIZED" TO "APEX_VERSION_USER";

GRANT SELECT, INSERT ON "APEX_210100"."WWV_FLOW_LOCK_PAGE" TO "APEX_VERSION_USER";

GRANT SELECT ON "APEX_210100"."WWV_FLOW_LOCK_PAGE_LOG" TO "APEX_VERSION_USER";