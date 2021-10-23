prompt --application/shared_components/navigation/lists/mobile_menu
begin
--   Manifest
--     LIST: + Mobile Menu
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>4200481731648079
,p_default_application_id=>100
,p_default_id_offset=>39500229701756973
,p_default_owner=>'VCONTROL'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(16681023425497201846)
,p_name=>'+ Mobile Menu'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.component_end;
end;
/
