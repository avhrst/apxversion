prompt --application/deployment/install/upgrade_country_id_in_customers_table
begin
--   Manifest
--     INSTALL: UPGRADE-country_id in customers table
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
 p_id=>wwv_flow_api.id(16968713636191037032)
,p_install_id=>wwv_flow_api.id(17831599860251942603)
,p_name=>'country_id in customers table'
,p_sequence=>290
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_tab_cols',
'where table_name = ''EBA_CUST_CUSTOMERS''',
'    and column_name = ''COUNTRY_ID'''))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'alter table eba_cust_customers add country_id number',
'/',
'alter table eba_cust_customers',
'   add constraint eba_customers_country_fk',
'       foreign key (country_id)',
'       references eba_cust_countries (id) on delete cascade',
'/',
'drop index eba_cust_customers_04',
'/',
'create index eba_cust_customers_04 on eba_cust_customers (geography_id,country_id)',
'/'))
);
wwv_flow_api.component_end;
end;
/
