prompt --application/deployment/definition
begin
--   Manifest
--     INSTALL: 100
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>4200481731648079
,p_default_application_id=>100
,p_default_id_offset=>5389331382356895884
,p_default_owner=>'VCONTROL'
);
wwv_flow_api.create_install(
 p_id=>wwv_flow_api.id(5394817275311454157)
,p_deinstall_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'drop table eba_demo_card_emp;',
'drop table eba_demo_card_dept;',
'drop table eba_demo_card_vehicle_speed;',
'drop table eba_demo_card_random_image;',
'',
'drop package eba_demo_card_pkg;'))
,p_required_free_kb=>100
,p_required_sys_privs=>'CREATE PROCEDURE:CREATE TABLE:CREATE TRIGGER:CREATE VIEW'
,p_required_names_available=>'EBA_DEMO_CARD_DEPT:EBA_DEMO_CARD_EMP:EBA_DEMO_CARD_VEHICLE_SPEED:EBA_DEMO_CARD_RANDOM_IMAGE'
);
wwv_flow_api.component_end;
end;
/
