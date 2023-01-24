prompt --application/pages/page_00001
begin
--   Manifest
--     PAGE: 00001
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.0'
,p_default_workspace_id=>1473643633966533
,p_default_application_id=>301
,p_default_id_offset=>239678426880702288
,p_default_owner=>'RXDSSH'
);
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(252056010160737461)
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>'Home'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(397180286431757845)
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function My_Studies_IRR(){',
'    $(''#PRO_LEAD .a-IRR-headerLink'')',
'    .append(''<span class="fa fa-info-circle-o" style="padding-left:4px;" title="This is the Lead Project Manager assigned to the study in GRM; must be assigned as a PRJMGR in GRM. If no lead PRJMGR assigned, nothing will be displayed."></span>'');',
'};'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//For Vertical Filter - Don''t miss few Inline css in page level',
'$($("#FILTERSe").parent()).css({"padding-right":"0px","padding-left":"0px","width":"3%"});',
'$("#FILTERSe").css({"height":"100px","border":"none","box-shadow":"none","border-radius":"0px"});',
'$("#FILTERSe_heading").css({"writing-mode":"vertical-rl","transform":"rotate(-180deg)","padding-left": "8px"});',
'$($("#ParentFilterSe").parent()).css({"padding-left":"0px","width":"97%"});',
'$("#ParentFilterSe").css({"height":"100px","border-radius":"0px","overflow":"hidden"});',
'',
'$("#P3_PHASE").attr(',
'   "data-placeholder","Select"',
');',
'',
'// if (apex.item("P1_TEST").getValue() === "Value1"){',
'//      $(".apex-rds [href=''#TAB1'']").trigger(''click''); ',
'// } else if (apex.item("P1_TEST").getValue() === "Value2"){',
'//      $(".apex-rds [href=''#TAB2'']").trigger(''click'');',
'// } ',
'',
'',
'$( document ).ready(function() {',
'    //$("#SR_ALL_STUDIES_tab a").trigger("click");',
'//    $("#STUDY_TABS .a-Tabs").aTabs("getTabs")["#SR_ALL_STUDIES"].makeActive();',
'});',
'',
'',
'//$("#SR_ALL_STUDIES_tab a").trigger("click");',
'My_Studies_IRR();'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*For Vertical Filter */',
'',
'#FILTERSe .t-Region-bodyWrap{',
'    display:none;',
'}',
'#FILTERSe .t-Region-header{',
'    padding-left:4px;',
'    background-color: #0066cc !important;',
'    color: #ffffff !important;',
'    letter-spacing: 0.2em;',
'    border-radius: 0px;',
'    border-top:none;',
'    height: 100%;',
'}',
'#FILTERSe .t-Region-header .t-Region-headerItems--title {',
'    flex-grow: 0;',
'    font-size:17px;',
'    text-align: center;',
'    padding: 0px;',
'    display: block;',
'    line-height: 16px;',
'    margin: auto;',
'}',
'.fa-filter {',
'    font-size: 17px;',
'    padding-right: 5px;',
'}',
'#ParentFilterSe {',
'    border-top: 1px solid rgba(0,0,0,.1) !important;',
'}',
'/* #SR_ALL_STUDIES{',
'    display: none;',
'} */'))
,p_step_template=>wwv_flow_api.id(270140606658440193)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_comment=>'12322'
,p_last_updated_by=>'OLEKSII.VYKHRYSTIUK@SYNEOSHEALTH.COM'
,p_last_upd_yyyymmddhh24miss=>'20230124045505'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(416176688485332433)
,p_plug_name=>'Landing Region'
,p_region_css_classes=>'gradientBorder'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Tabs--simple'
,p_plug_template=>wwv_flow_api.id(251949329544737387)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_list_id=>wwv_flow_api.id(403087902273926985)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(252024658594737428)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(416176648869332432)
,p_plug_name=>'MY STUDIES'
,p_region_name=>'MY_STUDIES_REPORT'
,p_parent_plug_id=>wwv_flow_api.id(416176688485332433)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(251949329544737387)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT',
'    sp.sh_study_profile_id,',
'    sp.project_code,',
'    (select STUDY_STATUS from SH_STUDY_STATUS where SH_STUDY_STATUS_ID=sp.SH_STUDY_STATUS_ID ) SH_STUDY_STATUS_ID,',
'    (select STUDY_SUB_STATUS from SH_STUDY_SUB_STATUS where SH_STUDY_SUB_STATUS_ID=sp.SH_STUDY_SUB_STATUS_ID ) SH_STUDY_SUB_STATUS_ID,',
'    sp.sponsor,',
'    sp.protocol_number,',
'    (SELECT trusted_process_study_stage_name FROM sh_trusted_process_study_stage ',
'        WHERE sh_trusted_process_study_stage_id = sp.sh_trusted_process_study_stage_id',
'    ) trusted_process_study_stage_name,',
'   -- (SELECT last_name|| '',''|| first_name FROM sh_user WHERE employee_id = sp.project_lead) project_lead,',
'    --sp.project_lead ',
'    SH_GET_STUDY_ROLE_USERS(sp.SH_STUDY_PROFILE_ID, ''PRJMGR'') project_lead,',
'    --sp.contract_start_date,',
'    --sp.contract_end_date,',
'    --sp.planned_date,',
'    --sp.actual_date,',
'    (select Max(b.BASELINE_CONTRACT_DATE) ',
'      from SH_STUDY_PROFILE_MILESTONE b, SH_MILESTONE_LIBRARY c',
'        where b.SH_STUDY_PROFILE_ID = sp.SH_STUDY_PROFILE_ID',
'            AND b.SH_MILESTONE_LIBRARY_ID = c.SH_MILESTONE_LIBRARY_ID',
'           -- AND c.STATUS = ''ACTV''',
'           -- AND sysdate between nvl(c.START_DATE,sysdate) and nvl(c.END_DATE,sysdate)',
'            AND c.MILESTONE_NAME = ''Start Date''',
'            AND b.status = ''ACTV''',
'            ) contract_start_date,',
'    (select Max(b.BASELINE_CONTRACT_DATE) ',
'      from SH_STUDY_PROFILE_MILESTONE b, SH_MILESTONE_LIBRARY c',
'        where b.SH_STUDY_PROFILE_ID = sp.SH_STUDY_PROFILE_ID',
'            AND b.SH_MILESTONE_LIBRARY_ID = c.SH_MILESTONE_LIBRARY_ID',
'           -- AND c.STATUS = ''ACTV''',
'           -- AND sysdate between nvl(c.START_DATE,sysdate) and nvl(c.END_DATE,sysdate)',
'            AND c.MILESTONE_NAME = ''Operationally Complete''',
'            AND b.status = ''ACTV''',
'            ) contract_end_date,',
'    (select Max(b.PLANNED_DATE) ',
'      from SH_STUDY_PROFILE_MILESTONE b, SH_MILESTONE_LIBRARY c',
'        where b.SH_STUDY_PROFILE_ID = sp.SH_STUDY_PROFILE_ID',
'            AND b.SH_MILESTONE_LIBRARY_ID = c.SH_MILESTONE_LIBRARY_ID',
'           -- AND c.STATUS = ''ACTV''',
'           -- AND sysdate between nvl(c.START_DATE,sysdate) and nvl(c.END_DATE,sysdate)',
'            AND c.MILESTONE_NAME = ''Start Date''',
'            AND b.status = ''ACTV''',
'            ) planned_date,',
'    (select Max(b.PLANNED_DATE) ',
'      from SH_STUDY_PROFILE_MILESTONE b, SH_MILESTONE_LIBRARY c',
'        where b.SH_STUDY_PROFILE_ID = sp.SH_STUDY_PROFILE_ID',
'            AND b.SH_MILESTONE_LIBRARY_ID = c.SH_MILESTONE_LIBRARY_ID',
'           -- AND c.STATUS = ''ACTV''',
'           -- AND sysdate between nvl(c.START_DATE,sysdate) and nvl(c.END_DATE,sysdate)',
'            AND c.MILESTONE_NAME = ''Operationally Complete''',
'            AND b.status = ''ACTV''',
'            ) actual_date,',
'    decode(NVL(sp.PV_MIGRATED_STUDY,''N''),''Y'',''Yes'',''N'',''No'',sp.PV_MIGRATED_STUDY) as PV_MIGRATED_STUDY',
'FROM',
'    SH_AUTH_USER_ROLES ura,',
'    sh_study_team_assignment sta,',
'    sh_study_profile sp',
'WHERE 1 = 1',
'    AND ura.sh_user_id = :g_user_id',
'    AND ura.sh_user_role_assignment_id = sta.sh_user_role_assignment_id ',
'    AND sta.sh_study_profile_id = sp.sh_study_profile_id',
'    AND sp.status = ''ACTV''',
'    AND sta.status = ''ACTV''',
'    AND trunc(SYSDATE) between NVL(trunc(sta.START_DATE), trunc(SYSDATE)) and NVL(trunc(sta.END_DATE), trunc(SYSDATE))  ',
'    AND ura.HAS_STUDY_ACCESS = ''Y'''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'MY STUDIES'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(416176495669332431)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_sort=>'N'
,p_show_control_break=>'N'
,p_show_highlight=>'N'
,p_show_computation=>'N'
,p_show_aggregate=>'N'
,p_show_chart=>'N'
,p_show_group_by=>'N'
,p_show_pivot=>'N'
,p_show_flashback=>'N'
,p_show_help=>'N'
,p_download_formats=>'CSV:XLSX'
,p_enable_mail_download=>'N'
,p_owner=>'ANNA.BONDARENKO@SYNEOSHEALTH.COM'
,p_internal_uid=>63180358092072145
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(416176386537332430)
,p_db_column_name=>'SH_STUDY_PROFILE_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Sh Study Profile Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(416176326904332429)
,p_db_column_name=>'PROJECT_CODE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Project Code'
,p_column_link=>'f?p=&APP_ID.:8:&SESSION.:APEX_CLONE_SESSION:&DEBUG.:8:P0_STUDY_PROFILE_ID:#SH_STUDY_PROFILE_ID##IS_MY_STUDIES#'
,p_column_linktext=>'#PROJECT_CODE#'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(416176028516332426)
,p_db_column_name=>'SPONSOR'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Sponsor'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(403085406989855475)
,p_db_column_name=>'PROTOCOL_NUMBER'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Protocol #'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(403085160992855473)
,p_db_column_name=>'PROJECT_LEAD'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Project Lead  '
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_static_id=>'PRO_LEAD'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(403085084267855472)
,p_db_column_name=>'CONTRACT_START_DATE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Start Date (Contract /Baseline)'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(403084956136855471)
,p_db_column_name=>'CONTRACT_END_DATE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'End Date (Contract /Baseline)'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(403084901654855470)
,p_db_column_name=>'PLANNED_DATE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Start Date (Planned)'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(403084778364855469)
,p_db_column_name=>'ACTUAL_DATE'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'End Date (Planned)'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(403085311781855474)
,p_db_column_name=>'TRUSTED_PROCESS_STUDY_STAGE_NAME'
,p_display_order=>130
,p_column_identifier=>'G'
,p_column_label=>'Trusted Process Study Stage'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(416176251045332428)
,p_db_column_name=>'SH_STUDY_STATUS_ID'
,p_display_order=>150
,p_column_identifier=>'C'
,p_column_label=>'Study Status'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(416176122710332427)
,p_db_column_name=>'SH_STUDY_SUB_STATUS_ID'
,p_display_order=>160
,p_column_identifier=>'D'
,p_column_label=>'Study Sub-Status '
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(395548551569348373)
,p_db_column_name=>'PV_MIGRATED_STUDY'
,p_display_order=>170
,p_column_identifier=>'O'
,p_column_label=>'Study Migrated From PV?'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(403070366114786752)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'762865'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'PROJECT_CODE:SH_STUDY_STATUS_ID:SH_STUDY_SUB_STATUS_ID:SPONSOR:PROTOCOL_NUMBER:TRUSTED_PROCESS_STUDY_STAGE_NAME:PROJECT_LEAD:CONTRACT_START_DATE:PLANNED_DATE:CONTRACT_END_DATE:ACTUAL_DATE:'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(273802190176198117)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(416176648869332432)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(252031403241737435)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'reset_report_btn'
,p_icon_css_classes=>'fa-undo-arrow'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(272252491412087250)
,p_name=>'Pagination For IRR'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(272252954050087251)
,p_event_id=>wwv_flow_api.id(272252491412087250)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'PLUGIN_IR.PAGINATION'
,p_affected_elements_type=>'REGION'
,p_attribute_01=>'Total rows:'
,p_attribute_02=>'First page'
,p_attribute_03=>'Last page'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(272251566849087250)
,p_name=>'Pagination For IRR_1'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(272255733903087252)
,p_name=>'Refresh All studies for project code'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_PROJECT_CODE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(273802314284198118)
,p_name=>'Reset Report'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(273802190176198117)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(273802402418198119)
,p_event_id=>wwv_flow_api.id(273802314284198118)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_region_id apex_application_page_regions.region_id%type;',
'begin',
'',
'    select region_id into l_region_id',
'    from apex_application_page_regions',
'    where application_id = :APP_ID',
'    and page_id = :APP_PAGE_ID',
'    and static_id = ''MY_STUDIES_REPORT'';--update this accordingly',
'    ',
'    apex_ir.reset_report(',
'        p_page_id => :APP_PAGE_ID',
'      , p_region_id => l_region_id',
'      , p_report_id => NULL',
'    );',
'    ',
'end;'))
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(273802526346198120)
,p_event_id=>wwv_flow_api.id(273802314284198118)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(416176648869332432)
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(365371217204660826)
,p_name=>'My_Studies_IRR'
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(416176648869332432)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(348440240914036875)
,p_event_id=>wwv_flow_api.id(365371217204660826)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if(($(''#PRO_LEAD .a-IRR-headerLink'').children().length) == 0){',
'    My_Studies_IRR();',
'};',
''))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(272328851067429224)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Redirect'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'if :G_LANDING_PAGE = 3 and :APP_PAGE_ID = ''1'' then',
'    apex_util.redirect_url (p_url => ''f?p=&APP_ID.:3:&APP_SESSION.:'');',
'end if;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'MANUAL_MY_STUDIES,DOWNLOAD'
,p_process_when_type=>'REQUEST_NOT_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(272249750566087246)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'G_SHOW_PROJECT_INFO'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':G_SHOW_PROJECT_INFO := ''N''; ',
'',
'-- BEGIN',
'--     SELECT nvl(max(''Y''),''N'') INTO :P1_LANDING_ON_ALL_STUDIES FROM SH_AUTH_USER_ROLES WHERE 1=1',
'--         AND SH_USER_ID = :G_USER_ID',
'--         AND ROLE_SOURCE = ''Custom''',
'--         AND USER_ROLE_NAME in (''CUST_ADMIN'',''CUST_APP_SUPPORT'',''CUST_EXEC'');',
'--     EXCEPTION WHEN OTHERS THEN',
'--         :P1_LANDING_ON_ALL_STUDIES := ''N'';',
'-- END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.component_end;
end;
/
