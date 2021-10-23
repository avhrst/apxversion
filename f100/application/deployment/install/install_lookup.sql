prompt --application/deployment/install/install_lookup
begin
--   Manifest
--     INSTALL: INSTALL-lookup
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
 p_id=>wwv_flow_api.id(16698612336459572194)
,p_install_id=>wwv_flow_api.id(17831599860251942603)
,p_name=>'lookup'
,p_sequence=>120
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_cust_error_lookup (',
'    constraint_name         varchar2(30)        not null',
'                                                constraint eba_cust_error_lookup_pk',
'                                                primary key,',
'    message                 varchar2(4000)      not null,',
'    language_code           varchar2(30)        not null',
')',
'/',
'create unique index eba_cust_error_lookup_uk on eba_cust_error_lookup (constraint_name,language_code);',
'',
'',
''))
);
wwv_flow_api.component_end;
end;
/
