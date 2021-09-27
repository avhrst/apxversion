prompt --application/shared_components/user_interface/themes
begin
--   Manifest
--     THEME: 100
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>4200481731648079
,p_default_application_id=>100
,p_default_id_offset=>0
,p_default_owner=>'VCONTROL'
);
wwv_flow_api.create_theme(
 p_id=>wwv_flow_api.id(4529554108976826)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_ui_type_name=>'DESKTOP'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_reference_id=>4070917134413059350
,p_is_locked=>false
,p_default_page_template=>wwv_flow_api.id(4416092116976753)
,p_default_dialog_template=>wwv_flow_api.id(4425415030976760)
,p_error_template=>wwv_flow_api.id(4420086595976756)
,p_printer_friendly_template=>wwv_flow_api.id(4416092116976753)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_api.id(4420086595976756)
,p_default_button_template=>wwv_flow_api.id(4526786873976811)
,p_default_region_template=>wwv_flow_api.id(4466589741976779)
,p_default_chart_template=>wwv_flow_api.id(4466589741976779)
,p_default_form_template=>wwv_flow_api.id(4466589741976779)
,p_default_reportr_template=>wwv_flow_api.id(4466589741976779)
,p_default_tabform_template=>wwv_flow_api.id(4466589741976779)
,p_default_wizard_template=>wwv_flow_api.id(4466589741976779)
,p_default_menur_template=>wwv_flow_api.id(4441660087976770)
,p_default_listr_template=>wwv_flow_api.id(4466589741976779)
,p_default_irr_template=>wwv_flow_api.id(4435368372976767)
,p_default_report_template=>wwv_flow_api.id(4489133200976789)
,p_default_label_template=>wwv_flow_api.id(4524217034976808)
,p_default_menu_template=>wwv_flow_api.id(4528152894976811)
,p_default_calendar_template=>wwv_flow_api.id(4528271513976813)
,p_default_list_template=>wwv_flow_api.id(4522359451976806)
,p_default_nav_list_template=>wwv_flow_api.id(4513353870976802)
,p_default_top_nav_list_temp=>wwv_flow_api.id(4513353870976802)
,p_default_side_nav_list_temp=>wwv_flow_api.id(4511512546976801)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_api.id(4437240310976768)
,p_default_dialogr_template=>wwv_flow_api.id(4473352929976782)
,p_default_option_label=>wwv_flow_api.id(4524217034976808)
,p_default_required_label=>wwv_flow_api.id(4525586024976809)
,p_default_page_transition=>'NONE'
,p_default_popup_transition=>'NONE'
,p_default_navbar_list_template=>wwv_flow_api.id(4514395569976803)
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
