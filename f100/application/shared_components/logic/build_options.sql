prompt --application/shared_components/logic/build_options
begin
--   Manifest
--     BUILD OPTIONS: 100
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>4200481731648079
,p_default_application_id=>100
,p_default_id_offset=>5389331382356895884
,p_default_owner=>'VCONTROL'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(25100453348685538)
,p_build_option_name=>'1'
,p_build_option_status=>'EXCLUDE'
);
wwv_flow_api.component_end;
end;
/
