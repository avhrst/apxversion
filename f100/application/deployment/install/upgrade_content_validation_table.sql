prompt --application/deployment/install/upgrade_content_validation_table
begin
--   Manifest
--     INSTALL: UPGRADE-Content Validation Table
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
 p_id=>wwv_flow_api.id(14971953435164464419)
,p_install_id=>wwv_flow_api.id(17831599860251942603)
,p_name=>'Content Validation Table'
,p_sequence=>140
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_tables',
'where table_name = ''EBA_CUST_VERIFICATIONS'';'))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_cust_verifications',
'(',
'    id                   number primary key,',
'    cust_id              number,',
'    verified_by          varchar2(255) not null,',
'    verification_comment varchar2(4000),',
'    created              timestamp(6) with time zone,',
'    created_by           varchar2(255),',
'    updated              timestamp(6) with time zone,',
'    updated_by           varchar2(255)',
');',
'/',
'',
'create index eba_cust_verify_idx1 on eba_cust_verifications (cust_id);',
'    ',
'create or replace trigger eba_cust_verify_biu_fer',
'   before insert or update on eba_cust_verifications',
'   for each row',
'begin',
'   if :new.id is null then',
'     :new.id := eba_cust_seq.nextval;',
'   end if;',
'   if inserting then',
'       :new.created := current_timestamp;',
'       :new.created_by := nvl(apex_application.g_user,user);',
'   end if;',
'   if inserting or updating then',
'       :new.updated := current_timestamp;',
'       :new.updated_by := nvl(apex_application.g_user,user);',
'   end if;',
'end;',
'/',
'',
'alter trigger eba_cust_verify_biu_fer enable;',
''))
);
wwv_flow_api.component_end;
end;
/
