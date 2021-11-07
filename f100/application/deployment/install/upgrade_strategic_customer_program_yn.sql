prompt --application/deployment/install/upgrade_strategic_customer_program_yn
begin
--   Manifest
--     INSTALL: UPGRADE-strategic_customer_program_yn
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
 p_id=>wwv_flow_api.id(16926100284356951400)
,p_install_id=>wwv_flow_api.id(17831599860251942603)
,p_name=>'strategic_customer_program_yn'
,p_sequence=>280
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_tab_cols',
'where table_name = ''EBA_CUST_CUSTOMERS''',
'    and column_name = ''STRATEGIC_CUSTOMER_PROGRAM_YN'''))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'alter table eba_cust_customers add strategic_customer_program_yn varchar2(1) default ''N''',
'/'))
);
wwv_flow_api.component_end;
end;
/
