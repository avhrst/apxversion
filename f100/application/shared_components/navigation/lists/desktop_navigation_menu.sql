prompt --application/shared_components/navigation/lists/desktop_navigation_menu
begin
--   Manifest
--     LIST: Desktop Navigation Menu
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
 p_id=>wwv_flow_api.id(5986296203739449046)
,p_name=>'Desktop Navigation Menu'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5986446061068449279)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Home'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-home'
,p_list_item_icon_attributes=>'title="#LIST_LABEL#"'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5394218702364125275)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Basics'
,p_list_item_link_target=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-address-card-o'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3,12,13,18,20'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(790445083606125902)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>'Color Coded Cards'
,p_list_item_link_target=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-paint-brush'
,p_parent_list_item_id=>wwv_flow_api.id(5394218702364125275)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'18'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(4469275643558408697)
,p_list_item_display_sequence=>110
,p_list_item_link_text=>'Faceted Search'
,p_list_item_link_target=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-filter'
,p_parent_list_item_id=>wwv_flow_api.id(5394218702364125275)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'12'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(790437371340018505)
,p_list_item_display_sequence=>120
,p_list_item_link_text=>'Star Icons'
,p_list_item_link_target=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-star-o'
,p_parent_list_item_id=>wwv_flow_api.id(5394218702364125275)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(790440434070033983)
,p_list_item_display_sequence=>130
,p_list_item_link_text=>'Styles'
,p_list_item_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-cards'
,p_parent_list_item_id=>wwv_flow_api.id(5394218702364125275)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5394746256355189442)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Images and Media'
,p_list_item_link_target=>'f?p=&APP_ID.:21:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-image'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(708968718048392179)
,p_list_item_display_sequence=>140
,p_list_item_link_text=>'Application Static Files'
,p_list_item_link_target=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-file-image-o'
,p_parent_list_item_id=>wwv_flow_api.id(5394746256355189442)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'8'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5992262114758178894)
,p_list_item_display_sequence=>150
,p_list_item_link_text=>'Background Image'
,p_list_item_link_target=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-film'
,p_parent_list_item_id=>wwv_flow_api.id(5394746256355189442)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'7'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5986447569704449283)
,p_list_item_display_sequence=>160
,p_list_item_link_text=>'BLOB Column'
,p_list_item_link_target=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-image'
,p_parent_list_item_id=>wwv_flow_api.id(5394746256355189442)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(712822664792624949)
,p_list_item_display_sequence=>170
,p_list_item_link_text=>'BLOB Column as URL'
,p_list_item_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-file-image-o'
,p_parent_list_item_id=>wwv_flow_api.id(5394746256355189442)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'5'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5394784975386350087)
,p_list_item_display_sequence=>180
,p_list_item_link_text=>'Embedded Video'
,p_list_item_link_target=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-video-camera'
,p_parent_list_item_id=>wwv_flow_api.id(5394746256355189442)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'6,10'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5989651529791357287)
,p_list_item_display_sequence=>190
,p_list_item_link_text=>'Image URL'
,p_list_item_link_target=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-camera'
,p_parent_list_item_id=>wwv_flow_api.id(5394746256355189442)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'4'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(813952850649146120)
,p_list_item_display_sequence=>220
,p_list_item_link_text=>'Video Images with Durations'
,p_list_item_link_target=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-play'
,p_parent_list_item_id=>wwv_flow_api.id(5394746256355189442)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5394849273210537763)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Card Actions'
,p_list_item_link_target=>'f?p=&APP_ID.:22:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-link'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'13,15,16,22'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5394853490050575980)
,p_list_item_display_sequence=>200
,p_list_item_link_text=>'Conditional Actions'
,p_list_item_link_target=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-workflow'
,p_parent_list_item_id=>wwv_flow_api.id(5394849273210537763)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'16'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5394852860343569899)
,p_list_item_display_sequence=>210
,p_list_item_link_text=>'Full Card Action'
,p_list_item_link_target=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-clipboard-check'
,p_parent_list_item_id=>wwv_flow_api.id(5394849273210537763)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5394818742697473780)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'REST Data Sources'
,p_list_item_link_target=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-download'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(813470225825937775)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Advanced'
,p_list_item_link_target=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-ellipsis-h'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'19'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(4470751779338581060)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Charts'
,p_list_item_link_target=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-dial-gauge-chart'
,p_parent_list_item_id=>wwv_flow_api.id(813470225825937775)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'11'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5394857846724596787)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'No Data Found'
,p_list_item_link_target=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-emoji-worry'
,p_parent_list_item_id=>wwv_flow_api.id(813470225825937775)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'17'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(711273385376015940)
,p_list_item_display_sequence=>90
,p_list_item_link_text=>'Template Directives'
,p_list_item_link_target=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-file-brackets'
,p_parent_list_item_id=>wwv_flow_api.id(813470225825937775)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.component_end;
end;
/
