prompt --application/shared_components/logic/application_computations/active_msg
begin
--   Manifest
--     APPLICATION COMPUTATION: ACTIVE_MSG
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>4200481731648079
,p_default_application_id=>100
,p_default_id_offset=>39500229701756973
,p_default_owner=>'VCONTROL'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(17873761471714005183)
,p_computation_sequence=>10
,p_computation_item=>'ACTIVE_MSG'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'htmldb_lang.message(''ACTIVE'');'
);
wwv_flow_api.component_end;
end;
/
