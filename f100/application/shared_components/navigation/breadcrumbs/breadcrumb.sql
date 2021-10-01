prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
--   Manifest
--     MENU: Breadcrumb
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>4200481731648079
,p_default_application_id=>100
,p_default_id_offset=>5389331382356895884
,p_default_owner=>'VCONTROL'
);
wwv_flow_api.create_menu(
 p_id=>wwv_flow_api.id(5986295761768449043)
,p_name=>'Breadcrumb'
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(813471178209937784)
,p_short_name=>'Advanced'
,p_link=>'f?p=&APP_ID.:19:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>19
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(813481568560036222)
,p_short_name=>'Basics'
,p_link=>'f?p=&APP_ID.:20:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>20
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(813497374784846114)
,p_short_name=>'Images and Media'
,p_link=>'f?p=&APP_ID.:21:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>21
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(813503884542941725)
,p_short_name=>'Card Actions'
,p_link=>'f?p=&APP_ID.:22:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>22
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(813507692067973634)
,p_parent_id=>wwv_flow_api.id(813481568560036222)
,p_short_name=>'Color Coded Cards'
,p_link=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.:::'
,p_page_id=>18
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(813508362174981670)
,p_parent_id=>wwv_flow_api.id(813481568560036222)
,p_short_name=>'Faceted Search'
,p_link=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:::'
,p_page_id=>12
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(813509154871988610)
,p_parent_id=>wwv_flow_api.id(813481568560036222)
,p_short_name=>'Star Icons'
,p_link=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:::'
,p_page_id=>13
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(813509867982995648)
,p_parent_id=>wwv_flow_api.id(813481568560036222)
,p_short_name=>'Styles'
,p_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:::'
,p_page_id=>3
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(813512357610029323)
,p_parent_id=>wwv_flow_api.id(813497374784846114)
,p_short_name=>'BLOB Column as URL'
,p_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:::'
,p_page_id=>5
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(813513279060035876)
,p_parent_id=>wwv_flow_api.id(813497374784846114)
,p_short_name=>'Image URL'
,p_link=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:::'
,p_page_id=>4
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(813514632067049706)
,p_parent_id=>wwv_flow_api.id(813497374784846114)
,p_short_name=>'Embedded Video'
,p_link=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:::'
,p_page_id=>6
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(813516478106069162)
,p_parent_id=>wwv_flow_api.id(813497374784846114)
,p_short_name=>'Background Image'
,p_link=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:::'
,p_page_id=>7
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(813517372927077326)
,p_parent_id=>wwv_flow_api.id(813497374784846114)
,p_short_name=>'Application Static Files'
,p_link=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:::'
,p_page_id=>8
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(813565556708848753)
,p_parent_id=>wwv_flow_api.id(813503884542941725)
,p_short_name=>'Conditional Actions'
,p_link=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.:::'
,p_page_id=>16
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(813566890304874932)
,p_parent_id=>wwv_flow_api.id(813503884542941725)
,p_short_name=>'Full Card Action'
,p_link=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.:::'
,p_page_id=>15
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(813572105218892556)
,p_parent_id=>wwv_flow_api.id(813471178209937784)
,p_short_name=>'Charts'
,p_link=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:::'
,p_page_id=>11
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(813573482093902711)
,p_parent_id=>wwv_flow_api.id(813471178209937784)
,p_short_name=>'No Data Found'
,p_link=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:::'
,p_page_id=>17
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(813574106352909161)
,p_parent_id=>wwv_flow_api.id(813471178209937784)
,p_short_name=>'Template Directives'
,p_link=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:::'
,p_page_id=>9
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(813950046556126747)
,p_parent_id=>wwv_flow_api.id(813497374784846114)
,p_short_name=>'Video Images with Durations'
,p_link=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:::'
,p_page_id=>10
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5986295946252449043)
,p_short_name=>'Home'
,p_link=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.'
,p_page_id=>1
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5986449600918449294)
,p_parent_id=>wwv_flow_api.id(813497374784846114)
,p_short_name=>'BLOB Column'
,p_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::'
,p_page_id=>2
);
wwv_flow_api.component_end;
end;
/
