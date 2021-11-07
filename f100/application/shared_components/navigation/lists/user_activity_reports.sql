prompt --application/shared_components/navigation/lists/user_activity_reports
begin
--   Manifest
--     LIST: User Activity Reports
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
 p_id=>wwv_flow_api.id(17831082445440539215)
,p_name=>'User Activity Reports'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(15004259935842954804)
,p_list_item_display_sequence=>5
,p_list_item_link_text=>'Application Activity'
,p_list_item_link_target=>'f?p=&APP_ID.:46:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-calendar'
,p_list_text_01=>'Monthly calendar reporting historical usage, number of users and number of page views by day.  Requires contributor rights.'
,p_list_text_02=>'Monthly Calendar'
,p_security_scheme=>wwv_flow_api.id(16004652111982028856)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(17831082642630539223)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Top Users'
,p_list_item_link_target=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-table'
,p_list_text_01=>'Summary report of page view activity by user.  Requires contributor rights.'
,p_list_text_02=>'Interactive Report'
,p_security_scheme=>wwv_flow_api.id(16004652111982028856)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'23'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(17843432728059161492)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Page View Activity'
,p_list_item_link_target=>'f?p=&APP_ID.:45:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-table'
,p_list_text_01=>'Interactive report of each application page view.  Requires contributor rights.'
,p_list_text_02=>'Interactive Report'
,p_security_scheme=>wwv_flow_api.id(16004652111982028856)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(16775607004653386658)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Activity Calendar'
,p_list_item_link_target=>'f?p=&APP_ID.:21:&SESSION.::&DEBUG.:RP,21:::'
,p_list_item_icon=>'fa-calendar'
,p_list_text_01=>'Summary of page views by user by day.  Requires contributor rights.'
,p_list_text_02=>'Monthly Calendar'
,p_security_scheme=>wwv_flow_api.id(16004652111982028856)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(14994139924502157651)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Application Activity by Page'
,p_list_item_link_target=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-table'
,p_list_text_01=>'Review application page performance and popularity.  A weighted page performance column multiplies page views by median rendering time. '
,p_list_text_02=>'Interactive Report'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.component_end;
end;
/
