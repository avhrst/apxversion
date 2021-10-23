prompt --application/deployment/install/install_create_sequence
begin
--   Manifest
--     INSTALL: INSTALL-create sequence
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
 p_id=>wwv_flow_api.id(17832692243733633114)
,p_install_id=>wwv_flow_api.id(17831599860251942603)
,p_name=>'create sequence'
,p_sequence=>40
,p_script_type=>'INSTALL'
,p_script_clob=>'create sequence eba_cust_seq;'
);
wwv_flow_api.component_end;
end;
/
