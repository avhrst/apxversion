prompt --application/deployment/install/install_email_log_ddl
begin
--   Manifest
--     INSTALL: INSTALL-email log DDL
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
 p_id=>wwv_flow_api.id(18772894944730138240)
,p_install_id=>wwv_flow_api.id(17831599860251942603)
,p_name=>'email log DDL'
,p_sequence=>530
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_cust_email_log (',
'    id                 number,',
'    row_version_number number,',
'    email_first_to     varchar2(255),',
'    email_to           varchar2(4000),',
'    email_from         varchar2(255),',
'    body_size          number,',
'    customer_id        number,',
'    email_type         varchar2(30),',
'    --',
'    created            timestamp (6) with time zone,',
'    created_by         varchar2(255),',
'    updated            timestamp (6) with time zone,',
'    updated_by         varchar2(255),',
'    primary key (id) using index enable',
')',
'/',
'',
'create index eba_cust_email_log_n1 on eba_cust_email_log (email_first_to)',
'/',
'',
'create index eba_cust_email_log_n2 on eba_cust_email_log (email_from)',
'/',
'',
'create or replace trigger  biu_eba_cust_email_log',
'    before insert or update on eba_cust_email_log',
'    for each row',
'begin',
'    if :new.id is null then',
'        :new.id := to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'');',
'    end if;',
'    if inserting then',
'        :new.created := current_timestamp;',
'        :new.created_by := nvl(wwv_flow.g_user,user);',
'        :new.row_version_number := 1;',
'    elsif updating then',
'        :new.row_version_number := nvl(:old.row_version_number,1) + 1;',
'    end if;',
'',
'    :new.updated := current_timestamp;',
'    :new.updated_by := nvl(wwv_flow.g_user,user);',
'    :new.email_first_to := lower(:new.email_first_to);',
'    :new.email_from := lower(:new.email_from);',
'end;',
'/',
'',
'alter trigger  biu_eba_cust_email_log enable',
'/'))
);
wwv_flow_api.component_end;
end;
/
