prompt --application/shared_components/user_interface/lovs/issue_types
begin
--   Manifest
--     ISSUE TYPES
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
 p_id=>wwv_flow_api.id(2604143405384183250)
,p_lov_name=>'ISSUE TYPES'
,p_lov_query=>'.'||wwv_flow_api.id(2604143405384183250)||'.'
,p_location=>'STATIC'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(2604143745613183251)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Bug'
,p_lov_return_value=>'BUG'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(2604144150449183253)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Enhancement Request'
,p_lov_return_value=>'ER'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(2604144546866183253)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Other'
,p_lov_return_value=>'OTHER'
);
wwv_flow_api.component_end;
end;
/
