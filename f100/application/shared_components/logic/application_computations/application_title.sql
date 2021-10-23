prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_210100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>4200481731648079
,p_default_application_id=>100
,p_default_id_offset=>39500229701756973
,p_default_owner=>'VCONTROL'
);
end;
/
 
prompt APPLICATION 100 - Customers
--
-- Application Export:
--   Application:     100
--   Name:            Customers
--   Exported By:     SYSTEM
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     APP_COMPUTATION: 14775306512725575008
--   Manifest End
--   Version:         21.1.0
--   Instance ID:     1000155761403694
--

begin
  -- replace components
  wwv_flow_api.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/logic/application_computations/application_title
begin
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(14775306512725575008)
,p_computation_sequence=>10
,p_computation_item=>'APPLICATION_TITLE'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_app_name varchar2(255);',
'begin',
'    select nvl(preference_value,:APP_NAME)',
'      into l_app_name',
'      from eba_cust_preferences',
'     where preference_name = ''APPLICATION_TITLE'';',
'    return l_app_name;',
'exception',
'    when others then',
'        return :APP_NAME;',
'end;'))
,p_computation_comment=>'1'
);
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
