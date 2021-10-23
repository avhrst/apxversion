prompt --application/shared_components/navigation/breadcrumbs/breadcrumb1
begin
--   Manifest
--     MENU: Breadcrumb1
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>4200481731648079
,p_default_application_id=>100
,p_default_id_offset=>39500229701756973
,p_default_owner=>'VCONTROL'
);
wwv_flow_api.create_menu(
 p_id=>wwv_flow_api.id(17836049276560714912)
,p_name=>'Breadcrumb1'
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(15867087113203942001)
,p_parent_id=>wwv_flow_api.id(15728330110393198200)
,p_short_name=>'User Details'
,p_link=>'f?p=&APP_ID.:58:&SESSION.::&DEBUG.:::'
,p_page_id=>58
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(17836259170851751094)
,p_parent_id=>wwv_flow_api.id(17836283880042867305)
,p_short_name=>'Customer Details'
,p_link=>'f?p=&APP_ID.:2:&SESSION.:HOME_CUSTOMER_DETAILS:&DEBUG.:RP,7::'
,p_page_id=>2
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(17836283880042867305)
,p_short_name=>'Customers'
,p_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_page_id=>1
);
wwv_flow_api.component_end;
end;
/
