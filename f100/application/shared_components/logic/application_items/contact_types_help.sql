prompt --application/shared_components/logic/application_items/contact_types_help
begin
--   Manifest
--     APPLICATION ITEM: CONTACT_TYPES_HELP
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>4200481731648079
,p_default_application_id=>100
,p_default_id_offset=>39500229701756973
,p_default_owner=>'VCONTROL'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(17873785087794170661)
,p_name=>'CONTACT_TYPES_HELP'
,p_protection_level=>'S'
,p_escape_on_http_output=>'N'
);
wwv_flow_api.component_end;
end;
/