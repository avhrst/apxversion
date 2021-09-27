prompt --application/shared_components/user_interface/themes
begin
--   Manifest
--     THEME: 101
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>4200481731648079
,p_default_application_id=>101
,p_default_id_offset=>0
,p_default_owner=>'VCONTROL'
);
wwv_flow_api.create_theme(
 p_id=>wwv_flow_api.id(8528997277351778)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_ui_type_name=>'DESKTOP'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_reference_id=>4070917134413059350
,p_is_locked=>false
,p_default_page_template=>wwv_flow_api.id(8415420522351706)
,p_default_dialog_template=>wwv_flow_api.id(8423372885351710)
,p_error_template=>wwv_flow_api.id(8417906166351707)
,p_printer_friendly_template=>wwv_flow_api.id(8415420522351706)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_api.id(8417906166351707)
,p_default_button_template=>wwv_flow_api.id(8526109823351766)
,p_default_region_template=>wwv_flow_api.id(8461049887351730)
,p_default_chart_template=>wwv_flow_api.id(8461049887351730)
,p_default_form_template=>wwv_flow_api.id(8461049887351730)
,p_default_reportr_template=>wwv_flow_api.id(8461049887351730)
,p_default_tabform_template=>wwv_flow_api.id(8461049887351730)
,p_default_wizard_template=>wwv_flow_api.id(8461049887351730)
,p_default_menur_template=>wwv_flow_api.id(8470498392351734)
,p_default_listr_template=>wwv_flow_api.id(8461049887351730)
,p_default_irr_template=>wwv_flow_api.id(8459132317351729)
,p_default_report_template=>wwv_flow_api.id(8488514609351743)
,p_default_label_template=>wwv_flow_api.id(8523628394351763)
,p_default_menu_template=>wwv_flow_api.id(8527584491351767)
,p_default_calendar_template=>wwv_flow_api.id(8527672976351768)
,p_default_list_template=>wwv_flow_api.id(8521761258351761)
,p_default_nav_list_template=>wwv_flow_api.id(8512779282351757)
,p_default_top_nav_list_temp=>wwv_flow_api.id(8512779282351757)
,p_default_side_nav_list_temp=>wwv_flow_api.id(8510957660351755)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_api.id(8431096532351717)
,p_default_dialogr_template=>wwv_flow_api.id(8430039728351716)
,p_default_option_label=>wwv_flow_api.id(8523628394351763)
,p_default_required_label=>wwv_flow_api.id(8524992915351764)
,p_default_page_transition=>'NONE'
,p_default_popup_transition=>'NONE'
,p_default_navbar_list_template=>wwv_flow_api.id(8513734793351757)
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#IMAGE_PREFIX#themes/theme_42/21.1/')
,p_files_version=>64
,p_icon_library=>'FONTAPEX'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#THEME_IMAGES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_IMAGES#css/Core#MIN#.css?v=#APEX_VERSION#'
);
wwv_flow_api.component_end;
end;
/
