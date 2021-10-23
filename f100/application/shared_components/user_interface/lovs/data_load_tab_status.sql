prompt --application/shared_components/user_interface/lovs/data_load_tab_status
begin
--   Manifest
--     DATA_LOAD_TAB_STATUS
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
 p_id=>wwv_flow_api.id(17841450428495942074)
,p_lov_name=>'DATA_LOAD_TAB_STATUS'
,p_lov_query=>'.'||wwv_flow_api.id(17841450428495942074)||'.'
,p_location=>'STATIC'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(17841450637677942081)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Enable'
,p_lov_return_value=>'ENABLE'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(17841450823927942087)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Disable'
,p_lov_return_value=>'DISABLE'
);
wwv_flow_api.component_end;
end;
/
