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
--     APP_ITEM: 17873784275673167085
--   Manifest End
--   Version:         21.1.0
--   Instance ID:     1000155761403694
--

begin
  -- replace components
  wwv_flow_api.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/logic/application_items/category_help
begin
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(17873784275673167085)
,p_name=>'CATEGORY_HELP'
,p_protection_level=>'S'
,p_escape_on_http_output=>'N'
,p_item_comment=>'2'
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
