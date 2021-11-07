prompt --application/deployment/install/upgrade_remove_help_table
begin
--   Manifest
--     INSTALL: UPGRADE-Remove Help Table
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
 p_id=>wwv_flow_api.id(14892445109742142240)
,p_install_id=>wwv_flow_api.id(17831599860251942603)
,p_name=>'Remove Help Table'
,p_sequence=>110
,p_script_type=>'UPGRADE'
,p_condition_type=>'EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select table_name',
'from user_tables',
'where table_name = ''EBA_CUST_HELP_PAGE'''))
,p_script_clob=>'drop table eba_cust_help_page;'
);
wwv_flow_api.component_end;
end;
/
