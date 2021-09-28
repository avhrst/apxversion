prompt --application/shared_components/user_interface/lovs/emp_mgr
begin
--   Manifest
--     EMP.MGR
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>4200481731648079
,p_default_application_id=>100
,p_default_id_offset=>5389331382356895884
,p_default_owner=>'VCONTROL'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(5394851280798551831)
,p_lov_name=>'EMP.MGR'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_query_table=>'EBA_DEMO_CARD_EMP'
,p_return_column_name=>'EMPNO'
,p_display_column_name=>'ENAME'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'ENAME'
,p_default_sort_direction=>'ASC'
);
wwv_flow_api.component_end;
end;
/
