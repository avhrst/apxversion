prompt --application/shared_components/navigation/lists/card_actions
begin
--   Manifest
--     LIST: Card Actions
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
 p_id=>wwv_flow_api.id(813504161656947325)
,p_name=>'Card Actions'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(813504325366947329)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Conditional Actions'
,p_list_item_link_target=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-workflow'
,p_list_text_01=>'Learn how to add multiple actions per card'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(813504732796947329)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Full Card Action'
,p_list_item_link_target=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-clipboard-check'
,p_list_text_01=>'Learn how to define a single action for each card'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.component_end;
end;
/
