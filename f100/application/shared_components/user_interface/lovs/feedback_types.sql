prompt --application/shared_components/user_interface/lovs/feedback_types
begin
--   Manifest
--     FEEDBACK TYPES
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
 p_id=>wwv_flow_api.id(18768759626984214674)
,p_lov_name=>'FEEDBACK TYPES'
,p_lov_query=>'select type, id from eba_cust_feedback_types order by id'
,p_source_type=>'LEGACY_SQL'
,p_location=>'LOCAL'
);
wwv_flow_api.component_end;
end;
/
