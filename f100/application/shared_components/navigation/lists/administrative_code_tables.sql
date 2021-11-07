prompt --application/shared_components/navigation/lists/administrative_code_tables
begin
--   Manifest
--     LIST: Administrative Code Tables
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
 p_id=>wwv_flow_api.id(15882077639771545920)
,p_name=>'Administrative Code Tables'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(18177701435259500374)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Activity Types'
,p_list_item_link_target=>'f?p=&APP_ID.:53:&SESSION.::&DEBUG.:RP,RIR,53:::'
,p_list_item_icon=>'fa-newspaper-o'
,p_list_text_01=>'Manage the types of activities tracked by the system.'
,p_security_scheme=>wwv_flow_api.id(15713723918932486510)
,p_required_patch=>wwv_flow_api.id(18176929147143381754)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(15882078594570545921)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Categories'
,p_list_item_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-bullseye'
,p_list_text_01=>'Manage the categories used to bucket customers.'
,p_list_text_02=>'formIcon'
,p_list_text_03=>'&CNT_02.'
,p_security_scheme=>wwv_flow_api.id(15713723918932486510)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(15882079373167545922)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Contact Types'
,p_list_item_link_target=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-crosshairs'
,p_list_text_01=>'Manage domain of customer contact types.'
,p_list_text_02=>'formIcon'
,p_list_text_03=>'&CNT_04.'
,p_security_scheme=>wwv_flow_api.id(15713723918932486510)
,p_required_patch=>wwv_flow_api.id(14994173107612514952)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'8'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(16968552743875992604)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Countries'
,p_list_item_link_target=>'f?p=&APP_ID.:98:&SESSION.::&DEBUG.:98,RIR:::'
,p_list_item_icon=>'fa-globe'
,p_list_text_01=>'Manage the list of countries used to organize customers.'
,p_security_scheme=>wwv_flow_api.id(15713723918932486510)
,p_required_patch=>wwv_flow_api.id(16965757855225696684)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(17039876392088067224)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Customer Statuses'
,p_list_item_link_target=>'f?p=&APP_ID.:102:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-edit'
,p_list_text_01=>'Manage domain of customer statuses.'
,p_list_text_02=>'formIcon'
,p_list_text_03=>'&CNT_03.'
,p_security_scheme=>wwv_flow_api.id(15713723918932486510)
,p_required_patch=>wwv_flow_api.id(17177501492525447045)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'5'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(15882079025953545921)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Customer Types'
,p_list_item_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-edit'
,p_list_text_01=>'Manage domain of customer types.'
,p_list_text_02=>'formIcon'
,p_list_text_03=>'&CNT_03.'
,p_security_scheme=>wwv_flow_api.id(15713723918932486510)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'5'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(17165426458535764621)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Customer Use Cases'
,p_list_item_link_target=>'f?p=&APP_ID.:104:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-check'
,p_list_text_01=>'Manage domain of customer use cases.'
,p_security_scheme=>wwv_flow_api.id(15713723918932486510)
,p_required_patch=>wwv_flow_api.id(17155700086509368823)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(15882080584200545922)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'Geographies'
,p_list_item_link_target=>'f?p=&APP_ID.:48:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-globe'
,p_list_text_01=>'Manage the list of geographies used to organize customers.'
,p_list_text_02=>'formIcon'
,p_list_text_03=>'&CNT_06.'
,p_security_scheme=>wwv_flow_api.id(15713723918932486510)
,p_required_patch=>wwv_flow_api.id(14994142535261183064)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'48'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(15882081051995545922)
,p_list_item_display_sequence=>90
,p_list_item_link_text=>'Industries'
,p_list_item_link_target=>'f?p=&APP_ID.:27:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-building-o'
,p_list_text_01=>'Manage the domain of industries a customer can be assigned to'
,p_list_text_02=>'formIcon'
,p_list_text_03=>'&CNT_09.'
,p_security_scheme=>wwv_flow_api.id(15713723918932486510)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2604546668311753322)
,p_list_item_display_sequence=>95
,p_list_item_link_text=>'Issue Statuses'
,p_list_item_link_target=>'f?p=&APP_ID.:132:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-alert'
,p_list_text_01=>'Manage the domain of statuses a customer issue can be assigned to'
,p_security_scheme=>wwv_flow_api.id(15713723918932486510)
,p_required_patch=>wwv_flow_api.id(2604194588938613786)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(17800759758106874283)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>'Product Families'
,p_list_item_link_target=>'f?p=&APP_ID.:112:&SESSION.::&DEBUG.:RP,RIR,112:::'
,p_list_item_icon=>'fa-tags'
,p_list_text_01=>'Manage the list of available product families that a product can belong to.'
,p_security_scheme=>wwv_flow_api.id(15713723918932486510)
,p_required_patch=>wwv_flow_api.id(14994165819739448501)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'112'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(15882080254814545922)
,p_list_item_display_sequence=>110
,p_list_item_link_text=>'Products'
,p_list_item_link_target=>'f?p=&APP_ID.:42:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-tag'
,p_list_text_01=>'Manage the list of available products that can be associated with a customer.'
,p_list_text_02=>'formIcon'
,p_list_text_03=>'&CNT_05.'
,p_security_scheme=>wwv_flow_api.id(15713723918932486510)
,p_required_patch=>wwv_flow_api.id(14994165819739448501)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'42'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(15882119243794575038)
,p_list_item_display_sequence=>120
,p_list_item_link_text=>'Reference Phases'
,p_list_item_link_target=>'f?p=&APP_ID.:87:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-moon-o'
,p_list_text_01=>'Manage reference life cycle using phases.'
,p_security_scheme=>wwv_flow_api.id(15713723918932486510)
,p_required_patch=>wwv_flow_api.id(14326325438076037979)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(14319034161114225223)
,p_list_item_display_sequence=>130
,p_list_item_link_text=>'Reference Statuses'
,p_list_item_link_target=>'f?p=&APP_ID.:94:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-tags'
,p_list_text_01=>'Manage the reference statuses for customer product assignments.'
,p_security_scheme=>wwv_flow_api.id(15713723918932486510)
,p_required_patch=>wwv_flow_api.id(14326383854805112131)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(15882079778193545922)
,p_list_item_display_sequence=>140
,p_list_item_link_text=>'Reference Types'
,p_list_item_link_target=>'f?p=&APP_ID.:78:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-group'
,p_list_item_disp_cond_type=>'EXPRESSION'
,p_list_item_disp_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APEX_UTIL.GET_BUILD_OPTION_STATUS(',
'    P_APPLICATION_ID => :APP_ID,',
'    P_BUILD_OPTION_NAME => ''Customer Referencability'') = ''INCLUDE''',
'or',
'APEX_UTIL.GET_BUILD_OPTION_STATUS(',
'    P_APPLICATION_ID => :APP_ID,',
'    P_BUILD_OPTION_NAME => ''Product Referencability'') = ''INCLUDE'''))
,p_list_item_disp_condition2=>'PLSQL'
,p_list_text_01=>'Manage domain of customer reference types.'
,p_security_scheme=>wwv_flow_api.id(15713723918932486510)
,p_required_patch=>wwv_flow_api.id(14326383854805112131)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'78'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(15882134810935665666)
,p_list_item_display_sequence=>150
,p_list_item_link_text=>'Sales Channels'
,p_list_item_link_target=>'f?p=&APP_ID.:89:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-exchange'
,p_list_text_01=>'Manage domain of available sales channels'
,p_security_scheme=>wwv_flow_api.id(15713723918932486510)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.component_end;
end;
/
