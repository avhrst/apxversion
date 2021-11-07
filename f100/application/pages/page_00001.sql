prompt --application/pages/page_00001
begin
--   Manifest
--     PAGE: 00001
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
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(14582016822628385285)
,p_name=>'Dashboard'
,p_alias=>'DASHBOARD'
,p_step_title=>'Dashboard'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(14758150710393128197)
,p_step_template=>wwv_flow_api.id(14897195001700526770)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_deep_linking=>'Y'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ALLAN'
,p_last_upd_yyyymmddhh24miss=>'20210301102539'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1094883898252258261)
,p_plug_name=>'Customers by Category'
,p_region_name=>'CUST_BY_CATS'
,p_region_css_classes=>'scrollable-region'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:i-h320:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(14897235571213526829)
,p_plug_display_sequence=>56
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P1_TYPE,P1_SEARCH,P1_USE_CASE,P1_MARQUEE_CUST,P1_PRODUCT,P1_IMP_PARTNER,P1_GEO,P1_COMPETITOR,P1_REFERENCEABLE,P1_SCP_CUST,P1_REFERENCE_TYPES,P1_COUNTRY,P1_STATUS,P1_INDUSTRY,P1_CATEGORY'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_customized=>'1'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(1094884069013258263)
,p_region_id=>wwv_flow_api.id(1094883898252258261)
,p_chart_type=>'bar'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_spark_chart=>'N'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(1094884155851258264)
,p_chart_id=>wwv_flow_api.id(1094884069013258263)
,p_seq=>10
,p_name=>'Category'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  ',
'    b.id,',
'    b.category,',
'    count(*) cnt',
'from   ',
'    eba_cust_customers a, ',
'    eba_cust_categories b,',
'    eba_cust_status c,',
'    eba_cust_geographies d,',
'    eba_cust_type e,',
'    eba_cust_use_case f',
'where a.category_id = b.id',
'    and a.status_id = c.id(+)',
'    and a.geography_id = d.id(+)',
'    and a.type_id = e.id(+)',
'    and a.use_case_id = f.id(+)',
'    and a.category_id is not null',
'    and (:P1_SEARCH is null or',
'            instr(upper(a.customer_name),upper(:P1_SEARCH)) > 0 or',
'                       instr(upper(a.summary),upper(:P1_SEARCH)) > 0 )',
'    and (NVL(:P1_GEO,0) = 0 or :P1_GEO = a.geography_id)',
'    and (NVL(:P1_COUNTRY,0) = 0 or :P1_COUNTRY = a.country_id)',
'    and (NVL(:P1_INDUSTRY,0) = 0 or  :P1_INDUSTRY = a.industry_id)',
'    and (NVL(:P1_CATEGORY,0) = 0 or :P1_CATEGORY = a.category_id)',
'    and (NVL(:P1_STATUS,0) = 0 or :P1_STATUS = a.status_id)',
'    and (NVL(:P1_TYPE,0) = 0 or :P1_TYPE = a.type_id)',
'    and (NVL(:P1_USE_CASE,0) = 0 or :P1_USE_CASE = a.use_case_id)',
'    and (:P1_MARQUEE_CUST is null or :P1_MARQUEE_CUST = a.marquee_customer_yn)',
'    and (:P1_IMP_PARTNER is null',
'        or exists ( select null',
'                    from eba_cust_cust_partner_ref rf',
'                    where rf.customer_id = a.id',
'                        and rf.partner_id = :P1_IMP_PARTNER ))',
'    and (:P1_COMPETITOR is null',
'        or exists ( select null',
'                    from eba_cust_cust_competitor_ref rf',
'                    where rf.customer_id = a.id',
'                        and rf.competitor_id = :P1_COMPETITOR ))',
'    and (:P1_REFERENCEABLE is null or :P1_REFERENCEABLE = a.referencable)',
'    and (:P1_SCP_CUST is null or :P1_SCP_CUST = a.strategic_customer_program_yn)',
'    and (',
'        exists (select 1 from eba_cust_customer_reftype_ref r',
'        where r.customer_id = a.id and',
'              instr('':''||:P1_REFERENCE_TYPES||'':'','':''||reference_type_id||'':'') > 0)',
'        or ',
'        :P1_REFERENCE_TYPES is null',
'        )',
'    and (NVL(:P1_PRODUCT,0) = 0 or exists (select 1 from eba_cust_product_uses u where u.CUSTOMER_ID = a.id and u.PRODUCT_ID = :P1_PRODUCT))',
'group by b.id, b.category',
'order by 2'))
,p_items_value_column_name=>'CNT'
,p_items_label_column_name=>'CATEGORY'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:59:&SESSION.::&DEBUG.:RP,59,RIR:IR_CATEGORY,P59_CATEGORY,P59_COMPETITOR,P59_COUNTRY,P59_GEO,P59_IMP_PARTNER,P59_INDUSTRY,P59_MARQUEE_CUST,P59_MAX_ROWS,P59_PRODUCT,P59_REFERENCE_TYPES,P59_REFERENCEABLE,P59_SCP_CUST,P59_STATUS,P59_TYPE,P59'
||'_USE_CASE,P59_SEARCH:&CATEGORY.,&ID.,&P1_COMPETITOR.,&P1_COUNTRY.,&P1_GEO.,&P1_IMP_PARTNER.,&P1_INDUSTRY.,&P1_MARQUEE_CUST.,&P1_MAX_ROWS.,&P1_PRODUCT.,\&P1_REFERENCE_TYPES.\,&P1_REFERENCEABLE.,&P1_SCP_CUST.,&P1_STATUS.,&P1_TYPE.,&P1_USE_CASE.,&P1_SEA'
||'RCH.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(1143956629844070215)
,p_chart_id=>wwv_flow_api.id(1094884069013258263)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'on'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(1143956723903070216)
,p_chart_id=>wwv_flow_api.id(1094884069013258263)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1143956817585070217)
,p_plug_name=>'Customers by Geography'
,p_region_name=>'CUST_BY_GEO'
,p_region_css_classes=>'scrollable-region'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:i-h320:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(14897235571213526829)
,p_plug_display_sequence=>86
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P1_TYPE,P1_SEARCH,P1_USE_CASE,P1_MARQUEE_CUST,P1_PRODUCT,P1_IMP_PARTNER,P1_GEO,P1_COMPETITOR,P1_REFERENCEABLE,P1_SCP_CUST,P1_REFERENCE_TYPES,P1_COUNTRY,P1_STATUS,P1_INDUSTRY,P1_CATEGORY'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_required_patch=>wwv_flow_api.id(14994142535261183064)
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(1143957078309070219)
,p_region_id=>wwv_flow_api.id(1143956817585070217)
,p_chart_type=>'bar'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_spark_chart=>'N'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(1143957112636070220)
,p_chart_id=>wwv_flow_api.id(1143957078309070219)
,p_seq=>10
,p_name=>'Geography'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   d.id as geo_id,',
'   nvl(d.geography_name, ''Not Defined'') group_name,',
'   count(*) cnt',
'from eba_cust_customers a,',
'    eba_cust_categories b,',
'    eba_cust_status c,',
'    eba_cust_geographies d,',
'    eba_cust_type e,',
'    eba_cust_use_case f',
'where a.category_id = b.id(+)',
'    and a.status_id = c.id(+)',
'    and a.geography_id = d.id',
'    and a.type_id = e.id(+)',
'    and a.use_case_id = f.id(+)',
'    and (:P1_SEARCH is null or',
'            instr(upper(a.customer_name),upper(:P1_SEARCH)) > 0 or',
'                       instr(upper(a.summary),upper(:P1_SEARCH)) > 0 )',
'    and (NVL(:P1_GEO,0) = 0 or :P1_GEO = a.geography_id)',
'    and (NVL(:P1_COUNTRY,0) = 0 or :P1_COUNTRY = a.country_id)',
'    and (NVL(:P1_INDUSTRY,0) = 0 or  :P1_INDUSTRY = a.industry_id)',
'    and (NVL(:P1_CATEGORY,0) = 0 or :P1_CATEGORY = a.category_id)',
'    and (NVL(:P1_STATUS,0) = 0 or :P1_STATUS = a.status_id)',
'    and (NVL(:P1_TYPE,0) = 0 or :P1_TYPE = a.type_id)',
'    and (NVL(:P1_USE_CASE,0) = 0 or :P1_USE_CASE = a.use_case_id)',
'    and (:P1_MARQUEE_CUST is null or :P1_MARQUEE_CUST = a.marquee_customer_yn)',
'    and (:P1_IMP_PARTNER is null',
'        or exists ( select null',
'                    from eba_cust_cust_partner_ref rf',
'                    where rf.customer_id = a.id',
'                        and rf.partner_id = :P1_IMP_PARTNER ))',
'    and (:P1_COMPETITOR is null',
'        or exists ( select null',
'                    from eba_cust_cust_competitor_ref rf',
'                    where rf.customer_id = a.id',
'                        and rf.competitor_id = :P1_COMPETITOR ))',
'    and (:P1_REFERENCEABLE is null or :P1_REFERENCEABLE = a.referencable)',
'    and (:P1_SCP_CUST is null or :P1_SCP_CUST = a.strategic_customer_program_yn)',
'    and (',
'        exists (select 1 from eba_cust_customer_reftype_ref r',
'        where r.customer_id = a.id and',
'              instr('':''||:P1_REFERENCE_TYPES||'':'','':''||reference_type_id||'':'') > 0)',
'        or ',
'        :P1_REFERENCE_TYPES is null',
'        )',
'    and (NVL(:P1_PRODUCT,0) = 0 or exists (select 1 from eba_cust_product_uses u where u.CUSTOMER_ID = a.id and u.PRODUCT_ID = :P1_PRODUCT))',
'group by d.id, nvl(d.geography_name, ''Not Defined'')',
'order by 2 desc'))
,p_items_value_column_name=>'CNT'
,p_items_label_column_name=>'GROUP_NAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:59:&SESSION.::&DEBUG.:RP,RIR,59:IR_GEOGRAPHY_NAME,P59_GEO,P59_CATEGORY,P59_COMPETITOR,P59_COUNTRY,P59_IMP_PARTNER,P59_INDUSTRY,P59_MARQUEE_CUST,P59_MAX_ROWS,P59_PRODUCT,P59_REFERENCE_TYPES,P59_REFERENCEABLE,P59_SCP_CUST,P59_SEARCH,P59_ST'
||'ATUS,P59_TYPE,P59_USE_CASE:&GROUP_NAME.,&GEO_ID.,&P1_CATEGORY.,&P1_COMPETITOR.,&P1_COUNTRY.,&P1_IMP_PARTNER.,&P1_INDUSTRY.,&P1_MARQUEE_CUST.,&P1_MAX_ROWS.,&P1_PRODUCT.,\&P1_REFERENCE_TYPES.\,&P1_REFERENCEABLE.,&P1_SCP_CUST.,&P1_SEARCH.,&P1_STATUS.,&P'
||'1_TYPE.,&P1_USE_CASE.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(1143957237180070221)
,p_chart_id=>wwv_flow_api.id(1143957078309070219)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'off'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(1143957300437070222)
,p_chart_id=>wwv_flow_api.id(1143957078309070219)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1143957459215070223)
,p_plug_name=>'Customers by Industry'
,p_region_name=>'CUST_BY_IND'
,p_region_css_classes=>'scrollable-region'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:i-h320:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(14897235571213526829)
,p_plug_display_sequence=>76
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P1_TYPE,P1_SEARCH,P1_USE_CASE,P1_MARQUEE_CUST,P1_PRODUCT,P1_IMP_PARTNER,P1_GEO,P1_COMPETITOR,P1_REFERENCEABLE,P1_SCP_CUST,P1_REFERENCE_TYPES,P1_COUNTRY,P1_STATUS,P1_INDUSTRY,P1_CATEGORY'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(1143957567344070224)
,p_region_id=>wwv_flow_api.id(1143957459215070223)
,p_chart_type=>'bar'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_orientation=>'horizontal'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_spark_chart=>'N'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(1143957689745070225)
,p_chart_id=>wwv_flow_api.id(1143957567344070224)
,p_seq=>10
,p_name=>'Industry'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  ',
'   i.id industry_id,',
'   nvl(i.industry_name, ''Not Defined'') industry,',
'   count(*) cnt',
'from eba_cust_customers a,',
'    eba_cust_categories b,',
'    eba_cust_status c,',
'    eba_cust_geographies d,',
'    eba_cust_type e,',
'    eba_cust_use_case f,',
'    eba_cust_industries i',
'where a.category_id = b.id(+)',
'    and a.status_id = c.id(+)',
'    and a.geography_id = d.id(+)',
'    and a.type_id = e.id(+)',
'    and a.use_case_id = f.id(+)',
'    and a.industry_id = i.id (+)',
'    and (:P1_SEARCH is null or',
'            instr(upper(a.customer_name),upper(:P1_SEARCH)) > 0 or',
'                       instr(upper(a.summary),upper(:P1_SEARCH)) > 0 )',
'    and (NVL(:P1_GEO,0) = 0 or :P1_GEO = a.geography_id)',
'    and (NVL(:P1_COUNTRY,0) = 0 or :P1_COUNTRY = a.country_id)',
'    and (NVL(:P1_INDUSTRY,0) = 0 or  :P1_INDUSTRY = a.industry_id)',
'    and (NVL(:P1_CATEGORY,0) = 0 or :P1_CATEGORY = a.category_id)',
'    and (NVL(:P1_STATUS,0) = 0 or :P1_STATUS = a.status_id)',
'    and (NVL(:P1_TYPE,0) = 0 or :P1_TYPE = a.type_id)',
'    and (NVL(:P1_USE_CASE,0) = 0 or :P1_USE_CASE = a.use_case_id)',
'    and (:P1_MARQUEE_CUST is null or :P1_MARQUEE_CUST = a.marquee_customer_yn)',
'    and (:P1_IMP_PARTNER is null',
'        or exists ( select null',
'                    from eba_cust_cust_partner_ref rf',
'                    where rf.customer_id = a.id',
'                        and rf.partner_id = :P1_IMP_PARTNER ))',
'    and (:P1_COMPETITOR is null',
'        or exists ( select null',
'                    from eba_cust_cust_competitor_ref rf',
'                    where rf.customer_id = a.id',
'                        and rf.competitor_id = :P1_COMPETITOR ))',
'    and (:P1_REFERENCEABLE is null or :P1_REFERENCEABLE = a.referencable)',
'    and (:P1_SCP_CUST is null or :P1_SCP_CUST = a.strategic_customer_program_yn)',
'    and (',
'        exists (select 1 from eba_cust_customer_reftype_ref r',
'        where r.customer_id = a.id and',
'              instr('':''||:P1_REFERENCE_TYPES||'':'','':''||reference_type_id||'':'') > 0)',
'        or ',
'        :P1_REFERENCE_TYPES is null',
'        )',
'    and (NVL(:P1_PRODUCT,0) = 0 or exists (select 1 from eba_cust_product_uses u where u.CUSTOMER_ID = a.id and u.PRODUCT_ID = :P1_PRODUCT))',
'group by i.id, nvl(i.industry_name, ''Not Defined'')',
'order by 2 desc'))
,p_items_value_column_name=>'CNT'
,p_items_label_column_name=>'INDUSTRY'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:59:&SESSION.::&DEBUG.:RP,RIR,59:IR_INDUSTRY_ID,P59_INDUSTRY,P59_CATEGORY,P59_COMPETITOR,P59_COUNTRY,P59_GEO,P59_IMP_PARTNER,P59_INDUSTRY,P59_MARQUEE_CUST,P59_MAX_ROWS,P59_PRODUCT,P59_REFERENCE_TYPES,P59_REFERENCEABLE,P59_SCP_CUST,P59_SEA'
||'RCH,P59_STATUS,P59_TYPE,P59_USE_CASE:&INDUSTRY_ID.,&INDUSTRY_ID.,&P1_CATEGORY.,&P1_COMPETITOR.,&P1_COUNTRY.,&P1_GEO.,&P1_IMP_PARTNER.,&P1_INDUSTRY.,&P1_MARQUEE_CUST.,&P1_MAX_ROWS.,&P1_PRODUCT.,\&P1_REFERENCE_TYPES.\,&P1_REFERENCEABLE.,&P1_SCP_CUST.,&'
||'P1_SEARCH.,&P1_STATUS.,&P1_TYPE.,&P1_USE_CASE.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(1143957733866070226)
,p_chart_id=>wwv_flow_api.id(1143957567344070224)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'off'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(1143957847231070227)
,p_chart_id=>wwv_flow_api.id(1143957567344070224)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2053119679188736748)
,p_plug_name=>'Customer Summary (with References & No Products)'
,p_region_name=>'CUST_SUM_W_REFS_NO_PRODS'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--hideHeader:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(14897235571213526829)
,p_plug_display_sequence=>36
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select label, to_number(nvl(value,0),''999G999G990'') value, url from (',
'with data as (',
'    select count(*) total,',
'        sum(decode(marquee_customer_yn,''Y'',1,0)) marquee,',
'        sum(decode(referencable,''Yes'',1,0)) ref',
'    from eba_cust_customers a,',
'        eba_cust_categories b,',
'        eba_cust_status c,',
'        eba_cust_geographies d,',
'        eba_cust_type e,',
'        eba_cust_use_case f',
'    where a.category_id = b.id(+)',
'        and a.status_id = c.id(+)',
'        and a.geography_id = d.id(+)',
'        and a.type_id = e.id(+)',
'        and a.use_case_id = f.id(+)',
'        and (:P1_SEARCH is null or',
'                instr(upper(a.customer_name),upper(:P1_SEARCH)) > 0 or',
'                           instr(upper(a.summary),upper(:P1_SEARCH)) > 0 )',
'        and (NVL(:P1_GEO,0) = 0 or :P1_GEO = a.geography_id)',
'        and (NVL(:P1_COUNTRY,0) = 0 or :P1_COUNTRY = a.country_id)',
'        and (NVL(:P1_INDUSTRY,0) = 0 or  :P1_INDUSTRY = a.industry_id)',
'        and (NVL(:P1_CATEGORY,0) = 0 or :P1_CATEGORY = a.category_id)',
'        and (NVL(:P1_STATUS,0) = 0 or :P1_STATUS = a.status_id)',
'        and (NVL(:P1_TYPE,0) = 0 or :P1_TYPE = a.type_id)',
'        and (NVL(:P1_USE_CASE,0) = 0 or :P1_USE_CASE = a.use_case_id)',
'        and (:P1_MARQUEE_CUST is null or :P1_MARQUEE_CUST = a.marquee_customer_yn)',
'        and (:P1_IMP_PARTNER is null',
'            or exists ( select null',
'                        from eba_cust_cust_partner_ref rf',
'                        where rf.customer_id = a.id',
'                            and rf.partner_id = :P1_IMP_PARTNER ))',
'        and (:P1_COMPETITOR is null',
'            or exists ( select null',
'                        from eba_cust_cust_competitor_ref rf',
'                        where rf.customer_id = a.id',
'                            and rf.competitor_id = :P1_COMPETITOR ))',
'        and (:P1_REFERENCEABLE is null or :P1_REFERENCEABLE = a.referencable)',
'        and (:P1_SCP_CUST is null or :P1_SCP_CUST = a.strategic_customer_program_yn)',
'        and (',
'            exists (select 1 from eba_cust_customer_reftype_ref r',
'            where r.customer_id = a.id and',
'                  instr('':''||:P1_REFERENCE_TYPES||'':'','':''||reference_type_id||'':'') > 0)',
'            or ',
'            :P1_REFERENCE_TYPES is null',
'            )',
'        and (NVL(:P1_PRODUCT,0) = 0 or exists (select 1 from eba_cust_product_uses u where u.CUSTOMER_ID = a.id and u.PRODUCT_ID = :P1_PRODUCT))',
'), rws as (',
'    select level r from dual connect by level < 4',
')',
'select rws.r display_order,',
'    decode(rws.r, 1, ''Total'',    2, ''Marquee'',   3, ''Referenceable'')  label,',
'    decode(rws.r, 1, data.total, 2, data.marquee, 3, data.ref) value,',
'    decode(rws.r, 1, apex_util.prepare_url(''f?p=''||:APP_ID||'':59:''||:APP_SESSION||'':::59,RIR:P59_MARQUEE_CUST,P59_INDUSTRY,P59_PRODUCT,P59_GEO,P59_REFERENCEABLE,P59_STATUS,P59_CATEGORY,P59_TYPE,P59_IMP_PARTNER,P59_COMPETITOR,P59_REFERENCE_TYPES:''||:P'
||'1_MARQUEE_CUST||'',''||:P1_INDUSTRY||'',''||:P1_PRODUCT||'',''||:P1_GEO||'',''||:P1_REFERENCEABLE||'',''||:P1_STATUS||'',''||:P1_CATEGORY||'',''||:P1_TYPE||'',''||:P1_IMP_PARTNER||'',''||:P1_COMPETITOR) || '',\'' || :P1_REFERENCE_TYPES || ''\:'',',
'                  2, apex_util.prepare_url(''f?p=''||:APP_ID||'':59:''||:APP_SESSION||'':::59,RIR:IR_MARQUEE_CUSTOMER,P59_MARQUEE_CUST,P59_INDUSTRY,P59_PRODUCT,P59_GEO,P59_REFERENCEABLE,P59_STATUS,P59_CATEGORY,P59_TYPE,P59_IMP_PARTNER,P59_COMPETITOR,P59_R'
||'EFERENCE_TYPES:Yes,Y,''||:P1_INDUSTRY||'',''||:P1_PRODUCT||'',''||:P1_GEO||'',''||:P1_REFERENCEABLE||'',''||:P1_STATUS||'',''||:P1_CATEGORY||'',''||:P1_TYPE||'',''||:P1_IMP_PARTNER||'',''||:P1_COMPETITOR) || '',\'' || :P1_REFERENCE_TYPES || ''\:'',',
'                  3, apex_util.prepare_url(''f?p=''||:APP_ID||'':59:''||:APP_SESSION||'':::59,RIR:IR_REFERENCABLE,P59_INDUSTRY,P59_PRODUCT,P59_GEO,P59_REFERENCEABLE,P59_STATUS,P59_CATEGORY,P59_TYPE,P59_IMP_PARTNER,P59_COMPETITOR,P59_REFERENCE_TYPES:Yes,''|'
||'|:P1_INDUSTRY||'',''||:P1_PRODUCT||'',''||:P1_GEO||'',Yes,''||:P1_STATUS||'',''||:P1_CATEGORY||'',''||:P1_TYPE||'',''||:P1_IMP_PARTNER||'',''||:P1_COMPETITOR) || '',\'' || :P1_REFERENCE_TYPES || ''\:'' ) url',
'from data, rws',
')',
'order by display_order'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_ajax_items_to_submit=>'P1_TYPE,P1_SEARCH,P1_USE_CASE,P1_MARQUEE_CUST,P1_PRODUCT,P1_IMP_PARTNER,P1_GEO,P1_COMPETITOR,P1_REFERENCEABLE,P1_SCP_CUST,P1_REFERENCE_TYPES,P1_COUNTRY,P1_STATUS,P1_INDUSTRY,P1_CATEGORY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_util.get_build_option_status(',
'                      p_application_id    => :APP_ID,',
'                      p_build_option_name => ''Products and Services''',
'                  ) = ''EXCLUDE'''))
,p_plug_display_when_cond2=>'PLSQL'
,p_required_patch=>wwv_flow_api.id(14326325438076037979)
,p_attribute_01=>'LABEL'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'&URL.'
,p_attribute_05=>'3'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2604147588351225138)
,p_plug_name=>'Customer Summary (with References, Products, But No Issues)'
,p_region_name=>'CUST_SUM_W_REFS'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--hideHeader:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(14897235571213526829)
,p_plug_display_sequence=>26
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select label, to_number(nvl(value,0),''999G999G990'') value, url from (',
'with data as (',
'    select count(*) total,',
'        sum(decode(marquee_customer_yn,''Y'',1,0)) marquee,',
'        sum(decode(referencable,''Yes'',1,0)) ref',
'    from eba_cust_customers a,',
'        eba_cust_categories b,',
'        eba_cust_status c,',
'        eba_cust_geographies d,',
'        eba_cust_type e,',
'        eba_cust_use_case f',
'    where a.category_id = b.id(+)',
'        and a.status_id = c.id(+)',
'        and a.geography_id = d.id(+)',
'        and a.type_id = e.id(+)',
'        and a.use_case_id = f.id(+)',
'        and (:P1_SEARCH is null or',
'                instr(upper(a.customer_name),upper(:P1_SEARCH)) > 0 or',
'                           instr(upper(a.summary),upper(:P1_SEARCH)) > 0 )',
'        and (NVL(:P1_GEO,0) = 0 or :P1_GEO = a.geography_id)',
'        and (NVL(:P1_COUNTRY,0) = 0 or :P1_COUNTRY = a.country_id)',
'        and (NVL(:P1_INDUSTRY,0) = 0 or  :P1_INDUSTRY = a.industry_id)',
'        and (NVL(:P1_CATEGORY,0) = 0 or :P1_CATEGORY = a.category_id)',
'        and (NVL(:P1_STATUS,0) = 0 or :P1_STATUS = a.status_id)',
'        and (NVL(:P1_TYPE,0) = 0 or :P1_TYPE = a.type_id)',
'        and (NVL(:P1_USE_CASE,0) = 0 or :P1_USE_CASE = a.use_case_id)',
'        and (:P1_MARQUEE_CUST is null or :P1_MARQUEE_CUST = a.marquee_customer_yn)',
'        and (:P1_IMP_PARTNER is null',
'            or exists ( select null',
'                        from eba_cust_cust_partner_ref rf',
'                        where rf.customer_id = a.id',
'                            and rf.partner_id = :P1_IMP_PARTNER ))',
'        and (:P1_COMPETITOR is null',
'            or exists ( select null',
'                        from eba_cust_cust_competitor_ref rf',
'                        where rf.customer_id = a.id',
'                            and rf.competitor_id = :P1_COMPETITOR ))',
'        and (:P1_REFERENCEABLE is null or :P1_REFERENCEABLE = a.referencable)',
'        and (:P1_SCP_CUST is null or :P1_SCP_CUST = a.strategic_customer_program_yn)',
'        and (',
'            exists (select 1 from eba_cust_customer_reftype_ref r',
'            where r.customer_id = a.id and',
'                  instr('':''||:P1_REFERENCE_TYPES||'':'','':''||reference_type_id||'':'') > 0)',
'            or ',
'            :P1_REFERENCE_TYPES is null',
'            )',
'        and (NVL(:P1_PRODUCT,0) = 0 or exists (select 1 from eba_cust_product_uses u where u.CUSTOMER_ID = a.id and u.PRODUCT_ID = :P1_PRODUCT))',
'), rws as (',
'    select level r from dual connect by level < 4',
')',
'select rws.r display_order,',
'    decode(rws.r, 1, ''Total'',    2, ''Marquee'',   3, ''Referenceable'')  label,',
'    decode(rws.r, 1, data.total, 2, data.marquee, 3, data.ref) value,',
'    decode(rws.r, 1, apex_util.prepare_url(''f?p=''||:APP_ID||'':59:''||:APP_SESSION||'':::59,RIR:P59_MARQUEE_CUST,P59_INDUSTRY,P59_PRODUCT,P59_GEO,P59_REFERENCEABLE,P59_STATUS,P59_CATEGORY,P59_TYPE,P59_IMP_PARTNER,P59_COMPETITOR,P59_REFERENCE_TYPES:''||:P'
||'1_MARQUEE_CUST||'',''||:P1_INDUSTRY||'',''||:P1_PRODUCT||'',''||:P1_GEO||'',''||:P1_REFERENCEABLE||'',''||:P1_STATUS||'',''||:P1_CATEGORY||'',''||:P1_TYPE||'',''||:P1_IMP_PARTNER||'',''||:P1_COMPETITOR) || '',\'' || :P1_REFERENCE_TYPES || ''\:'',',
'                  2, apex_util.prepare_url(''f?p=''||:APP_ID||'':59:''||:APP_SESSION||'':::59,RIR:IR_MARQUEE_CUSTOMER,P59_MARQUEE_CUST,P59_INDUSTRY,P59_PRODUCT,P59_GEO,P59_REFERENCEABLE,P59_STATUS,P59_CATEGORY,P59_TYPE,P59_IMP_PARTNER,P59_COMPETITOR,P59_R'
||'EFERENCE_TYPES:Yes,Y,''||:P1_INDUSTRY||'',''||:P1_PRODUCT||'',''||:P1_GEO||'',''||:P1_REFERENCEABLE||'',''||:P1_STATUS||'',''||:P1_CATEGORY||'',''||:P1_TYPE||'',''||:P1_IMP_PARTNER||'',''||:P1_COMPETITOR) || '',\'' || :P1_REFERENCE_TYPES || ''\:'',',
'                  3, apex_util.prepare_url(''f?p=''||:APP_ID||'':59:''||:APP_SESSION||'':::59,RIR:IR_REFERENCABLE,P59_INDUSTRY,P59_PRODUCT,P59_GEO,P59_REFERENCEABLE,P59_STATUS,P59_CATEGORY,P59_TYPE,P59_IMP_PARTNER,P59_COMPETITOR,P59_REFERENCE_TYPES:Yes,''|'
||'|:P1_INDUSTRY||'',''||:P1_PRODUCT||'',''||:P1_GEO||'',Yes,''||:P1_STATUS||'',''||:P1_CATEGORY||'',''||:P1_TYPE||'',''||:P1_IMP_PARTNER||'',''||:P1_COMPETITOR) || '',\'' || :P1_REFERENCE_TYPES || ''\:'' ) url',
'from data, rws',
'union all',
'select 4 as display_order,',
'    ''Products Referenced'' label,',
'    count(*) value,',
'    apex_util.prepare_url(''f?p=''||:APP_ID||'':44:''||:APP_SESSION||'':::44,RIR:'') url',
'from eba_cust_products p',
'where exists (   select 1',
'    from eba_cust_product_uses u',
'    where u.product_id = p.id',
')',
')',
'order by display_order'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_ajax_items_to_submit=>'P1_TYPE,P1_SEARCH,P1_USE_CASE,P1_MARQUEE_CUST,P1_PRODUCT,P1_IMP_PARTNER,P1_GEO,P1_COMPETITOR,P1_REFERENCEABLE,P1_SCP_CUST,P1_REFERENCE_TYPES,P1_COUNTRY,P1_STATUS,P1_INDUSTRY,P1_CATEGORY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_util.get_build_option_status(',
'                      p_application_id    => :APP_ID,',
'                      p_build_option_name => ''Products and Services''',
'                  ) = ''INCLUDE''',
'and',
'apex_util.get_build_option_status(',
'                      p_application_id    => :APP_ID,',
'                      p_build_option_name => ''Issues''',
'                  ) = ''EXCLUDE'''))
,p_plug_display_when_cond2=>'PLSQL'
,p_required_patch=>wwv_flow_api.id(14326325438076037979)
,p_attribute_01=>'LABEL'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'&URL.'
,p_attribute_05=>'4'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(13580820004246028781)
,p_plug_name=>'Customer Summary (without References)'
,p_region_name=>'CUST_SUM_NO_REFS'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--hideHeader:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(14897235571213526829)
,p_plug_display_sequence=>6
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select label, to_number(nvl(value,0),''999G999G990'') value, url from (',
'with data as (',
'    select count(*) total,',
'        sum(decode(marquee_customer_yn,''Y'',1,0)) marquee',
'    from eba_cust_customers a,',
'        eba_cust_categories b,',
'        eba_cust_status c,',
'        eba_cust_geographies d,',
'        eba_cust_type e,',
'        eba_cust_use_case f',
'    where a.category_id = b.id(+)',
'        and a.status_id = c.id(+)',
'        and a.geography_id = d.id(+)',
'        and a.type_id = e.id(+)',
'        and a.use_case_id = f.id(+)',
'        and (:P1_SEARCH is null or',
'                instr(upper(a.customer_name),upper(:P1_SEARCH)) > 0 or',
'                           instr(upper(a.summary),upper(:P1_SEARCH)) > 0 )',
'        and (NVL(:P1_GEO,0) = 0 or :P1_GEO = a.geography_id)',
'        and (NVL(:P1_COUNTRY,0) = 0 or :P1_COUNTRY = a.country_id)',
'        and (NVL(:P1_INDUSTRY,0) = 0 or  :P1_INDUSTRY = a.industry_id)',
'        and (NVL(:P1_CATEGORY,0) = 0 or :P1_CATEGORY = a.category_id)',
'        and (NVL(:P1_STATUS,0) = 0 or :P1_STATUS = a.status_id)',
'        and (NVL(:P1_TYPE,0) = 0 or :P1_TYPE = a.type_id)',
'        and (NVL(:P1_USE_CASE,0) = 0 or :P1_USE_CASE = a.use_case_id)',
'        and (:P1_MARQUEE_CUST is null or :P1_MARQUEE_CUST = a.marquee_customer_yn)',
'        and (:P1_IMP_PARTNER is null',
'            or exists ( select null',
'                        from eba_cust_cust_partner_ref rf',
'                        where rf.customer_id = a.id',
'                            and rf.partner_id = :P1_IMP_PARTNER ))',
'        and (:P1_COMPETITOR is null',
'            or exists ( select null',
'                        from eba_cust_cust_competitor_ref rf',
'                        where rf.customer_id = a.id',
'                            and rf.competitor_id = :P1_COMPETITOR ))',
'        and (:P1_REFERENCEABLE is null or :P1_REFERENCEABLE = a.referencable)',
'        and (:P1_SCP_CUST is null or :P1_SCP_CUST = a.strategic_customer_program_yn)',
'        and (',
'            exists (select 1 from eba_cust_customer_reftype_ref r',
'            where r.customer_id = a.id and',
'                  instr('':''||:P1_REFERENCE_TYPES||'':'','':''||reference_type_id||'':'') > 0)',
'            or ',
'            :P1_REFERENCE_TYPES is null',
'            )',
'        and (NVL(:P1_PRODUCT,0) = 0 or exists (select 1 from eba_cust_product_uses u where u.CUSTOMER_ID = a.id and u.PRODUCT_ID = :P1_PRODUCT))',
'), rws as (',
'    select level r from dual connect by level < 3',
')',
'select rws.r display_order,',
'    decode(rws.r, 1, ''Total'',    2, ''Marquee'')  label,',
'    decode(rws.r, 1, data.total, 2, data.marquee) value,',
'    decode(rws.r, 1, apex_util.prepare_url(''f?p=''||:APP_ID||'':59:''||:APP_SESSION||'':::59,RIR:P59_MARQUEE_CUST,P59_INDUSTRY,P59_PRODUCT,P59_GEO,P59_REFERENCEABLE,P59_STATUS,P59_CATEGORY,P59_TYPE,P59_IMP_PARTNER,P59_COMPETITOR,P59_REFERENCE_TYPES:''||:P'
||'1_MARQUEE_CUST||'',''||:P1_INDUSTRY||'',''||:P1_PRODUCT||'',''||:P1_GEO||'',''||:P1_REFERENCEABLE||'',''||:P1_STATUS||'',''||:P1_CATEGORY||'',''||:P1_TYPE||'',''||:P1_IMP_PARTNER||'',''||:P1_COMPETITOR) || '',\'' || :P1_REFERENCE_TYPES || ''\:'',',
'                  2, apex_util.prepare_url(''f?p=''||:APP_ID||'':59:''||:APP_SESSION||'':::59,RIR:IR_MARQUEE_CUSTOMER,P59_MARQUEE_CUST,P59_INDUSTRY,P59_PRODUCT,P59_GEO,P59_REFERENCEABLE,P59_STATUS,P59_CATEGORY,P59_TYPE,P59_IMP_PARTNER,P59_COMPETITOR,P59_R'
||'EFERENCE_TYPES:Yes,Y,''||:P1_INDUSTRY||'',''||:P1_PRODUCT||'',''||:P1_GEO||'',''||:P1_REFERENCEABLE||'',''||:P1_STATUS||'',''||:P1_CATEGORY||'',''||:P1_TYPE||'',''||:P1_IMP_PARTNER||'',''||:P1_COMPETITOR) || '',\'' || :P1_REFERENCE_TYPES || ''\:'' ) url',
'from data, rws',
'union all',
'select 4 display_order,',
'    ''Products Referenced'' label,',
'    count(*) value,',
'    apex_util.prepare_url(''f?p=''||:APP_ID||'':44:''||:APP_SESSION||'':::44,RIR:'') url',
'from eba_cust_products p',
'where exists (   select 1',
'    from eba_cust_product_uses u',
'    where u.product_id = p.id ) ',
')',
'order by display_order'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_ajax_items_to_submit=>'P1_TYPE,P1_SEARCH,P1_USE_CASE,P1_MARQUEE_CUST,P1_PRODUCT,P1_IMP_PARTNER,P1_GEO,P1_COMPETITOR,P1_REFERENCEABLE,P1_SCP_CUST,P1_REFERENCE_TYPES,P1_COUNTRY,P1_STATUS,P1_INDUSTRY,P1_CATEGORY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_required_patch=>-wwv_flow_api.id(14326325438076037979)
,p_attribute_01=>'LABEL'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'&URL.'
,p_attribute_05=>'3'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
);
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>4200481731648079
,p_default_application_id=>100
,p_default_id_offset=>39500229701756973
,p_default_owner=>'VCONTROL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(13580832644565036483)
,p_plug_name=>'Customers by Product'
,p_region_name=>'CUST_BY_PRODS'
,p_region_css_classes=>'scrollable-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:i-h320:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(14897235571213526829)
,p_plug_display_sequence=>46
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    distinct p.product_name,',
'    p.id,',
'    p.description,',
'    x.customer_users',
'from',
'    eba_cust_customers a,',
'    eba_cust_categories b,',
'    eba_cust_status c,',
'    eba_cust_geographies d,',
'    eba_cust_type e,',
'    eba_cust_use_case f,',
'    eba_cust_product_uses u,',
'    eba_cust_products p,',
'    (',
'        select id,',
'               (',
'                   select',
'                       count(*) as customer_users',
'                   from',
'                       eba_cust_customers a1,',
'                       eba_cust_categories b1,',
'                       eba_cust_status c1,',
'                       eba_cust_geographies d1,',
'                       eba_cust_type e1,',
'                       eba_cust_use_case f1,',
'                       eba_cust_product_uses u1',
'                 where u1.product_id = p1.id',
'                   and u1.customer_id = a1.id',
'                   and a1.category_id = b1.id(+)',
'                   and a1.status_id = c1.id(+)',
'                   and a1.geography_id = d1.id(+)',
'                   and a1.type_id = e1.id(+)',
'                   and a1.use_case_id = f1.id(+)',
'                   and u1.customer_id = a1.id',
'                   and (:P1_SEARCH is null or',
'                           instr(upper(a1.customer_name),upper(:P1_SEARCH)) > 0 or',
'                                      instr(upper(a1.summary),upper(:P1_SEARCH)) > 0 )',
'                   and (NVL(:P1_GEO,0) = 0 or :P1_GEO = a1.geography_id)',
'                   and (NVL(:P1_COUNTRY,0) = 0 or :P1_COUNTRY = a1.country_id)',
'                   and (NVL(:P1_INDUSTRY,0) = 0 or  :P1_INDUSTRY = a1.industry_id)',
'                   and (NVL(:P1_CATEGORY,0) = 0 or :P1_CATEGORY = a1.category_id)',
'                   and (NVL(:P1_STATUS,0) = 0 or :P1_STATUS = a1.status_id)',
'                   and (NVL(:P1_TYPE,0) = 0 or :P1_TYPE = a1.type_id)',
'                   and (NVL(:P1_USE_CASE,0) = 0 or :P1_USE_CASE = a1.use_case_id)',
'                   and (:P1_MARQUEE_CUST is null or :P1_MARQUEE_CUST = a1.marquee_customer_yn)',
'                   and (:P1_IMP_PARTNER is null',
'                       or exists ( select null',
'                                   from eba_cust_cust_partner_ref rf',
'                                   where rf.customer_id = a1.id',
'                                       and rf.partner_id = :P1_IMP_PARTNER ))',
'                   and (:P1_COMPETITOR is null',
'                       or exists ( select null',
'                                   from eba_cust_cust_competitor_ref rf',
'                                   where rf.customer_id = a1.id',
'                                       and rf.competitor_id = :P1_COMPETITOR ))',
'                   and (:P1_REFERENCEABLE is null or :P1_REFERENCEABLE = a1.referencable)',
'                   and (:P1_SCP_CUST is null or :P1_SCP_CUST = a1.strategic_customer_program_yn)',
'                   and (',
'                       exists (select 1 from eba_cust_customer_reftype_ref r',
'                       where r.customer_id = a1.id and',
'                             instr('':''||:P1_REFERENCE_TYPES||'':'','':''||r.reference_type_id||'':'') > 0)',
'                       or ',
'                       :P1_REFERENCE_TYPES is null',
'                       )',
'                   and (NVL(:P1_PRODUCT,0) = 0 or exists (select 1 from eba_cust_product_uses u where u.customer_id = a1.id and u1.product_id = :P1_PRODUCT))',
'               ) customer_users',
'          from eba_cust_products p1',
'    ) x',
'where a.category_id = b.id(+)',
'    and a.status_id = c.id(+)',
'    and a.geography_id = d.id(+)',
'    and a.type_id = e.id(+)',
'    and a.use_case_id = f.id(+)',
'    and u.customer_id = a.id',
'    and u.product_id = p.id',
'    and x.id = p.id',
'    and x.customer_users > 0',
'    and (:P1_SEARCH is null or',
'            instr(upper(a.customer_name),upper(:P1_SEARCH)) > 0 or',
'                       instr(upper(a.summary),upper(:P1_SEARCH)) > 0 )',
'    and (NVL(:P1_GEO,0) = 0 or :P1_GEO = a.geography_id)',
'    and (NVL(:P1_COUNTRY,0) = 0 or :P1_COUNTRY = a.country_id)',
'    and (NVL(:P1_INDUSTRY,0) = 0 or  :P1_INDUSTRY = a.industry_id)',
'    and (NVL(:P1_CATEGORY,0) = 0 or :P1_CATEGORY = a.category_id)',
'    and (NVL(:P1_STATUS,0) = 0 or :P1_STATUS = a.status_id)',
'    and (NVL(:P1_TYPE,0) = 0 or :P1_TYPE = a.type_id)',
'    and (NVL(:P1_USE_CASE,0) = 0 or :P1_USE_CASE = a.use_case_id)',
'    and (:P1_MARQUEE_CUST is null or :P1_MARQUEE_CUST = a.marquee_customer_yn)',
'    and (:P1_IMP_PARTNER is null',
'        or exists ( select null',
'                    from eba_cust_cust_partner_ref rf',
'                    where rf.customer_id = a.id',
'                        and rf.partner_id = :P1_IMP_PARTNER ))',
'    and (:P1_COMPETITOR is null',
'        or exists ( select null',
'                    from eba_cust_cust_competitor_ref rf',
'                    where rf.customer_id = a.id',
'                        and rf.competitor_id = :P1_COMPETITOR ))',
'    and (:P1_REFERENCEABLE is null or :P1_REFERENCEABLE = a.referencable)',
'    and (:P1_SCP_CUST is null or :P1_SCP_CUST = a.strategic_customer_program_yn)',
'    and (',
'        exists (select 1 from eba_cust_customer_reftype_ref r',
'        where r.customer_id = a.id and',
'              instr('':''||:P1_REFERENCE_TYPES||'':'','':''||reference_type_id||'':'') > 0)',
'        or ',
'        :P1_REFERENCE_TYPES is null',
'        )',
'    and (NVL(:P1_PRODUCT,0) = 0 or exists (select 1 from eba_cust_product_uses u where u.CUSTOMER_ID = a.id and u.PRODUCT_ID = :P1_PRODUCT))',
'order by x.customer_users desc'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.HTML5_BAR_CHART'
,p_ajax_items_to_submit=>'P1_TYPE,P1_SEARCH,P1_USE_CASE,P1_MARQUEE_CUST,P1_PRODUCT,P1_IMP_PARTNER,P1_GEO,P1_COMPETITOR,P1_REFERENCEABLE,P1_SCP_CUST,P1_REFERENCE_TYPES,P1_COUNTRY,P1_STATUS,P1_INDUSTRY,P1_CATEGORY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_customized=>'1'
,p_required_patch=>wwv_flow_api.id(14994165819739448501)
,p_attribute_01=>'INITIALS'
,p_attribute_02=>'PRODUCT_NAME'
,p_attribute_03=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.:RP,19,RIR:IR_PRODUCT_NAME:&PRODUCT_NAME.'
,p_attribute_04=>'CUSTOMER_USERS'
,p_attribute_05=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.:RP,19,RIR:IR_PRODUCT_NAME:&PRODUCT_NAME.'
,p_attribute_11=>'VALUE'
,p_attribute_14=>'15'
,p_attribute_15=>'TEXT'
,p_attribute_16=>'ABSOLUTE'
,p_attribute_17=>'MODERN'
,p_attribute_18=>'ABOVE'
,p_attribute_20=>'No data found.'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(13580833326026038219)
,p_name=>'Recently Updated Customers'
,p_region_name=>'CUST_RCNT_UPD'
,p_template=>wwv_flow_api.id(14897235571213526829)
,p_display_sequence=>66
,p_region_css_classes=>'scrollable-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:i-h320:t-Region--hiddenOverflow'
,p_component_template_options=>'#DEFAULT#:t-AVPList--rightAligned'
,p_new_grid_row=>false
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    "CUSTOMER_NAME",',
'    nvl(a.updated,a.created) updated_on,',
'    a.id',
'from eba_cust_customers a,',
'    eba_cust_categories b,',
'    eba_cust_status c,',
'    eba_cust_geographies d,',
'    eba_cust_type e,',
'    eba_cust_use_case f',
'where a.category_id = b.id(+)',
'    and a.status_id = c.id(+)',
'    and a.geography_id = d.id(+)',
'    and a.type_id = e.id(+)',
'    and a.use_case_id = f.id(+)',
'    and (:P1_SEARCH is null or',
'            instr(upper(a.customer_name),upper(:P1_SEARCH)) > 0 or',
'                       instr(upper(a.summary),upper(:P1_SEARCH)) > 0 )',
'    and (NVL(:P1_GEO,0) = 0 or :P1_GEO = a.geography_id)',
'    and (NVL(:P1_COUNTRY,0) = 0 or :P1_COUNTRY = a.country_id)',
'    and (NVL(:P1_INDUSTRY,0) = 0 or  :P1_INDUSTRY = a.industry_id)',
'    and (NVL(:P1_CATEGORY,0) = 0 or :P1_CATEGORY = a.category_id)',
'    and (NVL(:P1_STATUS,0) = 0 or :P1_STATUS = a.status_id)',
'    and (NVL(:P1_TYPE,0) = 0 or :P1_TYPE = a.type_id)',
'    and (NVL(:P1_USE_CASE,0) = 0 or :P1_USE_CASE = a.use_case_id)',
'    and (:P1_MARQUEE_CUST is null or :P1_MARQUEE_CUST = a.marquee_customer_yn)',
'    and (:P1_IMP_PARTNER is null',
'        or exists ( select null',
'                    from eba_cust_cust_partner_ref rf',
'                    where rf.customer_id = a.id',
'                        and rf.partner_id = :P1_IMP_PARTNER ))',
'    and (:P1_COMPETITOR is null',
'        or exists ( select null',
'                    from eba_cust_cust_competitor_ref rf',
'                    where rf.customer_id = a.id',
'                        and rf.competitor_id = :P1_COMPETITOR ))',
'    and (:P1_REFERENCEABLE is null or :P1_REFERENCEABLE = a.referencable)',
'    and (:P1_SCP_CUST is null or :P1_SCP_CUST = a.strategic_customer_program_yn)',
'    and (',
'        exists (select 1 from eba_cust_customer_reftype_ref r',
'        where r.customer_id = a.id and',
'              instr('':''||:P1_REFERENCE_TYPES||'':'','':''||reference_type_id||'':'') > 0)',
'        or ',
'        :P1_REFERENCE_TYPES is null',
'        )',
'    and (NVL(:P1_PRODUCT,0) = 0 or exists (select 1 from eba_cust_product_uses u where u.CUSTOMER_ID = a.id and u.PRODUCT_ID = :P1_PRODUCT))',
'order by nvl(a.updated,a.created) desc'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P1_TYPE,P1_SEARCH,P1_USE_CASE,P1_MARQUEE_CUST,P1_PRODUCT,P1_IMP_PARTNER,P1_GEO,P1_COMPETITOR,P1_REFERENCEABLE,P1_SCP_CUST,P1_REFERENCE_TYPES,P1_COUNTRY,P1_STATUS,P1_INDUSTRY,P1_CATEGORY'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_api.id(14897243947447526846)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'No customers found'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>50
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(13580833636350038220)
,p_query_column_id=>1
,p_column_alias=>'CUSTOMER_NAME'
,p_column_display_sequence=>1
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:50:&SESSION.::&DEBUG.:50:P50_ID:#ID#'
,p_column_linktext=>'#CUSTOMER_NAME#'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(13580834073903038221)
,p_query_column_id=>2
,p_column_alias=>'UPDATED_ON'
,p_column_display_sequence=>2
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(13580834475385038222)
,p_query_column_id=>3
,p_column_alias=>'ID'
,p_column_display_sequence=>3
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(13580836621037044639)
,p_name=>'Summary'
,p_region_name=>'CUST_SUMMARY'
,p_template=>wwv_flow_api.id(14897235571213526829)
,p_display_sequence=>96
,p_region_css_classes=>'scrollable-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:i-h320:t-Region--hiddenOverflow'
,p_component_template_options=>'#DEFAULT#:t-AVPList--rightAligned'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'   x.number_of_customers,',
'   x.added_1w,',
'   x.REFERENCABLE,',
'   x.Potentially_REFERENCABLE,',
'   x.Not_REFERENCABLE,',
'   x.referencability_unknown,',
'   x.with_tags,',
'   y.customer_products,',
'   z.contacts,',
'   z.customers_with_contacts,',
'   x.marquee_customers',
'from',
'(',
'    select',
'        trim(to_char(count(*),''999G999G999G990''))                                                  number_of_customers,',
'        trim(to_char(sum(decode(greatest(a.CREATED,sysdate-7), a.CREATED,1,0)),''999G999G999G990'')) added_1w,',
'        trim(to_char(sum(decode(a.REFERENCABLE , ''Yes'',1,0)),''999G999G999G990''))                   REFERENCABLE,',
'        trim(to_char(sum(decode(a.REFERENCABLE , ''Potentially'',1,0)),''999G999G999G990''))           Potentially_REFERENCABLE,',
'        trim(to_char(sum(decode(a.REFERENCABLE , ''No'',1,0)),''999G999G999G990''))                    Not_REFERENCABLE,',
'        trim(to_char(sum(decode(a.REFERENCABLE , null,1,0)),''999G999G999G990''))                    referencability_unknown,',
'        trim(to_char(sum(decode(a.tags , null,0,1)),''999G999G999G990''))                            with_tags,',
'        trim(to_char(sum(decode(nvl(a.MARQUEE_CUSTOMER_YN,''N'') , ''Y'',1,0)),''999G999G999G990''))     marquee_customers',
'    from eba_cust_customers a,',
'        eba_cust_categories b,',
'        eba_cust_status c,',
'        eba_cust_geographies d,',
'        eba_cust_type e,',
'        eba_cust_use_case f',
'    where a.category_id = b.id(+)',
'        and a.status_id = c.id(+)',
'        and a.geography_id = d.id(+)',
'        and a.type_id = e.id(+)',
'        and a.use_case_id = f.id(+)',
'        and (:P1_SEARCH is null or',
'                instr(upper(a.customer_name),upper(:P1_SEARCH)) > 0 or',
'                           instr(upper(a.summary),upper(:P1_SEARCH)) > 0 )',
'        and (NVL(:P1_GEO,0) = 0 or :P1_GEO = a.geography_id)',
'        and (NVL(:P1_COUNTRY,0) = 0 or :P1_COUNTRY = a.country_id)',
'        and (NVL(:P1_INDUSTRY,0) = 0 or  :P1_INDUSTRY = a.industry_id)',
'        and (NVL(:P1_CATEGORY,0) = 0 or :P1_CATEGORY = a.category_id)',
'        and (NVL(:P1_STATUS,0) = 0 or :P1_STATUS = a.status_id)',
'        and (NVL(:P1_TYPE,0) = 0 or :P1_TYPE = a.type_id)',
'        and (NVL(:P1_USE_CASE,0) = 0 or :P1_USE_CASE = a.use_case_id)',
'        and (:P1_MARQUEE_CUST is null or :P1_MARQUEE_CUST = a.marquee_customer_yn)',
'        and (:P1_IMP_PARTNER is null',
'            or exists ( select null',
'                        from eba_cust_cust_partner_ref rf',
'                        where rf.customer_id = a.id',
'                            and rf.partner_id = :P1_IMP_PARTNER ))',
'        and (:P1_COMPETITOR is null',
'            or exists ( select null',
'                        from eba_cust_cust_competitor_ref rf',
'                        where rf.customer_id = a.id',
'                            and rf.competitor_id = :P1_COMPETITOR ))',
'        and (:P1_REFERENCEABLE is null or :P1_REFERENCEABLE = a.referencable)',
'        and (:P1_SCP_CUST is null or :P1_SCP_CUST = a.strategic_customer_program_yn)',
'        and (',
'            exists (select 1 from eba_cust_customer_reftype_ref r',
'            where r.customer_id = a.id and',
'                  instr('':''||:P1_REFERENCE_TYPES||'':'','':''||reference_type_id||'':'') > 0)',
'            or ',
'            :P1_REFERENCE_TYPES is null',
'            )',
'        and (NVL(:P1_PRODUCT,0) = 0 or exists (select 1 from eba_cust_product_uses u where u.CUSTOMER_ID = a.id and u.PRODUCT_ID = :P1_PRODUCT))',
') x,',
'(',
'    select',
'        trim(to_char(count(distinct u.product_id),''999G999G999G990'')) customer_products',
'    from eba_cust_customers a,',
'        eba_cust_categories b,',
'        eba_cust_status c,',
'        eba_cust_geographies d,',
'        eba_cust_type e,',
'        eba_cust_use_case f,',
'        eba_cust_product_uses u',
'    where a.category_id = b.id(+)',
'        and a.status_id = c.id(+)',
'        and a.geography_id = d.id(+)',
'        and a.type_id = e.id(+)',
'        and a.use_case_id = f.id(+)',
'        and a.id = u.customer_id',
'        and (:P1_SEARCH is null or',
'                instr(upper(a.customer_name),upper(:P1_SEARCH)) > 0 or',
'                           instr(upper(a.summary),upper(:P1_SEARCH)) > 0 )',
'        and (NVL(:P1_GEO,0) = 0 or :P1_GEO = a.geography_id)',
'        and (NVL(:P1_COUNTRY,0) = 0 or :P1_COUNTRY = a.country_id)',
'        and (NVL(:P1_INDUSTRY,0) = 0 or  :P1_INDUSTRY = a.industry_id)',
'        and (NVL(:P1_CATEGORY,0) = 0 or :P1_CATEGORY = a.category_id)',
'        and (NVL(:P1_STATUS,0) = 0 or :P1_STATUS = a.status_id)',
'        and (NVL(:P1_TYPE,0) = 0 or :P1_TYPE = a.type_id)',
'        and (NVL(:P1_USE_CASE,0) = 0 or :P1_USE_CASE = a.use_case_id)',
'        and (:P1_MARQUEE_CUST is null or :P1_MARQUEE_CUST = a.marquee_customer_yn)',
'        and (:P1_IMP_PARTNER is null',
'            or exists ( select null',
'                        from eba_cust_cust_partner_ref rf',
'                        where rf.customer_id = a.id',
'                            and rf.partner_id = :P1_IMP_PARTNER ))',
'        and (:P1_COMPETITOR is null',
'            or exists ( select null',
'                        from eba_cust_cust_competitor_ref rf',
'                        where rf.customer_id = a.id',
'                            and rf.competitor_id = :P1_COMPETITOR ))',
'        and (:P1_REFERENCEABLE is null or :P1_REFERENCEABLE = a.referencable)',
'        and (:P1_SCP_CUST is null or :P1_SCP_CUST = a.strategic_customer_program_yn)',
'        and (',
'            exists (select 1 from eba_cust_customer_reftype_ref r',
'            where r.customer_id = a.id and',
'                  instr('':''||:P1_REFERENCE_TYPES||'':'','':''||reference_type_id||'':'') > 0)',
'            or ',
'            :P1_REFERENCE_TYPES is null',
'            )',
'        and (NVL(:P1_PRODUCT,0) = 0 or exists (select 1 from eba_cust_product_uses u where u.CUSTOMER_ID = a.id and u.PRODUCT_ID = :P1_PRODUCT))',
') y,',
'(',
'    select',
'        trim(to_char(count(*),''999G999G999G990''))                    contacts,',
'        trim(to_char(count(distinct customer_id),''999G999G999G990'')) customers_with_contacts',
'    from eba_cust_customers a,',
'        eba_cust_categories b,',
'        eba_cust_status c,',
'        eba_cust_geographies d,',
'        eba_cust_type e,',
'        eba_cust_use_case f,',
'        eba_cust_contacts x',
'    where a.category_id = b.id(+)',
'        and a.status_id = c.id(+)',
'        and a.geography_id = d.id(+)',
'        and a.type_id = e.id(+)',
'        and a.use_case_id = f.id(+)',
'        and a.id = x.customer_id',
'        and (:P1_SEARCH is null or',
'                instr(upper(a.customer_name),upper(:P1_SEARCH)) > 0 or',
'                           instr(upper(a.summary),upper(:P1_SEARCH)) > 0 )',
'        and (NVL(:P1_GEO,0) = 0 or :P1_GEO = a.geography_id)',
'        and (NVL(:P1_COUNTRY,0) = 0 or :P1_COUNTRY = a.country_id)',
'        and (NVL(:P1_INDUSTRY,0) = 0 or  :P1_INDUSTRY = a.industry_id)',
'        and (NVL(:P1_CATEGORY,0) = 0 or :P1_CATEGORY = a.category_id)',
'        and (NVL(:P1_STATUS,0) = 0 or :P1_STATUS = a.status_id)',
'        and (NVL(:P1_TYPE,0) = 0 or :P1_TYPE = a.type_id)',
'        and (NVL(:P1_USE_CASE,0) = 0 or :P1_USE_CASE = a.use_case_id)',
'        and (:P1_MARQUEE_CUST is null or :P1_MARQUEE_CUST = a.marquee_customer_yn)',
'        and (:P1_IMP_PARTNER is null',
'            or exists ( select null',
'                        from eba_cust_cust_partner_ref rf',
'                        where rf.customer_id = a.id',
'                            and rf.partner_id = :P1_IMP_PARTNER ))',
'        and (:P1_COMPETITOR is null',
'            or exists ( select null',
'                        from eba_cust_cust_competitor_ref rf',
'                        where rf.customer_id = a.id',
'                            and rf.competitor_id = :P1_COMPETITOR ))',
'        and (:P1_REFERENCEABLE is null or :P1_REFERENCEABLE = a.referencable)',
'        and (:P1_SCP_CUST is null or :P1_SCP_CUST = a.strategic_customer_program_yn)',
'        and (',
'            exists (select 1 from eba_cust_customer_reftype_ref r',
'            where r.customer_id = a.id and',
'                  instr('':''||:P1_REFERENCE_TYPES||'':'','':''||reference_type_id||'':'') > 0)',
'            or ',
'            :P1_REFERENCE_TYPES is null',
'            )',
'        and (NVL(:P1_PRODUCT,0) = 0 or exists (select 1 from eba_cust_product_uses u where u.CUSTOMER_ID = a.id and u.PRODUCT_ID = :P1_PRODUCT))',
') z'))
,p_customized=>'1'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P1_TYPE,P1_SEARCH,P1_USE_CASE,P1_MARQUEE_CUST,P1_PRODUCT,P1_IMP_PARTNER,P1_GEO,P1_COMPETITOR,P1_REFERENCEABLE,P1_SCP_CUST,P1_REFERENCE_TYPES,P1_COUNTRY,P1_STATUS,P1_INDUSTRY,P1_CATEGORY'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_api.id(14897244127169526848)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(13580836919745044640)
,p_query_column_id=>1
,p_column_alias=>'NUMBER_OF_CUSTOMERS'
,p_column_display_sequence=>1
,p_column_heading=>'Number of Customers'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_default_sort_dir=>'desc'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(13580837371269044641)
,p_query_column_id=>2
,p_column_alias=>'ADDED_1W'
,p_column_display_sequence=>2
,p_column_heading=>'New last 7 days'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(13580837788689044641)
,p_query_column_id=>3
,p_column_alias=>'REFERENCABLE'
,p_column_display_sequence=>3
,p_column_heading=>'Publicly Referenceable'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APEX_UTIL.GET_BUILD_OPTION_STATUS(',
'    P_APPLICATION_ID => :APP_ID,',
'    P_BUILD_OPTION_NAME => ''Customer Referencability'') = ''INCLUDE'''))
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(13580838099674044641)
,p_query_column_id=>4
,p_column_alias=>'POTENTIALLY_REFERENCABLE'
,p_column_display_sequence=>4
,p_column_heading=>'Potentially Referenceable'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APEX_UTIL.GET_BUILD_OPTION_STATUS(',
'    P_APPLICATION_ID => :APP_ID,',
'    P_BUILD_OPTION_NAME => ''Customer Referencability'') = ''INCLUDE'''))
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(13580838497158044642)
,p_query_column_id=>5
,p_column_alias=>'NOT_REFERENCABLE'
,p_column_display_sequence=>5
,p_column_heading=>'Not Referenceable'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APEX_UTIL.GET_BUILD_OPTION_STATUS(',
'    P_APPLICATION_ID => :APP_ID,',
'    P_BUILD_OPTION_NAME => ''Customer Referencability'') = ''INCLUDE'''))
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(13580838994234044642)
,p_query_column_id=>6
,p_column_alias=>'REFERENCABILITY_UNKNOWN'
,p_column_display_sequence=>6
,p_column_heading=>'Referenceability Unknown'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APEX_UTIL.GET_BUILD_OPTION_STATUS(',
'    P_APPLICATION_ID => :APP_ID,',
'    P_BUILD_OPTION_NAME => ''Customer Referencability'') = ''INCLUDE'''))
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(13580839379795044643)
,p_query_column_id=>7
,p_column_alias=>'WITH_TAGS'
,p_column_display_sequence=>7
,p_column_heading=>'With Tags'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(13580839748881044643)
,p_query_column_id=>8
,p_column_alias=>'CUSTOMER_PRODUCTS'
,p_column_display_sequence=>8
,p_column_heading=>'Customer Products'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(13580840136273044643)
,p_query_column_id=>9
,p_column_alias=>'CONTACTS'
,p_column_display_sequence=>9
,p_column_heading=>'Contacts'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(13580840508554044644)
,p_query_column_id=>10
,p_column_alias=>'CUSTOMERS_WITH_CONTACTS'
,p_column_display_sequence=>10
,p_column_heading=>'Customers With Contacts'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(13580840979426044644)
,p_query_column_id=>11
,p_column_alias=>'MARQUEE_CUSTOMERS'
,p_column_display_sequence=>11
,p_column_heading=>'Marquee Customers'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(13580841704256046081)
,p_name=>'Customer Updates'
,p_region_name=>'CUST_UPDATES'
,p_template=>wwv_flow_api.id(14897235571213526829)
,p_display_sequence=>106
,p_region_css_classes=>'scrollable-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:i-h320:t-Region--hiddenOverflow'
,p_component_template_options=>'#DEFAULT#:t-AVPList--rightAligned'
,p_new_grid_row=>false
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'   ''Note '' || dbms_lob.substr(n.note,100,1) || decode(greatest(length(n.note),100),100,null,''...'') || '' Added - '' || a.customer_name detail,',
'   n.created updated,',
'   a.id customer_id',
'from eba_cust_customers a,',
'    eba_cust_categories b,',
'    eba_cust_status c,',
'    eba_cust_geographies d,',
'    eba_cust_type e,',
'    eba_cust_use_case f,',
'    eba_cust_notes n',
'where a.category_id = b.id(+)',
'    and a.status_id = c.id(+)',
'    and a.geography_id = d.id(+)',
'    and a.type_id = e.id(+)',
'    and a.use_case_id = f.id(+)',
'    and a.id = n.customer_id',
'    and (:P1_SEARCH is null or',
'            instr(upper(a.customer_name),upper(:P1_SEARCH)) > 0 or',
'                       instr(upper(a.summary),upper(:P1_SEARCH)) > 0 )',
'    and (NVL(:P1_GEO,0) = 0 or :P1_GEO = a.geography_id)',
'    and (NVL(:P1_COUNTRY,0) = 0 or :P1_COUNTRY = a.country_id)',
'    and (NVL(:P1_INDUSTRY,0) = 0 or  :P1_INDUSTRY = a.industry_id)',
'    and (NVL(:P1_CATEGORY,0) = 0 or :P1_CATEGORY = a.category_id)',
'    and (NVL(:P1_STATUS,0) = 0 or :P1_STATUS = a.status_id)',
'    and (NVL(:P1_TYPE,0) = 0 or :P1_TYPE = a.type_id)',
'    and (NVL(:P1_USE_CASE,0) = 0 or :P1_USE_CASE = a.use_case_id)',
'    and (:P1_MARQUEE_CUST is null or :P1_MARQUEE_CUST = a.marquee_customer_yn)',
'    and (:P1_IMP_PARTNER is null',
'        or exists ( select null',
'                    from eba_cust_cust_partner_ref rf',
'                    where rf.customer_id = a.id',
'                        and rf.partner_id = :P1_IMP_PARTNER ))',
'    and (:P1_COMPETITOR is null',
'        or exists ( select null',
'                    from eba_cust_cust_competitor_ref rf',
'                    where rf.customer_id = a.id',
'                        and rf.competitor_id = :P1_COMPETITOR ))',
'    and (:P1_REFERENCEABLE is null or :P1_REFERENCEABLE = a.referencable)',
'    and (:P1_SCP_CUST is null or :P1_SCP_CUST = a.strategic_customer_program_yn)',
'    and (',
'        exists (select 1 from eba_cust_customer_reftype_ref r',
'        where r.customer_id = a.id and',
'              instr('':''||:P1_REFERENCE_TYPES||'':'','':''||reference_type_id||'':'') > 0)',
'        or ',
'        :P1_REFERENCE_TYPES is null',
'        )',
'    and (NVL(:P1_PRODUCT,0) = 0 or exists (select 1 from eba_cust_product_uses u where u.CUSTOMER_ID = a.id and u.PRODUCT_ID = :P1_PRODUCT))',
'union all',
'select ',
'   ''Contact '' || t.name || '' Added - '' || a.customer_name detail,',
'   t.created updated,',
'   a.id customer_id',
'from eba_cust_customers a,',
'    eba_cust_categories b,',
'    eba_cust_status c,',
'    eba_cust_geographies d,',
'    eba_cust_type e,',
'    eba_cust_use_case f,',
'    eba_cust_contacts t',
'where a.category_id = b.id(+)',
'    and a.status_id = c.id(+)',
'    and a.geography_id = d.id(+)',
'    and a.type_id = e.id(+)',
'    and a.use_case_id = f.id(+)',
'    and a.id = t.customer_id',
'    and (:P1_SEARCH is null or',
'            instr(upper(a.customer_name),upper(:P1_SEARCH)) > 0 or',
'                       instr(upper(a.summary),upper(:P1_SEARCH)) > 0 )',
'    and (NVL(:P1_GEO,0) = 0 or :P1_GEO = a.geography_id)',
'    and (NVL(:P1_COUNTRY,0) = 0 or :P1_COUNTRY = a.country_id)',
'    and (NVL(:P1_INDUSTRY,0) = 0 or  :P1_INDUSTRY = a.industry_id)',
'    and (NVL(:P1_CATEGORY,0) = 0 or :P1_CATEGORY = a.category_id)',
'    and (NVL(:P1_STATUS,0) = 0 or :P1_STATUS = a.status_id)',
'    and (NVL(:P1_TYPE,0) = 0 or :P1_TYPE = a.type_id)',
'    and (NVL(:P1_USE_CASE,0) = 0 or :P1_USE_CASE = a.use_case_id)',
'    and (:P1_MARQUEE_CUST is null or :P1_MARQUEE_CUST = a.marquee_customer_yn)',
'    and (:P1_IMP_PARTNER is null',
'        or exists ( select null',
'                    from eba_cust_cust_partner_ref rf',
'                    where rf.customer_id = a.id',
'                        and rf.partner_id = :P1_IMP_PARTNER ))',
'    and (:P1_COMPETITOR is null',
'        or exists ( select null',
'                    from eba_cust_cust_competitor_ref rf',
'                    where rf.customer_id = a.id',
'                        and rf.competitor_id = :P1_COMPETITOR ))',
'    and (:P1_REFERENCEABLE is null or :P1_REFERENCEABLE = a.referencable)',
'    and (:P1_SCP_CUST is null or :P1_SCP_CUST = a.strategic_customer_program_yn)',
'    and (',
'        exists (select 1 from eba_cust_customer_reftype_ref r',
'        where r.customer_id = a.id and',
'              instr('':''||:P1_REFERENCE_TYPES||'':'','':''||reference_type_id||'':'') > 0)',
'        or ',
'        :P1_REFERENCE_TYPES is null',
'        )',
'    and (NVL(:P1_PRODUCT,0) = 0 or exists (select 1 from eba_cust_product_uses u where u.CUSTOMER_ID = a.id and u.PRODUCT_ID = :P1_PRODUCT))',
'union all',
'select ',
'   ''Attachment '' || f.file_name || '' Added - '' || a.customer_name detail,',
'   f.created updated,',
'   a.id customer_id',
'from eba_cust_customers a,',
'    eba_cust_categories b,',
'    eba_cust_status c,',
'    eba_cust_geographies d,',
'    eba_cust_type e,',
'    eba_cust_use_case u,',
'    eba_cust_files f',
'where a.category_id = b.id(+)',
'    and a.status_id = c.id(+)',
'    and a.geography_id = d.id(+)',
'    and a.type_id = e.id(+)',
'    and a.use_case_id = u.id(+)',
'    and a.id = f.customer_id',
'    and (:P1_SEARCH is null or',
'            instr(upper(a.customer_name),upper(:P1_SEARCH)) > 0 or',
'                       instr(upper(a.summary),upper(:P1_SEARCH)) > 0 )',
'    and (NVL(:P1_GEO,0) = 0 or :P1_GEO = a.geography_id)',
'    and (NVL(:P1_COUNTRY,0) = 0 or :P1_COUNTRY = a.country_id)',
'    and (NVL(:P1_INDUSTRY,0) = 0 or  :P1_INDUSTRY = a.industry_id)',
'    and (NVL(:P1_CATEGORY,0) = 0 or :P1_CATEGORY = a.category_id)',
'    and (NVL(:P1_STATUS,0) = 0 or :P1_STATUS = a.status_id)',
'    and (NVL(:P1_TYPE,0) = 0 or :P1_TYPE = a.type_id)',
'    and (NVL(:P1_USE_CASE,0) = 0 or :P1_USE_CASE = a.use_case_id)',
'    and (:P1_MARQUEE_CUST is null or :P1_MARQUEE_CUST = a.marquee_customer_yn)',
'    and (:P1_IMP_PARTNER is null',
'        or exists ( select null',
'                    from eba_cust_cust_partner_ref rf',
'                    where rf.customer_id = a.id',
'                        and rf.partner_id = :P1_IMP_PARTNER ))',
'    and (:P1_COMPETITOR is null',
'        or exists ( select null',
'                    from eba_cust_cust_competitor_ref rf',
'                    where rf.customer_id = a.id',
'                        and rf.competitor_id = :P1_COMPETITOR ))',
'    and (:P1_REFERENCEABLE is null or :P1_REFERENCEABLE = a.referencable)',
'    and (:P1_SCP_CUST is null or :P1_SCP_CUST = a.strategic_customer_program_yn)',
'    and (',
'        exists (select 1 from eba_cust_customer_reftype_ref r',
'        where r.customer_id = a.id and',
'              instr('':''||:P1_REFERENCE_TYPES||'':'','':''||reference_type_id||'':'') > 0)',
'        or ',
'        :P1_REFERENCE_TYPES is null',
'        )',
'    and (NVL(:P1_PRODUCT,0) = 0 or exists (select 1 from eba_cust_product_uses u where u.CUSTOMER_ID = a.id and u.PRODUCT_ID = :P1_PRODUCT))',
'union all',
'select ',
'   ''Link to "'' || nvl(l.link_desc, l.link) || ''" Added - ''|| a.customer_name detail,',
'   l.created updated,',
'   a.id customer_id',
'from eba_cust_customers a,',
'    eba_cust_categories b,',
'    eba_cust_status c,',
'    eba_cust_geographies d,',
'    eba_cust_type e,',
'    eba_cust_use_case f,',
'    eba_cust_links l',
'where a.category_id = b.id(+)',
'    and a.status_id = c.id(+)',
'    and a.geography_id = d.id(+)',
'    and a.type_id = e.id(+)',
'    and a.use_case_id = f.id(+)',
'    and a.id = l.customer_id',
'    and (:P1_SEARCH is null or',
'            instr(upper(a.customer_name),upper(:P1_SEARCH)) > 0 or',
'                       instr(upper(a.summary),upper(:P1_SEARCH)) > 0 )',
'    and (NVL(:P1_GEO,0) = 0 or :P1_GEO = a.geography_id)',
'    and (NVL(:P1_COUNTRY,0) = 0 or :P1_COUNTRY = a.country_id)',
'    and (NVL(:P1_INDUSTRY,0) = 0 or  :P1_INDUSTRY = a.industry_id)',
'    and (NVL(:P1_CATEGORY,0) = 0 or :P1_CATEGORY = a.category_id)',
'    and (NVL(:P1_STATUS,0) = 0 or :P1_STATUS = a.status_id)',
'    and (NVL(:P1_TYPE,0) = 0 or :P1_TYPE = a.type_id)',
'    and (NVL(:P1_USE_CASE,0) = 0 or :P1_USE_CASE = a.use_case_id)',
'    and (:P1_MARQUEE_CUST is null or :P1_MARQUEE_CUST = a.marquee_customer_yn)',
'    and (:P1_IMP_PARTNER is null',
'        or exists ( select null',
'                    from eba_cust_cust_partner_ref rf',
'                    where rf.customer_id = a.id',
'                        and rf.partner_id = :P1_IMP_PARTNER ))',
'    and (:P1_COMPETITOR is null',
'        or exists ( select null',
'                    from eba_cust_cust_competitor_ref rf',
'                    where rf.customer_id = a.id',
'                        and rf.competitor_id = :P1_COMPETITOR ))',
'    and (:P1_REFERENCEABLE is null or :P1_REFERENCEABLE = a.referencable)',
'    and (:P1_SCP_CUST is null or :P1_SCP_CUST = a.strategic_customer_program_yn)',
'    and (',
'        exists (select 1 from eba_cust_customer_reftype_ref r',
'        where r.customer_id = a.id and',
'              instr('':''||:P1_REFERENCE_TYPES||'':'','':''||reference_type_id||'':'') > 0)',
'        or ',
'        :P1_REFERENCE_TYPES is null',
'        )',
'    and (NVL(:P1_PRODUCT,0) = 0 or exists (select 1 from eba_cust_product_uses u where u.CUSTOMER_ID = a.id and u.PRODUCT_ID = :P1_PRODUCT))',
'union all',
'select x.detail || '' - '' || x.customer_name detail,',
'       x.updated,',
'       x.customer_id',
'from (',
'    select h.component_id customer_id,',
'           a.customer_name,',
'           initcap(replace(replace(h.COLUMN_NAME,''_ID'',null),''_'','' ''))||'' changed from "''||h.OLD_VALUE||''" to "''||h.new_value||''"'' detail,',
'           lower(h.CHANGED_BY) updated_by,',
'           h.CHANGE_DATE updated',
'    from eba_cust_customers a,',
'        eba_cust_categories b,',
'        eba_cust_status c,',
'        eba_cust_geographies d,',
'        eba_cust_type e,',
'        eba_cust_use_case f,',
'        eba_cust_history h',
'    where a.category_id = b.id(+)',
'        and a.status_id = c.id(+)',
'        and a.geography_id = d.id(+)',
'        and a.type_id = e.id(+)',
'        and a.use_case_id = f.id(+)',
'        and h.component_id = c.id',
'        and (:P1_SEARCH is null or',
'                instr(upper(a.customer_name),upper(:P1_SEARCH)) > 0 or',
'                           instr(upper(a.summary),upper(:P1_SEARCH)) > 0 )',
'        and (NVL(:P1_GEO,0) = 0 or :P1_GEO = a.geography_id)',
'        and (NVL(:P1_COUNTRY,0) = 0 or :P1_COUNTRY = a.country_id)',
'        and (NVL(:P1_INDUSTRY,0) = 0 or  :P1_INDUSTRY = a.industry_id)',
'        and (NVL(:P1_CATEGORY,0) = 0 or :P1_CATEGORY = a.category_id)',
'        and (NVL(:P1_STATUS,0) = 0 or :P1_STATUS = a.status_id)',
'        and (NVL(:P1_TYPE,0) = 0 or :P1_TYPE = a.type_id)',
'        and (NVL(:P1_USE_CASE,0) = 0 or :P1_USE_CASE = a.use_case_id)',
'        and (:P1_MARQUEE_CUST is null or :P1_MARQUEE_CUST = a.marquee_customer_yn)',
'        and (:P1_IMP_PARTNER is null',
'            or exists ( select null',
'                        from eba_cust_cust_partner_ref rf',
'                        where rf.customer_id = a.id',
'                            and rf.partner_id = :P1_IMP_PARTNER ))',
'        and (:P1_COMPETITOR is null',
'            or exists ( select null',
'                        from eba_cust_cust_competitor_ref rf',
'                        where rf.customer_id = a.id',
'                            and rf.competitor_id = :P1_COMPETITOR ))',
'        and (:P1_REFERENCEABLE is null or :P1_REFERENCEABLE = a.referencable)',
'        and (:P1_SCP_CUST is null or :P1_SCP_CUST = a.strategic_customer_program_yn)',
'        and (',
'            exists (select 1 from eba_cust_customer_reftype_ref r',
'            where r.customer_id = a.id and',
'                  instr('':''||:P1_REFERENCE_TYPES||'':'','':''||reference_type_id||'':'') > 0)',
'            or ',
'            :P1_REFERENCE_TYPES is null',
'            )',
'        and (NVL(:P1_PRODUCT,0) = 0 or exists (select 1 from eba_cust_product_uses u where u.CUSTOMER_ID = a.id and u.PRODUCT_ID = :P1_PRODUCT))',
') x',
'order by 2 desc'))
,p_customized=>'1'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P1_TYPE,P1_SEARCH,P1_USE_CASE,P1_MARQUEE_CUST,P1_PRODUCT,P1_IMP_PARTNER,P1_GEO,P1_COMPETITOR,P1_REFERENCEABLE,P1_SCP_CUST,P1_REFERENCE_TYPES,P1_COUNTRY,P1_STATUS,P1_INDUSTRY,P1_CATEGORY'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_api.id(14897243947447526846)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>20
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_no_data_found=>'no data found'
,p_query_row_count_max=>20
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>4200481731648079
,p_default_application_id=>100
,p_default_id_offset=>39500229701756973
,p_default_owner=>'VCONTROL'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(13580842018499046082)
,p_query_column_id=>1
,p_column_alias=>'DETAIL'
,p_column_display_sequence=>2
,p_column_link=>'f?p=&APP_ID.:50:&SESSION.::&DEBUG.:50:P50_ID:#CUSTOMER_ID#'
,p_column_linktext=>'#DETAIL#'
,p_column_link_attr=>'title="#DETAIL#"'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(13580842426574046083)
,p_query_column_id=>2
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>3
,p_use_as_row_header=>'N'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(13580842855037046083)
,p_query_column_id=>3
,p_column_alias=>'CUSTOMER_ID'
,p_column_display_sequence=>1
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(13580843928851047710)
,p_plug_name=>'Tags'
,p_region_name=>'CUST_TAGS'
,p_region_css_classes=>'scrollable-region'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(14897235571213526829)
,p_plug_display_sequence=>116
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select t.tag, t.tag_count',
'  from eba_cust_tags_type_sum t',
' where t.content_type = ''CUSTOMER''',
'   and t.tag_count > 0',
'   and exists (',
'                   select null',
'                     from eba_cust_customers a,',
'                          eba_cust_categories b,',
'                          eba_cust_status c,',
'                          eba_cust_geographies d,',
'                          eba_cust_type e,',
'                          eba_cust_use_case f',
'                    where a.category_id = b.id(+)',
'                      and a.status_id = c.id(+)',
'                      and a.geography_id = d.id(+)',
'                      and a.type_id = e.id(+)',
'                      and a.use_case_id = f.id(+)',
'                      and instr(a.tags, t.tag) > 0',
'                      and (:P1_SEARCH is null or',
'                              instr(upper(a.customer_name),upper(:P1_SEARCH)) > 0 or',
'                                         instr(upper(a.summary),upper(:P1_SEARCH)) > 0 )',
'                      and (NVL(:P1_GEO,0) = 0 or :P1_GEO = a.geography_id)',
'                      and (NVL(:P1_COUNTRY,0) = 0 or :P1_COUNTRY = a.country_id)',
'                      and (NVL(:P1_INDUSTRY,0) = 0 or  :P1_INDUSTRY = a.industry_id)',
'                      and (NVL(:P1_CATEGORY,0) = 0 or :P1_CATEGORY = a.category_id)',
'                      and (NVL(:P1_STATUS,0) = 0 or :P1_STATUS = a.status_id)',
'                      and (NVL(:P1_TYPE,0) = 0 or :P1_TYPE = a.type_id)',
'                      and (NVL(:P1_USE_CASE,0) = 0 or :P1_USE_CASE = a.use_case_id)',
'                      and (:P1_MARQUEE_CUST is null or :P1_MARQUEE_CUST = a.marquee_customer_yn)',
'                      and (:P1_IMP_PARTNER is null',
'                          or exists ( select null',
'                                      from eba_cust_cust_partner_ref rf',
'                                      where rf.customer_id = a.id',
'                                          and rf.partner_id = :P1_IMP_PARTNER ))',
'                      and (:P1_COMPETITOR is null',
'                          or exists ( select null',
'                                      from eba_cust_cust_competitor_ref rf',
'                                      where rf.customer_id = a.id',
'                                          and rf.competitor_id = :P1_COMPETITOR ))',
'                      and (:P1_REFERENCEABLE is null or :P1_REFERENCEABLE = a.referencable)',
'                      and (:P1_SCP_CUST is null or :P1_SCP_CUST = a.strategic_customer_program_yn)',
'                      and (',
'                          exists (select 1 from eba_cust_customer_reftype_ref r',
'                          where r.customer_id = a.id and',
'                                instr('':''||:P1_REFERENCE_TYPES||'':'','':''||reference_type_id||'':'') > 0)',
'                          or ',
'                          :P1_REFERENCE_TYPES is null',
'                          )',
'                      and (NVL(:P1_PRODUCT,0) = 0 or exists (select null',
'                                                               from eba_cust_product_uses u',
'                                                              where u.CUSTOMER_ID = a.id',
'                                                                and u.PRODUCT_ID = :P1_PRODUCT)',
'                          )',
'              )',
'order by t.tag_count desc'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.TAG_CLOUD'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_no_data_found=>'No tags found.'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from eba_cust_tags_type_sum',
' where content_type = ''CUSTOMER''',
'   and tag_count > 0'))
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'f?p=&APP_ID.:59:&SESSION.::&DEBUG.:59,RIR:IRC_TAGS,P59_DISPLAY_AS:#TAG#,REPORT'
,p_attribute_02=>'35'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(14315847208084426487)
,p_plug_name=>'Customer Summary (with References, Products, & Issues)'
,p_region_name=>'CUST_SUM_W_REFS'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--hideHeader:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(14897235571213526829)
,p_plug_display_sequence=>16
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select label, to_number(nvl(value,0),''999G999G990'') value, url from (',
'with data as (',
'    select count(*) total,',
'        sum(decode(marquee_customer_yn,''Y'',1,0)) marquee,',
'        sum(decode(referencable,''Yes'',1,0)) ref',
'    from eba_cust_customers a,',
'        eba_cust_categories b,',
'        eba_cust_status c,',
'        eba_cust_geographies d,',
'        eba_cust_type e,',
'        eba_cust_use_case f',
'    where a.category_id = b.id(+)',
'        and a.status_id = c.id(+)',
'        and a.geography_id = d.id(+)',
'        and a.type_id = e.id(+)',
'        and a.use_case_id = f.id(+)',
'        and (:P1_SEARCH is null or',
'                instr(upper(a.customer_name),upper(:P1_SEARCH)) > 0 or',
'                           instr(upper(a.summary),upper(:P1_SEARCH)) > 0 )',
'        and (NVL(:P1_GEO,0) = 0 or :P1_GEO = a.geography_id)',
'        and (NVL(:P1_COUNTRY,0) = 0 or :P1_COUNTRY = a.country_id)',
'        and (NVL(:P1_INDUSTRY,0) = 0 or  :P1_INDUSTRY = a.industry_id)',
'        and (NVL(:P1_CATEGORY,0) = 0 or :P1_CATEGORY = a.category_id)',
'        and (NVL(:P1_STATUS,0) = 0 or :P1_STATUS = a.status_id)',
'        and (NVL(:P1_TYPE,0) = 0 or :P1_TYPE = a.type_id)',
'        and (NVL(:P1_USE_CASE,0) = 0 or :P1_USE_CASE = a.use_case_id)',
'        and (:P1_MARQUEE_CUST is null or :P1_MARQUEE_CUST = a.marquee_customer_yn)',
'        and (:P1_IMP_PARTNER is null',
'            or exists ( select null',
'                        from eba_cust_cust_partner_ref rf',
'                        where rf.customer_id = a.id',
'                            and rf.partner_id = :P1_IMP_PARTNER ))',
'        and (:P1_COMPETITOR is null',
'            or exists ( select null',
'                        from eba_cust_cust_competitor_ref rf',
'                        where rf.customer_id = a.id',
'                            and rf.competitor_id = :P1_COMPETITOR ))',
'        and (:P1_REFERENCEABLE is null or :P1_REFERENCEABLE = a.referencable)',
'        and (:P1_SCP_CUST is null or :P1_SCP_CUST = a.strategic_customer_program_yn)',
'        and (',
'            exists (select 1 from eba_cust_customer_reftype_ref r',
'            where r.customer_id = a.id and',
'                  instr('':''||:P1_REFERENCE_TYPES||'':'','':''||reference_type_id||'':'') > 0)',
'            or ',
'            :P1_REFERENCE_TYPES is null',
'            )',
'        and (NVL(:P1_PRODUCT,0) = 0 or exists (select 1 from eba_cust_product_uses u where u.CUSTOMER_ID = a.id and u.PRODUCT_ID = :P1_PRODUCT))',
'), rws as (',
'    select level r from dual connect by level < 4',
')',
'select rws.r display_order,',
'    decode(rws.r, 1, ''Total'',    2, ''Marquee'',   3, ''Referenceable'')  label,',
'    decode(rws.r, 1, data.total, 2, data.marquee, 3, data.ref) value,',
'    decode(rws.r, 1, apex_util.prepare_url(''f?p=''||:APP_ID||'':59:''||:APP_SESSION||'':::59,RIR:P59_MARQUEE_CUST,P59_INDUSTRY,P59_PRODUCT,P59_GEO,P59_REFERENCEABLE,P59_STATUS,P59_CATEGORY,P59_TYPE,P59_IMP_PARTNER,P59_COMPETITOR,P59_REFERENCE_TYPES:''||:P'
||'1_MARQUEE_CUST||'',''||:P1_INDUSTRY||'',''||:P1_PRODUCT||'',''||:P1_GEO||'',''||:P1_REFERENCEABLE||'',''||:P1_STATUS||'',''||:P1_CATEGORY||'',''||:P1_TYPE||'',''||:P1_IMP_PARTNER||'',''||:P1_COMPETITOR || '',\'' || :P1_REFERENCE_TYPES || ''\:''),',
'                  2, apex_util.prepare_url(''f?p=''||:APP_ID||'':59:''||:APP_SESSION||'':::59,RIR:IR_MARQUEE_CUSTOMER,P59_MARQUEE_CUST,P59_INDUSTRY,P59_PRODUCT,P59_GEO,P59_REFERENCEABLE,P59_STATUS,P59_CATEGORY,P59_TYPE,P59_IMP_PARTNER,P59_COMPETITOR,P59_R'
||'EFERENCE_TYPES:Yes,Y,''||:P1_INDUSTRY||'',''||:P1_PRODUCT||'',''||:P1_GEO||'',''||:P1_REFERENCEABLE||'',''||:P1_STATUS||'',''||:P1_CATEGORY||'',''||:P1_TYPE||'',''||:P1_IMP_PARTNER||'',''||:P1_COMPETITOR || '',\'' || :P1_REFERENCE_TYPES || ''\:''),',
'                  3, apex_util.prepare_url(''f?p=''||:APP_ID||'':59:''||:APP_SESSION||'':::59,RIR:IR_REFERENCABLE,P59_INDUSTRY,P59_PRODUCT,P59_GEO,P59_REFERENCEABLE,P59_STATUS,P59_CATEGORY,P59_TYPE,P59_IMP_PARTNER,P59_COMPETITOR,P59_REFERENCE_TYPES:Yes,''|'
||'|:P1_INDUSTRY||'',''||:P1_PRODUCT||'',''||:P1_GEO||'',Yes,''||:P1_STATUS||'',''||:P1_CATEGORY||'',''||:P1_TYPE||'',''||:P1_IMP_PARTNER||'',''||:P1_COMPETITOR || '',\'' || :P1_REFERENCE_TYPES || ''\:'' )) url',
'from data, rws',
'union all',
'select 4 as display_order,',
'    ''Products Referenced'' label,',
'    count(*) value,',
'    apex_util.prepare_url(''f?p=''||:APP_ID||'':44:''||:APP_SESSION||'':::44,RIR:'') url',
'from eba_cust_products p',
'where exists (   select 1',
'    from eba_cust_product_uses u',
'    where u.product_id = p.id',
')',
'union all',
'select 5 as display_order,',
'    ''Open Issues'' label,',
'    count(*) value,',
'    apex_util.prepare_url(''f?p=''||:APP_ID||'':134:''||:APP_SESSION||'':::134,RIR:IR_STATUS_ID:Open'') url',
'from eba_cust_issues i',
'where exists (   select null',
'    from eba_cust_issue_statuses u',
'    where u.id = i.status_id',
'      and u.open_yn = ''Y'')',
')',
'order by display_order'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_ajax_items_to_submit=>'P1_TYPE,P1_SEARCH,P1_USE_CASE,P1_MARQUEE_CUST,P1_PRODUCT,P1_IMP_PARTNER,P1_GEO,P1_COMPETITOR,P1_REFERENCEABLE,P1_SCP_CUST,P1_REFERENCE_TYPES,P1_COUNTRY,P1_STATUS,P1_INDUSTRY,P1_CATEGORY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_util.get_build_option_status(',
'                      p_application_id    => :APP_ID,',
'                      p_build_option_name => ''Products and Services''',
'                  ) = ''INCLUDE''',
'and',
'apex_util.get_build_option_status(',
'                      p_application_id    => :APP_ID,',
'                      p_build_option_name => ''Issues''',
'                  ) = ''INCLUDE'''))
,p_plug_display_when_cond2=>'PLSQL'
,p_required_patch=>wwv_flow_api.id(14326325438076037979)
,p_attribute_01=>'LABEL'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'&URL.'
,p_attribute_05=>'5'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(16649375315123023080)
,p_plug_name=>'timezone'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(14897221875819526806)
,p_plug_display_sequence=>126
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'"TIMEZONE" ',
' '))
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'Y'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(16944221206787974231)
,p_plug_name=>'Filters'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(14897235571213526829)
,p_plug_display_sequence=>116
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17838295194333975162)
,p_plug_name=>'Breadcrumbs'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(14897238104700526831)
,p_plug_display_sequence=>40
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(17878114474105061390)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(14897253604799526876)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(20015042977361302593)
,p_plug_name=>'More Filters'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(14897232459317526823)
,p_plug_display_sequence=>126
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2083476852425615722)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(16944221206787974231)
,p_button_name=>'RESET_REPORT'
,p_button_static_id=>'reset_button'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(14897252845630526874)
,p_button_image_alt=>'Reset'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:RP,&APP_PAGE_ID.::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(13580821787816032235)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(1094883898252258261)
,p_button_name=>'VIEW_CATS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(14897252571638526872)
,p_button_image_alt=>'View Categories'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_icon_css_classes=>'fa-chevron-right'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(13580836262771042216)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(1143956817585070217)
,p_button_name=>'VIEW_GEO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(14897252571638526872)
,p_button_image_alt=>'View Geographies'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_icon_css_classes=>'fa-chevron-right'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(13580832967085036483)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(13580832644565036483)
,p_button_name=>'VIEW_CUSTOMERS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(14897252571638526872)
,p_button_image_alt=>'View Customers'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:44:&SESSION.::&DEBUG.:RP,44,RIR::'
,p_icon_css_classes=>'fa-chevron-right'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(13580834851556038223)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(13580833326026038219)
,p_button_name=>'CREATE_CUSTOMER'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(14897252571638526872)
,p_button_image_alt=>'Create Customer'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:2::'
,p_icon_css_classes=>'fa-plus'
,p_security_scheme=>wwv_flow_api.id(16004652111982028856)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(13580835198123038223)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(13580833326026038219)
,p_button_name=>'VIEW_CUSTOMER'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(14897252571638526872)
,p_button_image_alt=>'View Customer'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:59:&SESSION.:IR_20424235:&DEBUG.:RP,59,RIR:P59_SORT:NEWFIRST'
,p_icon_css_classes=>'fa-chevron-right'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(13580843287491046083)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(13580841704256046081)
,p_button_name=>'VIEW_UPDATES'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(14897252571638526872)
,p_button_image_alt=>'View Updates'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:124:&SESSION.::&DEBUG.:RP,RIR::'
,p_icon_css_classes=>'fa-chevron-right'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(13580844275157047712)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(13580843928851047710)
,p_button_name=>'VIEW_TAGS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(14897252571638526872)
,p_button_image_alt=>'View All'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.:RP,40,RIR::'
,p_icon_css_classes=>'fa-chevron-right'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(2053120414711736756)
,p_branch_name=>'Go To Geographies'
,p_branch_action=>'f?p=&APP_ID.:85:&SESSION.::&DEBUG.:RP:P85_CATEGORY:&P1_CATEGORY.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(13580836262771042216)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(2053120537142736757)
,p_branch_name=>'Go to Categories'
,p_branch_action=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.:RP:P32_CATEGORY,P32_GEO:&P1_CATEGORY.,&P1_GEO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(13580821787816032235)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(17838295007215975112)
,p_branch_name=>'Go To Page 1'
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>30
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2083477237340615732)
,p_name=>'P1_SEARCH'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(16944221206787974231)
,p_prompt=>'Search'
,p_placeholder=>'Search Customers'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(14897252300475526868)
,p_item_icon_css_classes=>'fa-search'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2083477588385615736)
,p_name=>'P1_PRODUCT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(16944221206787974231)
,p_prompt=>'Product'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PRODUCTS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select product_name as d,',
'       id as r',
'  from EBA_CUST_PRODUCTS',
' order by 1'))
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
 p_id=>wwv_flow_api.id(2083477952265615737)
,p_name=>'P1_GEO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(16944221206787974231)
,p_item_default=>'0'
,p_prompt=>'Geography'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'GEOGRAPHY'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select GEOGRAPHY_NAME display_value, ID return_value ',
'from EBA_CUST_GEOGRAPHIES',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All - '
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(15059245737117863663)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2083478369296615737)
,p_name=>'P1_REFERENCEABLE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(16944221206787974231)
,p_prompt=>'Publicly Referenceable'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'REFERENCABLE'
,p_lov=>'.'||wwv_flow_api.id(14796803816273935496)||'.'
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
 p_id=>wwv_flow_api.id(2083478790300615737)
,p_name=>'P1_REFERENCE_TYPES'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(16944221206787974231)
,p_prompt=>'Reference Types (any)'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'REFERENCE_TYPES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select reference_type d, id r',
'from eba_cust_reference_types',
'where is_active = ''Y''',
'order by upper(reference_type)'))
,p_field_template=>wwv_flow_api.id(15059245737117863663)
,p_item_css_classes=>'reference_types_checkbox'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Check all the boxes you would like to see.  If any customers have any of the reference types selected you will see the customer.'
,p_inline_help_text=>'<button class="t-Button t-Button--small" id="reference_check_box" type="button">Check All</button>'
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2083479619458615741)
,p_name=>'P1_STATUS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(16944221206787974231)
,p_prompt=>'Status'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'STATUS '
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select status d, id r',
'from   EBA_CUST_STATUS',
'where is_active = ''Y''',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All -'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(15059245737117863663)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_required_patch=>wwv_flow_api.id(17177501492525447045)
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2083481277918618439)
,p_name=>'P1_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(20015042977361302593)
,p_prompt=>'Type'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TYPE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select type d, id r',
'from   EBA_CUST_TYPE',
'where is_active = ''Y''',
'order by 1'))
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
 p_id=>wwv_flow_api.id(2083481667478618439)
,p_name=>'P1_USE_CASE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(20015042977361302593)
,p_prompt=>'Use Case'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'USE_CASE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select use_case d, id r',
'from   EBA_CUST_USE_CASE',
'where is_active = ''Y''',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All -'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(15059245737117863663)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_required_patch=>wwv_flow_api.id(17155700086509368823)
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2083482078405618439)
,p_name=>'P1_MARQUEE_CUST'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(20015042977361302593)
,p_prompt=>'Marquee Customer'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'MARQUEE'
,p_lov=>'.'||wwv_flow_api.id(14796806032203940118)||'.'
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
 p_id=>wwv_flow_api.id(2083482401749618440)
,p_name=>'P1_IMP_PARTNER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(20015042977361302593)
,p_prompt=>'Partner'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name d, id r',
'from eba_cust_impl_partners',
'order by lower(name)'))
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
 p_id=>wwv_flow_api.id(2083482863802618440)
,p_name=>'P1_COMPETITOR'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(20015042977361302593)
,p_prompt=>'Competitor'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name d, id r',
'from eba_cust_competitors',
'order by lower(name)'))
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
 p_id=>wwv_flow_api.id(2083483297193618444)
,p_name=>'P1_SCP_CUST'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(20015042977361302593)
,p_prompt=>'SCP Customer'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'Y_OR_N'
,p_lov=>'.'||wwv_flow_api.id(17840427627036986122)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All -'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(15059245737117863663)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_required_patch=>wwv_flow_api.id(16926393198141034590)
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2083483612259618444)
,p_name=>'P1_COUNTRY'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(20015042977361302593)
,p_prompt=>'Country'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'COUNTRIES_P59'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select country_name as d,',
'       id as r',
'  from EBA_CUST_COUNTRIES',
' where display_yn = ''Y''',
'   and (',
'           (nvl(:P59_GEO,0) = 0 and id is not null)',
'           or',
'           (nvl(:P59_GEO,0)  > 0 and region_id = :P59_GEO)',
'       )',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All -'
,p_lov_null_value=>'0'
,p_lov_cascade_parent_items=>'P1_GEO'
,p_ajax_optimize_refresh=>'N'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(15059245737117863663)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_required_patch=>wwv_flow_api.id(16965757855225696684)
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2083483999409618445)
,p_name=>'P1_INDUSTRY'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(16944221206787974231)
,p_item_default=>'0'
,p_prompt=>'Industry'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'P2_INDUSTRY_ID LOOKUP'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select INDUSTRY_NAME display_value, ID return_value ',
'from EBA_CUST_INDUSTRIES',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All - '
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(15059245737117863663)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2083484477043618445)
,p_name=>'P1_CATEGORY'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(16944221206787974231)
,p_item_default=>'0'
,p_prompt=>'Category'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'CAT'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select category d, id r',
'  from EBA_CUST_CATEGORIES',
' where is_active = ''Y''',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All - '
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(15059245737117863663)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(17850384553268848869)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'1'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2083689660889874816)
,p_name=>'Perform Search on Enter'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_SEARCH'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent.which === 13'
,p_bind_type=>'bind'
,p_bind_event_type=>'keydown'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2083690003755874823)
,p_event_id=>wwv_flow_api.id(2083689660889874816)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(14315847208084426487)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2053117827172736730)
,p_event_id=>wwv_flow_api.id(2083689660889874816)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(13580820004246028781)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2053117617092736728)
,p_event_id=>wwv_flow_api.id(2083689660889874816)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(13580841704256046081)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2053117913995736731)
,p_event_id=>wwv_flow_api.id(2083689660889874816)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1094883898252258261)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2053117786952736729)
,p_event_id=>wwv_flow_api.id(2083689660889874816)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1143956817585070217)
);
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>4200481731648079
,p_default_application_id=>100
,p_default_id_offset=>39500229701756973
,p_default_owner=>'VCONTROL'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2053118088967736732)
,p_event_id=>wwv_flow_api.id(2083689660889874816)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1143957459215070223)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2083690589304874825)
,p_event_id=>wwv_flow_api.id(2083689660889874816)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(13580832644565036483)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2053118192405736733)
,p_event_id=>wwv_flow_api.id(2083689660889874816)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(13580833326026038219)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2083691071339874825)
,p_event_id=>wwv_flow_api.id(2083689660889874816)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(13580836621037044639)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2053118236307736734)
,p_event_id=>wwv_flow_api.id(2083689660889874816)
,p_event_result=>'TRUE'
,p_action_sequence=>110
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(13580843928851047710)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2083691587503874825)
,p_event_id=>wwv_flow_api.id(2083689660889874816)
,p_event_result=>'TRUE'
,p_action_sequence=>120
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CANCEL_EVENT'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2083692990296904334)
,p_name=>'Toggle Reference Type Checkboxes'
,p_event_sequence=>30
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#reference_check_box'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$(this.triggeringElement).text() === "Check All"'
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2083693361646904334)
,p_event_id=>wwv_flow_api.id(2083692990296904334)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(".reference_types_checkbox input[type=checkbox]").prop(''checked'',true);',
'$(this.triggeringElement).text(''Uncheck All'');'))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2083693882611904335)
,p_event_id=>wwv_flow_api.id(2083692990296904334)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(".reference_types_checkbox input[type=checkbox]").prop(''checked'',false);',
'$(this.triggeringElement).text(''Check All'');'))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2083694313018904335)
,p_event_id=>wwv_flow_api.id(2083692990296904334)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'#CARDS, #LOGOS, #CUSTOMERS'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2083694898030904336)
,p_event_id=>wwv_flow_api.id(2083692990296904334)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'#CARDS, #LOGOS, #CUSTOMERS'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2053118349885736735)
,p_name=>'Refresh Regions on Change'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_CATEGORY,P1_TYPE,P1_SEARCH,P1_USE_CASE,P1_MARQUEE_CUST,P1_PRODUCT,P1_IMP_PARTNER,P1_GEO,P1_COMPETITOR,P1_REFERENCEABLE,P1_SCP_CUST,P1_REFERENCE_TYPES,P1_COUNTRY,P1_STATUS,P1_INDUSTRY'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2053118482906736736)
,p_event_id=>wwv_flow_api.id(2053118349885736735)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(14315847208084426487)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2053118534455736737)
,p_event_id=>wwv_flow_api.id(2053118349885736735)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(13580820004246028781)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2053120242525736754)
,p_event_id=>wwv_flow_api.id(2053118349885736735)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(2053119679188736748)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2053118687319736738)
,p_event_id=>wwv_flow_api.id(2053118349885736735)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(13580841704256046081)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2053118704444736739)
,p_event_id=>wwv_flow_api.id(2053118349885736735)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1094883898252258261)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2053118873771736740)
,p_event_id=>wwv_flow_api.id(2053118349885736735)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1143956817585070217)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2053118954847736741)
,p_event_id=>wwv_flow_api.id(2053118349885736735)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1143957459215070223)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2053119039682736742)
,p_event_id=>wwv_flow_api.id(2053118349885736735)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(13580832644565036483)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2053119113474736743)
,p_event_id=>wwv_flow_api.id(2053118349885736735)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(13580833326026038219)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2053119265317736744)
,p_event_id=>wwv_flow_api.id(2053118349885736735)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(13580836621037044639)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2053119344335736745)
,p_event_id=>wwv_flow_api.id(2053118349885736735)
,p_event_result=>'TRUE'
,p_action_sequence=>110
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(13580843928851047710)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(17838294789474975106)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_RESET_PAGINATION'
,p_process_name=>'Reset Pagination'
,p_process_sql_clob=>'reset_pagination'
,p_attribute_01=>'THIS_PAGE'
,p_process_error_message=>'Unable to reset pagination.'
,p_process_when=>'Go,P1_REPORT_SEARCH,RESET'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2053120316684736755)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Filters for Redirect'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P1_CATEGORY := :P1_CATEGORY;',
':P1_GEO := :P1_GEO;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(17858784185359728294)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load Data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :REQUEST = ''REPORTS'' then ',
'    :LAST_VIEW := 20;',
'else',
'    :LAST_VIEW := 30 ;',
'end if;'))
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.component_end;
end;
/
