prompt --application/shared_components/navigation/lists/basics
begin
--   Manifest
--     LIST: Basics
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
 p_id=>wwv_flow_api.id(813477663115028691)
,p_name=>'Basics'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(813477836381028692)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Color Coded Cards'
,p_list_item_link_target=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-paint-brush'
,p_list_text_01=>'Learn how to color code cards based on a column value'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(813478222810028693)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Faceted Search'
,p_list_item_link_target=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-filter'
,p_list_text_01=>'Learn how to combine a Cards region with a Faceted Search'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(813478671916028693)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Star Icons'
,p_list_item_link_target=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-star-o'
,p_list_text_01=>'Learn how to use CSS styling to change the default shape of each card''s icon initials'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(813479031616028693)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Styles'
,p_list_item_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-cards'
,p_list_text_01=>'Learn how to use the A, B, and C styles of a Cards region display'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.component_end;
end;
/
