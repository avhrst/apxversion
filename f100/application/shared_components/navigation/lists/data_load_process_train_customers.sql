prompt --application/shared_components/navigation/lists/data_load_process_train_customers
begin
--   Manifest
--     LIST: Data Load Process Train - customers
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>4200481731648079
,p_default_application_id=>100
,p_default_id_offset=>39500229701756973
,p_default_owner=>'VCONTROL'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(15724430310935281672)
,p_name=>'Data Load Process Train - customers'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.component_end;
end;
/