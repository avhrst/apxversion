prompt --application/deployment/install/upgrade_issue_statuses
begin
--   Manifest
--     INSTALL: UPGRADE-Issue Statuses
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>4200481731648079
,p_default_application_id=>100
,p_default_id_offset=>39500229701756973
,p_default_owner=>'VCONTROL'
);
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(2604571237690176660)
,p_install_id=>wwv_flow_api.id(17831599860251942603)
,p_name=>'Issue Statuses'
,p_sequence=>470
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_tables',
'where table_name = ''EBA_CUST_ISSUE_STATUSES'''))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'CREATE TABLE "EBA_CUST_ISSUE_STATUSES" ',
'   ("ID" NUMBER,',
'    "NAME" VARCHAR2(255) NOT NULL ENABLE,',
'    "DETAILS" VARCHAR2(4000),',
'    "OPEN_YN" VARCHAR2(1),',
'    "CREATED" TIMESTAMP (6) WITH TIME ZONE,',
'    "CREATED_BY" VARCHAR2(255),',
'    "UPDATED" TIMESTAMP (6) WITH TIME ZONE,',
'    "UPDATED_BY" VARCHAR2(255),',
'     PRIMARY KEY ("ID") USING INDEX  ENABLE,',
'     constraint check_open_yn check (open_yn in (''Y'',''N''))',
'   )',
'/',
'',
'CREATE OR REPLACE TRIGGER  "BIU_EBA_CUST_ISSUE_STATUSES" ',
'    before insert or update ',
'    on eba_cust_issue_statuses',
'    for each row',
'begin',
'    if :new.id is null then',
'        :new.id := to_number(sys_guid(), ''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'');',
'    end if;',
'    if inserting then',
'        :new.created := current_timestamp;',
'        :new.created_by := nvl(v(''APP_USER''),USER);',
'    end if;',
'    if inserting or updating then',
'        :new.updated := current_timestamp;',
'        :new.updated_by := nvl(v(''APP_USER''),USER);',
'    end if;',
'end;',
'/',
'',
'ALTER TRIGGER "BIU_EBA_CUST_ISSUE_STATUSES" ENABLE',
'/',
'',
'insert into EBA_CUST_ISSUE_STATUSES',
'(name, open_yn, details)',
'values',
'(''Open'',''Y'',''The issue has not been resolved yet.'');',
'',
'insert into EBA_CUST_ISSUE_STATUSES',
'(name, open_yn, details)',
'values',
'(''Closed'',''N'',''The issue has been resolved.'');'))
);
wwv_flow_api.component_end;
end;
/
