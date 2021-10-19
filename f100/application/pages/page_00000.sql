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
,p_default_id_offset=>0
,p_default_owner=>'VCONTROL'
);
end;
/
 
prompt APPLICATION 100 - App1
--
-- Application Export:
--   Application:     100
--   Name:            App1
--   Exported By:     SYSTEM
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 0
--   Manifest End
--   Version:         21.1.0
--   Instance ID:     1000155761403694
--

begin
null;
end;
/
prompt --application/pages/delete_00000
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>0);
end;
/
prompt --application/pages/page_00000
begin
wwv_flow_api.create_page(
 p_id=>0
,p_user_interface_id=>wwv_flow_api.id(26251251977397106)
,p_name=>'Global Page - Desktop'
,p_alias=>'1'
,p_autocomplete_on_off=>'OFF'
,p_protection_level=>'D'
,p_page_comment=>'1'
,p_last_updated_by=>'TEST'
,p_last_upd_yyyymmddhh24miss=>'20211020004134'
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
