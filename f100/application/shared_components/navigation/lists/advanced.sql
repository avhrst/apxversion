prompt --application/shared_components/navigation/lists/advanced
begin
--   Manifest
--     LIST: Advanced
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>4200481731648079
,p_default_application_id=>100
,p_default_id_offset=>5389331382356895884
,p_default_owner=>'VCONTROL'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(813461675914908815)
,p_name=>'Advanced'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(813461876165908820)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Charts'
,p_list_item_link_target=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-dial-gauge-chart'
,p_list_text_01=>'Learn how to display charts inside cards using Oracle JET Data Visualizations'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(813462252201908823)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'No Data Found'
,p_list_item_link_target=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-emoji-worry'
,p_list_text_01=>'Learn how to define No Data Found messages for Cards regions'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(813462622690908824)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Template Directives'
,p_list_item_link_target=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-file-brackets'
,p_list_text_01=>'Learn how to define template directives for Cards regions'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.component_end;
end;
/
