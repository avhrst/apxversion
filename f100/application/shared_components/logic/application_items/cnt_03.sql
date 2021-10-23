prompt --application/shared_components/logic/application_items/cnt_03
begin
--   Manifest
--     APPLICATION ITEM: CNT_03
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
 p_id=>wwv_flow_api.id(14993221533681351191)
,p_name=>'CNT_03'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
);
wwv_flow_api.component_end;
end;
/
