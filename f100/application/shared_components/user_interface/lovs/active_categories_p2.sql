prompt --application/shared_components/user_interface/lovs/active_categories_p2
begin
--   Manifest
--     ACTIVE_CATEGORIES_P2
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
 p_id=>wwv_flow_api.id(17865982453575823604)
,p_lov_name=>'ACTIVE_CATEGORIES_P2'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select category d, id r',
'  from EBA_CUST_CATEGORIES',
' where is_active = ''Y''',
'    or ID = :P2_CATEGORY_ID',
' order by 1'))
,p_source_type=>'LEGACY_SQL'
,p_location=>'LOCAL'
);
wwv_flow_api.component_end;
end;
/