prompt --application/deployment/install/install_industries
begin
--   Manifest
--     INSTALL: INSTALL-industries
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
 p_id=>wwv_flow_api.id(16698612721699577388)
,p_install_id=>wwv_flow_api.id(17831599860251942603)
,p_name=>'industries'
,p_sequence=>140
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_cust_industries (',
'    id                    number not null,',
'    row_version_number    number,',
'    industry_name         varchar2(255),',
'    --',
'    created               timestamp with time zone not null,',
'    created_by            varchar2(255) not null,',
'    updated               timestamp with time zone,',
'    updated_by            varchar2(255)',
'   )',
'/',
'alter table eba_cust_industries',
'   add constraint eba_cust_industries_pk',
'       primary key (id)',
'/',
'create unique index eba_cust_industries_uk on eba_cust_industries(industry_name)',
'/',
'alter table eba_cust_industries',
'   add constraint eba_cust_industries_uk',
'       unique (industry_name)',
'       using index eba_cust_industries_uk',
'/',
'',
'',
'',
''))
);
wwv_flow_api.component_end;
end;
/
