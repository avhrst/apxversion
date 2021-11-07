prompt --application/deployment/install/upgrade_allow_null_preference_values
begin
--   Manifest
--     INSTALL: UPGRADE-Allow NULL Preference Values
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
 p_id=>wwv_flow_api.id(20264796268241629342)
,p_install_id=>wwv_flow_api.id(17831599860251942603)
,p_name=>'Allow NULL Preference Values'
,p_sequence=>40
,p_script_type=>'UPGRADE'
,p_condition_type=>'EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_tab_cols',
'where table_name = ''EBA_CUST_PREFERENCES''',
'    and column_name = ''PREFERENCE_VALUE''',
'    and nullable = ''N'''))
,p_script_clob=>'alter table eba_cust_preferences modify (preference_value null);'
);
wwv_flow_api.component_end;
end;
/
