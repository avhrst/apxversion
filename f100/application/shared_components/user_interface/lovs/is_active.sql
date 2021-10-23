prompt --application/shared_components/user_interface/lovs/is_active
begin
--   Manifest
--     IS ACTIVE
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>4200481731648079
,p_default_application_id=>100
,p_default_id_offset=>39500229701756973
,p_default_owner=>'VCONTROL'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(14326046909829969755)
,p_lov_name=>'IS ACTIVE'
,p_lov_query=>'.'||wwv_flow_api.id(14326046909829969755)||'.'
,p_location=>'STATIC'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(14326047108804969759)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Active'
,p_lov_return_value=>'Y'
);
wwv_flow_api.component_end;
end;
/
