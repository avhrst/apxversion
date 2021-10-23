prompt --application/pages/page_00124
begin
--   Manifest
--     PAGE: 00124
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>4200481731648079
,p_default_application_id=>100
,p_default_id_offset=>39500229701756973
,p_default_owner=>'VCONTROL'
);
wwv_flow_api.create_page(
 p_id=>124
,p_user_interface_id=>wwv_flow_api.id(14582016822628385285)
,p_name=>'Timeline'
,p_alias=>'TIMELINE'
,p_step_title=>'Timeline'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//$x(''P10_SEARCH'').focus();',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Timeline-type.is-updated {',
'    background-color: #cd4411;',
'    color: #FFF;',
'}'))
,p_step_template=>wwv_flow_api.id(14897195001700526770)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_help_text=>'The "Timeline" page shows a history of application transactions. Use the filter controls on the left to change the results displayed on the right.'
,p_last_updated_by=>'ALLAN'
,p_last_upd_yyyymmddhh24miss=>'20210301102539'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(7266457280423796176)
,p_name=>'Timeline'
,p_template=>wwv_flow_api.id(14897235571213526829)
,p_display_sequence=>60
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--hideHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    c.created SORT_COLUMN,',
'    null EVENT_ATTRIBUTES,',
'    null EVENT_MODIFIERS,',
'    ''u-color-''|| (ora_hash(c.created_by,44) + 1) USER_COLOR,',
'    upper( decode(instr(replace(c.created_by,''.'','' ''),'' ''),',
'                0, ',
'                substr(c.created_by,1,2),',
'                substr(c.created_by,1,1)||substr(c.created_by,instr(replace(c.created_by,''.'','' ''),'' '')+1,1)',
'           ))  USER_AVATAR,',
'    c.created_by as user_name,',
'    c.created EVENT_DATE,',
'    ''fa fa-user'' EVENT_ICON,',
'    ''is-new'' EVENT_STATUS,',
'    ''Customer Added'' EVENT_TYPE,',
'    c.customer_name EVENT_TITLE,',
'    c.summary EVENT_DESC,',
'    apex_util.prepare_url(''f?p=''||:APP_ID||'':50:''||:APP_SESSION||'':::50:P50_ID:''||c.id) event_link',
'from EBA_CUST_CUSTOMERS c',
'where c.created > (current_timestamp - :P124_TIMEFRAME)',
'    and ( :P124_CUSTOMER is null or c.id = :P124_CUSTOMER )',
'    and ( :P124_UPDATE_BY is null or lower(c.created_by) = lower(:P124_UPDATE_BY) )',
'union all',
'select',
'    n.created SORT_COLUMN,',
'    null EVENT_ATTRIBUTES,',
'    null EVENT_MODIFIERS,',
'    ''u-color-''|| (ora_hash(n.created_by,44) + 1) USER_COLOR,',
'    upper( decode(instr(replace(n.created_by,''.'','' ''),'' ''),',
'                0, ',
'                substr(n.created_by,1,2),',
'                substr(n.created_by,1,1)||substr(n.created_by,instr(replace(n.created_by,''.'','' ''),'' '')+1,1)',
'           ))  USER_AVATAR,',
'    n.created_by as user_name,',
'    n.created EVENT_DATE,',
'    ''fa fa-file'' EVENT_ICON,',
'    ''is-new'' EVENT_STATUS,',
'    ''Customer Added Note'' EVENT_TYPE,',
'    (select customer_name from eba_cust_customers c where c.id = n.customer_id) EVENT_TITLE,',
'    TO_CHAR(dbms_lob.substr(n.note, length(n.note), 1 )) EVENT_DESC,',
'    apex_util.prepare_url(''f?p=''||:APP_ID||'':50:''||:APP_SESSION||'':::50:P50_ID:''||n.customer_id) event_link',
'from EBA_CUST_NOTES n',
'where n.created > (current_timestamp - :P124_TIMEFRAME)',
'    and ( :P124_CUSTOMER is null or n.customer_id = :P124_CUSTOMER )',
'    and ( :P124_UPDATE_BY is null or lower(n.created_by) = lower(:P124_UPDATE_BY) )',
'union all',
'select',
'    c.created SORT_COLUMN,',
'    null EVENT_ATTRIBUTES,',
'    null EVENT_MODIFIERS,',
'    ''u-color-''|| (ora_hash(c.created_by,44) + 1) USER_COLOR,',
'    upper( decode(instr(replace(c.created_by,''.'','' ''),'' ''),',
'                0, ',
'                substr(c.created_by,1,2),',
'                substr(c.created_by,1,1)||substr(c.created_by,instr(replace(c.created_by,''.'','' ''),'' '')+1,1)',
'           ))  USER_AVATAR,',
'    c.created_by as user_name,',
'    c.created EVENT_DATE,',
'    ''fa fa-user'' EVENT_ICON,',
'    ''is-new'' EVENT_STATUS,',
'    ''Customer Added Contact'' EVENT_TYPE,',
'    (select customer_name from eba_cust_customers c where c.id = c.customer_id) EVENT_TITLE,',
'    c.name EVENT_DESC,',
'    apex_util.prepare_url(''f?p=''||:APP_ID||'':50:''||:APP_SESSION||'':::50:P50_ID:''||c.customer_id) event_link',
'from EBA_CUST_CONTACTS c',
'where c.created > (current_timestamp - :P124_TIMEFRAME)',
'    and ( :P124_CUSTOMER is null or c.customer_id = :P124_CUSTOMER )',
'    and ( :P124_UPDATE_BY is null or lower(c.created_by) = lower(:P124_UPDATE_BY) )',
'union all',
'select f.created SORT_COLUMN,',
'    null EVENT_ATTRIBUTES,',
'    null EVENT_MODIFIERS,',
'    ''u-color-''|| (ora_hash(f.created_by,44) + 1) USER_COLOR,',
'    upper( decode(instr(replace(f.created_by,''.'','' ''),'' ''),',
'                0, ',
'                substr(f.created_by,1,2),',
'                substr(f.created_by,1,1)||substr(f.created_by,instr(replace(f.created_by,''.'','' ''),'' '')+1,1)',
'           ))  USER_AVATAR,',
'    f.created_by as user_name,',
'    f.created EVENT_DATE,',
'    ''fa fa-paperclip'' EVENT_ICON,',
'    ''is-new'' EVENT_STATUS,',
'    ''Customer Added Attachment'' EVENT_TYPE,',
'    (select customer_name from eba_cust_customers c where c.id = f.customer_id) EVENT_TITLE,',
'    substr(f.FILE_NAME,1,255) || '' '' || substr(f.FILE_COMMENTS,1,200) EVENT_DESC,',
'    apex_util.prepare_url(''f?p=''||:APP_ID||'':50:''||:APP_SESSION||'':::50:P50_ID:''||f.customer_id) event_link',
'from EBA_CUST_FILES f',
'where f.created > (current_timestamp - :P124_TIMEFRAME)',
'    and ( :P124_CUSTOMER is null or f.customer_id = :P124_CUSTOMER )',
'    and ( :P124_UPDATE_BY is null or lower(f.created_by) = lower(:P124_UPDATE_BY) )',
'union all',
'select l.created SORT_COLUMN,',
'    null EVENT_ATTRIBUTES,',
'    null EVENT_MODIFIERS,',
'    ''u-color-''|| (ora_hash(l.created_by,44) + 1) USER_COLOR,',
'    upper( decode(instr(replace(l.created_by,''.'','' ''),'' ''),',
'                0, ',
'                substr(l.created_by,1,2),',
'                substr(l.created_by,1,1)||substr(l.created_by,instr(replace(l.created_by,''.'','' ''),'' '')+1,1)',
'           ))  USER_AVATAR,',
'    l.created_by as user_name,',
'    l.created EVENT_DATE,',
'    ''fa fa-external-link'' EVENT_ICON,',
'    ''is-new'' EVENT_STATUS,',
'    ''Customer Added Link'' EVENT_TYPE,',
'    (select customer_name from eba_cust_customers c where c.id = l.customer_id) EVENT_TITLE,',
'    substr(nvl(LINK_DESC,LINK),1,255) || '' ''||substr(link_comments,1,200) EVENT_DESC,',
'    apex_util.prepare_url(''f?p=''||:APP_ID||'':50:''||:APP_SESSION||'':::50:P50_ID:''||l.customer_id) event_link',
'from EBA_CUST_LINKS l',
'where l.created > (current_timestamp - :P124_TIMEFRAME)',
'    and ( :P124_CUSTOMER is null or l.customer_id = :P124_CUSTOMER )',
'    and ( :P124_UPDATE_BY is null or lower(l.created_by) = lower(:P124_UPDATE_BY) )',
'union all',
'select h.change_date SORT_COLUMN,',
'    null EVENT_ATTRIBUTES,',
'    null EVENT_MODIFIERS,',
'    ''u-color-''|| (ora_hash(c.updated_by,44) + 1) USER_COLOR,',
'    upper( decode(instr(replace(c.updated_by,''.'','' ''),'' ''),',
'                0, ',
'                substr(c.updated_by,1,2),',
'                substr(c.updated_by,1,1)||substr(c.updated_by,instr(replace(c.updated_by,''.'','' ''),'' '')+1,1)',
'           ))  USER_AVATAR,',
'    h.changed_by as user_name,',
'    h.change_date EVENT_DATE,',
'    ''fa fa-archive'' EVENT_ICON,',
'    ''is-updated'' EVENT_STATUS,',
'    case when substr(h.table_name,-1) = ''S'' then initcap(substr(h.table_name, 1, length(h.table_name) - 1)) else initcap(h.table_name) end || '' Updated '' || initcap(replace(replace(h.column_name,''_ID'',null),''_'','' '')) EVENT_TYPE,',
'    c.customer_name EVENT_TITLE,',
'    case',
'        when (substr(h.old_value, 3, 1) = ''-'' and substr(h.old_value, 7, 1) = ''-'' and length(h.old_value) > 11) or',
'             (substr(h.new_value, 3, 1) = ''-'' and substr(h.new_value, 7, 1) = ''-'' and length(h.new_value) > 11) then',
'            ''Changed from '' || case when h.old_value is not null then ''<span class="t-Comments-text--prevValue">'' else null end ||',
'            apex_escape.html(substr(nvl(h.old_value, ''Unassigned''), 1, 11)) || case when h.old_value is not null then ''</span>'' else null end ||',
'            '' to <span class="t-Comments-text--newValue">''||',
'            apex_escape.html(substr(nvl(h.new_value, ''Unassigned''), 1, 11))||''</span>''',
'        else',
'            ''Changed from '' || case when h.old_value is not null then ''<span class="t-Comments-text--prevValue">'' else null end ||',
'            apex_escape.html(substr(nvl(h.old_value, ''Unassigned''),1,255)) || case when h.old_value is not null then ''</span>'' else null end ||',
'            '' to <span class="t-Comments-text--newValue">''||',
'            apex_escape.html(substr(nvl(h.new_value, ''Unassigned''),1,255))||''</span>''',
'    end as event_desc,',
'    apex_util.prepare_url(''f?p=''||:APP_ID||'':50:''||:APP_SESSION||'':::50:P50_ID:''||c.id) event_link',
'from EBA_CUST_HISTORY h, eba_cust_customers c',
'where h.COMPONENT_ID = c.id',
'    and h.change_date > (current_timestamp - :P124_TIMEFRAME)',
'    and ( :P124_CUSTOMER is null or c.id = :P124_CUSTOMER )',
'    and ( :P124_UPDATE_BY is null or lower(h.changed_by) = lower(:P124_UPDATE_BY) )',
'union all',
'select h.change_date SORT_COLUMN,',
'    null EVENT_ATTRIBUTES,',
'    null EVENT_MODIFIERS,',
'    ''u-color-''|| (ora_hash(h.changed_by,44) + 1) USER_COLOR,',
'    upper( decode(instr(replace(h.changed_by,''.'','' ''),'' ''),',
'                0, ',
'                substr(h.changed_by,1,2),',
'                substr(h.changed_by,1,1)||substr(h.changed_by,instr(replace(h.changed_by,''.'','' ''),'' '')+1,1)',
'           ))  USER_AVATAR,',
'    h.changed_by as user_name,',
'    h.change_date EVENT_DATE,',
'    ''fa fa-trash-o'' EVENT_ICON,',
'    ''is-removed'' EVENT_STATUS,',
'    ''Customer Removed'' EVENT_TYPE,',
'    h.old_value EVENT_TITLE,',
'    ''This customer has been removed. The "Customer" link will give a "No Data Found" error.'' as event_desc,',
'    apex_util.prepare_url(''f?p=''||:APP_ID||'':50:''||:APP_SESSION||'':::50:P50_ID:''||h.component_id) event_link',
'from EBA_CUST_HISTORY h',
'where h.column_name = ''CUSTOMER_REMOVED''',
'    and h.change_date > (current_timestamp - :P124_TIMEFRAME)',
'    and ( :P124_CUSTOMER is null or h.component_id = :P124_CUSTOMER )',
'    and ( :P124_UPDATE_BY is null or lower(h.changed_by) = lower(:P124_UPDATE_BY) )',
'order by 7 desc'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P124_CUSTOMER,P124_UPDATE_BY,P124_TIMEFRAME'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_api.id(13637250615210041287)
,p_query_num_rows=>250
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_no_data_found=>'No changes found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2067798432658043328)
,p_query_column_id=>1
,p_column_alias=>'SORT_COLUMN'
,p_column_display_sequence=>12
,p_column_heading=>'Sort Column'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2067798806128043330)
,p_query_column_id=>2
,p_column_alias=>'EVENT_ATTRIBUTES'
,p_column_display_sequence=>1
,p_column_heading=>'Event Attributes'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2067799286223043330)
,p_query_column_id=>3
,p_column_alias=>'EVENT_MODIFIERS'
,p_column_display_sequence=>13
,p_column_heading=>'Event Modifiers'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2067799670656043331)
,p_query_column_id=>4
,p_column_alias=>'USER_COLOR'
,p_column_display_sequence=>2
,p_column_heading=>'User Color'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2067800057536043331)
,p_query_column_id=>5
,p_column_alias=>'USER_AVATAR'
,p_column_display_sequence=>3
,p_column_heading=>'User Avatar'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2067800419162043332)
,p_query_column_id=>6
,p_column_alias=>'USER_NAME'
,p_column_display_sequence=>4
,p_column_heading=>'User Name'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2067800805920043332)
,p_query_column_id=>7
,p_column_alias=>'EVENT_DATE'
,p_column_display_sequence=>5
,p_column_heading=>'Event Date'
,p_use_as_row_header=>'N'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2067801290169043333)
,p_query_column_id=>8
,p_column_alias=>'EVENT_ICON'
,p_column_display_sequence=>6
,p_column_heading=>'Event Icon'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2067801615146043334)
,p_query_column_id=>9
,p_column_alias=>'EVENT_STATUS'
,p_column_display_sequence=>7
,p_column_heading=>'Event Status'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2067802098937043334)
,p_query_column_id=>10
,p_column_alias=>'EVENT_TYPE'
,p_column_display_sequence=>8
,p_column_heading=>'Event Type'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2067802429563043335)
,p_query_column_id=>11
,p_column_alias=>'EVENT_TITLE'
,p_column_display_sequence=>9
,p_column_heading=>'Event Title'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2067802823710043335)
,p_query_column_id=>12
,p_column_alias=>'EVENT_DESC'
,p_column_display_sequence=>10
,p_column_heading=>'Event Desc'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2067803295884043336)
,p_query_column_id=>13
,p_column_alias=>'EVENT_LINK'
,p_column_display_sequence=>11
,p_column_heading=>'Event Link'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10904866536195209312)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(14897238104700526831)
,p_plug_display_sequence=>100
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(17878114474105061390)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(14897253604799526876)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17012294859508188803)
,p_plug_name=>'Filter Controls'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--scrollBody:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(14897235571213526829)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2067804117417043352)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(17012294859508188803)
,p_button_name=>'P124_RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(14897252845630526874)
,p_button_image_alt=>'Reset'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:124:&SESSION.::&DEBUG.:RP,RIR,124::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(2067808940337043407)
,p_branch_action=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:RP,10:P8_SEARCH:&P10_SEARCH.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_comment=>'Created 07-OCT-2010 13:32 by MIKE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2067804588807043356)
,p_name=>'P124_CUSTOMER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(17012294859508188803)
,p_prompt=>'Customer'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'CUSTOMERS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select customer_name d, id r ',
'from EBA_CUST_CUSTOMERS',
'order by upper(customer_name)'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All -'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(15059245737117863663)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2067804953894043365)
,p_name=>'P124_UPDATE_BY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(17012294859508188803)
,p_prompt=>'Updated by'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select lower(username) d, lower(username) r',
'from eba_cust_users',
'order by lower(username)'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Anyone -'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(15059245737117863663)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2067805333082043366)
,p_name=>'P124_TIMEFRAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(17012294859508188803)
,p_item_default=>'7'
,p_prompt=>'Timeframe'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Day;1,Week;7,30 Days;30,60 Days;60,Year;365'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(15059245737117863663)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(2067806418844043390)
,p_computation_sequence=>30
,p_computation_item=>'APPLICATION_TITLE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_app_name varchar2(255);',
'begin',
'    select nvl(preference_value,:APP_NAME)',
'      into l_app_name',
'      from eba_proj_preferences',
'     where preference_name = ''APPLICATION_TITLE'';',
'    return l_app_name;',
'exception',
'    when others then',
'        return :APP_NAME;',
'end;'))
,p_compute_when=>'APPLICATION_TITLE'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(2067806800421043390)
,p_computation_sequence=>50
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'10'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2067807972598043395)
,p_name=>'Update Filters'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P124_CUSTOMER,P124_UPDATE_BY,P124_TIMEFRAME'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2067808460234043403)
,p_event_id=>wwv_flow_api.id(2067807972598043395)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(7266457280423796176)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2067807567888043391)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'replace commas'
,p_process_sql_clob=>':P124_SEARCH := replace(:P124_SEARCH,'','',''[comma]'');'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.component_end;
end;
/
