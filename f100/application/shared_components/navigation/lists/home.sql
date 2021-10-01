prompt --application/shared_components/navigation/lists/home
begin
--   Manifest
--     LIST: Home
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
 p_id=>wwv_flow_api.id(813627432237681581)
,p_name=>'Home'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(813627684867681582)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Basics'
,p_list_item_link_target=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-address-card-o'
,p_list_text_01=>'Learn how to create color coded cards, a Cards region with a Faceted Search, and several other Cards regions using various styles'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(813628008103681582)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Images and Media'
,p_list_item_link_target=>'f?p=&APP_ID.:21:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-image'
,p_list_text_01=>'Learn how to display images and embedded videos in Cards regions'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(813628411083681582)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Card Actions'
,p_list_item_link_target=>'f?p=&APP_ID.:22:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-link'
,p_list_text_01=>'Learn how to make an each card link to a given URL or how to define different elements on each card that link to different URLs'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(813628805148681583)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Advanced'
,p_list_item_link_target=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-ellipsis-h'
,p_list_text_01=>'Learn how to create a Cards region of charts, define a Cards region''s No Data Found message, and use template directives to dynamically display information'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.component_end;
end;
/
