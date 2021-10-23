prompt --application/shared_components/user_interface/lovs/link_types
begin
--   Manifest
--     LINK_TYPES
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
 p_id=>wwv_flow_api.id(17866944296699070609)
,p_lov_name=>'LINK_TYPES'
,p_lov_query=>'.'||wwv_flow_api.id(17866944296699070609)||'.'
,p_location=>'STATIC'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(17866945178131070622)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Excel Worksheet'
,p_lov_return_value=>'EXL'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(17866944976698070622)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'HTML Page'
,p_lov_return_value=>'HTM'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(17866944786747070622)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'PDF Document'
,p_lov_return_value=>'PDF'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(17866945393403070622)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'Text Document'
,p_lov_return_value=>'TXT'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(17866944585068070622)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>'Word Document'
,p_lov_return_value=>'DOC'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(17835790758150605556)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Other'
,p_lov_return_value=>'OTH'
);
wwv_flow_api.component_end;
end;
/
