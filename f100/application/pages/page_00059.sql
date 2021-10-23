prompt --application/pages/page_00059
begin
--   Manifest
--     PAGE: 00059
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
 p_id=>59
,p_user_interface_id=>wwv_flow_api.id(14582016822628385285)
,p_name=>'Customers'
,p_alias=>'CUSTOMERS'
,p_step_title=>'Customers'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(14758150710393128197)
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// standard, cacheable elements',
'var timeout = 0; // used for debounce on search',
'var CONTAINER_SEL = ''.t-Form-fieldContainer'';',
'var pagePrefix = ''P'' + $(''#pFlowStepId'').val();',
'var displayAsId = pagePrefix + ''_DISPLAY_AS'';',
'var $displayAs = $(''#'' + displayAsId);',
'var $body = $(''.t-PageBody'');',
'var $search = $(''#'' + pagePrefix + ''_SEARCH'');',
'var $sort = $(''#'' + pagePrefix + ''_SORT'');',
'var $reset = $(''#reset_button'');',
'var $cardsReg = $(''#cards_region'');',
'var $reportReg = $(''#report_region'');',
'var $logoReg = $(''#logo_region'');',
'',
'// custom items (will vary by page)',
'var $geo             = $(''#'' + pagePrefix + ''_GEO'');',
'var $industry        = $(''#'' + pagePrefix + ''_INDUSTRY'');',
'var $category        = $(''#'' + pagePrefix + ''_CATEGORY'');',
'var $product         = $(''#'' + pagePrefix + ''_PRODUCT'');',
'var $status          = $(''#'' + pagePrefix + ''_STATUS'');',
'var $max_rows        = $(''#'' + pagePrefix + ''_MAX_ROWS'');',
'var $reference_types = $(''#'' + pagePrefix + ''_REFERENCE_TYPES'');',
'var $marquee_cust    = $(''#'' + pagePrefix + ''_MARQUEE_CUST'');',
'var $scp_cust        = $(''#'' + pagePrefix + ''_SCP_CUST'');',
'var $type            = $(''#'' + pagePrefix + ''_TYPE'');',
'var $use_case        = $(''#'' + pagePrefix + ''_USE_CASE'');',
'var $referenceable   = $(''#'' + pagePrefix + ''_REFERENCEABLE'');',
'var $imp_partner     = $(''#'' + pagePrefix + ''_IMP_PARTNER'');',
'var $competitor      = $(''#'' + pagePrefix + ''_COMPETITOR'');',
'var $logo_size       = $(''#'' + pagePrefix + ''_LOGO_SIZE'');',
'',
'function showLeftColumn() {',
'    $body',
'        .removeClass(''t-PageBody--hideLeft'')',
'        .addClass(''t-PageBody--showLeft'');',
'',
'    // Takes 200ms to hide column',
'    setTimeout(function() {',
'        // Ensure column headers align correctly',
'        $(window).trigger(''apexwindowresized'');',
'    }, 250);',
'}',
'',
'function hideLeftColumn() {',
'    $body',
'        .removeClass(''t-PageBody--showLeft'')',
'        .addClass(''t-PageBody--hideLeft'');',
'',
'    // Takes 200ms to hide column',
'    setTimeout(function() {',
'        // Ensure column headers align correctly',
'        $(window).trigger(''apexwindowresized'');',
'    }, 250);',
'}',
'',
'// applyFilters triggers the refresh event on the correct region',
'function applyFilters() {',
'    var display = $v(displayAsId);',
'',
'    if (display === ''CARDS'') {',
'        $cardsReg.trigger(''apexrefresh'');',
'    } else if (display === ''REPORT'') {',
'        $reportReg.trigger(''apexrefresh'');',
'    } else if (display === ''LOGOS'') {',
'        $logoReg.trigger(''apexrefresh'');',
'    }',
'}',
'',
'// toggleRegionDisplay is similar to applyFilters except that it also',
'// takes into account what regions or items need to be displayed or hidden',
'function toggleRegionDisplay(refresh) {',
'    var display = $v(displayAsId);',
'',
'    refresh = (refresh === false) ? false : true;',
'',
'    if (display === ''CARDS'') {',
'        $reportReg.hide();',
'        $logoReg.hide();',
'        $logo_size.closest(CONTAINER_SEL).hide();',
'        showLeftColumn();',
'',
'        if (refresh) {',
'            $cardsReg.trigger(''apexrefresh'');',
'        }',
'',
'        $cardsReg.show();',
'    } else if (display === ''REPORT'') {',
'        $cardsReg.hide();',
'        $logoReg.hide();',
'        $logo_size.closest(CONTAINER_SEL).hide();',
'        hideLeftColumn();',
'        if (refresh) {',
'            $reportReg.trigger(''apexrefresh'');',
'        }',
'',
'        $reportReg.show();',
'    } else if (display === ''LOGOS'') {',
'        $cardsReg.hide();',
'        $reportReg.hide();',
'        $logo_size.closest(CONTAINER_SEL).show();',
'        showLeftColumn();',
'        if (refresh) {',
'            $logoReg.trigger(''apexrefresh'');',
'        }',
'        $logoReg.show();',
'    }',
'}',
'',
'function debounceSearch(e) {',
'    /* ',
'     * Prevent search for following keys:',
'     * TAB:     9',
'     * SHIFT:   16',
'     * LEFT:    37',
'     * RIGHT:   39',
'     */',
'    if ( e.which === 9 || e.which === 16 || e.which === 37 || e.which === 39 ) {',
'        return false;',
'    }',
'',
'    clearTimeout(timeout);',
'    timeout = setTimeout(applyFilters, 250);',
'}',
'',
'function preventSubmitOnEnter(e) {',
'    if (e.which === 13) {',
'        return false;',
'    }',
'}',
'',
'function resetFilters() {',
'    $search.val(null);',
'',
'    $sort.val(null);',
'    $geo.val(null);',
'    $industry.val(null);',
'    $category.val(null);',
'    $product.val(null);',
'    $status.val(null);',
'    $max_rows.val(null);',
'    $reference_types.val(null);',
'    $marquee_cust.val(null);',
'    $scp_cust.val(null);',
'    $type.val(null);',
'    $use_case.val(null);',
'    $referenceable.val(null);',
'    $imp_partner.val(null);',
'    $competitor.val(null);',
'    $logo_size.val(''S'');',
'',
'    applyFilters();',
'}',
'',
'// standard search event bindings',
'$search.keydown(preventSubmitOnEnter);',
'$search.keyup(debounceSearch);',
'',
'// dynamic event bindings (will vary by filter page)',
'$sort.change(applyFilters);',
'$geo.change(applyFilters);',
'$industry.change(applyFilters);',
'$category.change(applyFilters);',
'$product.change(applyFilters);',
'$status.change(applyFilters);',
'$max_rows.change(applyFilters);',
'$reference_types.change(applyFilters);',
'$marquee_cust.change(applyFilters);',
'$scp_cust.change(applyFilters);',
'$type.change(applyFilters);',
'$use_case.change(applyFilters);',
'$referenceable.change(applyFilters);',
'$imp_partner.change(applyFilters);',
'$competitor.change(applyFilters);',
'',
'// standard display, sort, reset event bindings',
'$displayAs.change(toggleRegionDisplay);',
'$reset.click(resetFilters);',
'',
'toggleRegionDisplay(false);'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.logo-cards .t-Card-icon, .logo-cards .t-Card-titleWrap, .logo-cards .t-Card-info { display: none !important }',
'.logo-cards .t-Card .t-Card-body { padding: 0; border: none; margin: 0 }',
'.logo-cards .t-Card .t-Card-desc {position: relative;}',
'.logo-cards .t-Card img { width: 100%; vertical-align: middle; max-height: ; }',
'span.no-image { display: block; text-align: center; color: #909090; font-weight: 200; white-space: nowrap; padding: 0 12px; }',
'.t-Cards--float .t-Cards-item { max-width: 100% }',
'.t-Cards--float.large-logos .t-Cards-item { width: 480px }',
'.t-Cards--float.large-logos.logo-cards .t-Card .t-Card-desc { line-height: 300px; height: 300px}',
'.t-Cards--float.large-logos span.no-image {font-size: 24px;}',
'.t-Cards--float.medium-logos .t-Cards-item { width: 320px }',
'.t-Cards--float.medium-logos.logo-cards .t-Card .t-Card-desc { line-height: 180px; height: 180px}',
'.t-Cards--float.medium-logos span.no-image {font-size: 20px;}',
'.t-Cards--float.small-logos .t-Cards-item { width: 180px }',
'.t-Cards--float.small-logos.logo-cards .t-Card .t-Card-desc { line-height: 120px; height: 120px}',
'.t-Cards--float.small-logos span.no-image {font-size: 14px;}',
'',
'span.customer-logo {',
'    display: block;',
'    background-repeat: no-repeat;',
'    background-position: 50%;',
'    background-size: contain;',
'    margin: 10px;',
'    position: absolute;',
'    top: 0;',
'    left: 0;',
'    right: 0;',
'    bottom: 0;',
'}'))
,p_step_template=>wwv_flow_api.id(14897195001700526770)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h2>About this Application</h2>',
'<p>Customers helps you improve your customer interactions by offering a centralized repository of information.</p>',
'<p>Each customer can have multiple contacts and be associated with multiple products.  Each contact has a variety of standard attributes, such as category, geography, industry and status, as well as the ability to add tags to a customer for further a'
||'d hoc classification.  You can indicate the reference status for a customer and enter free form text as a customer profile.</p>',
'<p>You can create activity records to log interactions with each customer.  Customers includes a variety of reports which let you view recent activities, status changes and tags.  You can also use interactive reports to give your users the ability to'
||' filter and shape customer, contact, activity and interaction data.</p>',
'<p>Customers gives you the ability to define your own standards for attributes such as categories, statuses, customer and activity types, and products, allowing you to create a customized version of Customers to meet your own needs.</p>'))
,p_last_updated_by=>'ALLAN'
,p_last_upd_yyyymmddhh24miss=>'20210301102539'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(14315848749952426502)
,p_name=>'Customer Logos'
,p_region_name=>'logo_region'
,p_template=>wwv_flow_api.id(14897221875819526806)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_sub_css_classes=>'logo-cards'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Cards--featured force-fa-lg:t-Cards--float:t-Cards--animRaiseCard'
,p_region_attributes=>'style="display: none;"'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select apex_util.prepare_url(''f?p=''||:APP_ID||'':50:''||:APP_SESSION||'':::50:P50_ID:''||a.id) card_link,',
'       a.customer_name card_title,',
'       case',
'         when logo_blob is null',
'         then ''<span class="no-image">''||apex_escape.html(a.customer_name)||''</span>''',
'         else ''<span class="customer-logo" style="background-image: url('''''' || apex_util.prepare_url(''f?p='' || :APP_ID',
'             || '':IMAGE::APPLICATION_PROCESS=GET_IMAGE:::GET_ID:'' || a.id) || '''''');" title="''',
'             ||apex_escape.html(a.customer_name)||''"></span>''',
'       end card_text,',
'       null card_subtext,',
'       null card_initials,',
'        a.id',
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
'    and (:P59_SEARCH is null or',
'            instr(upper(a.customer_name),upper(:P59_SEARCH)) > 0 or',
'                       instr(upper(a.summary),upper(:P59_SEARCH)) > 0 )',
'    and (NVL(:P59_GEO,0) = 0 or :P59_GEO = a.geography_id)',
'    and (NVL(:P59_COUNTRY,0) = 0 or :P59_COUNTRY = a.country_id)',
'    and (NVL(:P59_INDUSTRY,0) = 0 or  :P59_INDUSTRY = a.industry_id)',
'    and (NVL(:P59_CATEGORY,0) = 0 or :P59_CATEGORY = a.category_id)',
'    and (NVL(:P59_STATUS,0) = 0 or :P59_STATUS = a.status_id)',
'    and (NVL(:P59_TYPE,0) = 0 or :P59_TYPE = a.type_id)',
'    and (NVL(:P59_USE_CASE,0) = 0 or :P59_USE_CASE = a.use_case_id)',
'    and (:P59_MARQUEE_CUST is null or :P59_MARQUEE_CUST = a.marquee_customer_yn)',
'    and (:P59_IMP_PARTNER is null',
'        or exists ( select null',
'                    from eba_cust_cust_partner_ref rf',
'                    where rf.customer_id = a.id',
'                        and rf.partner_id = :P59_IMP_PARTNER ))',
'    and (:P59_COMPETITOR is null',
'        or exists ( select null',
'                    from eba_cust_cust_competitor_ref rf',
'                    where rf.customer_id = a.id',
'                        and rf.competitor_id = :P59_COMPETITOR ))',
'    and (:P59_REFERENCEABLE is null or :P59_REFERENCEABLE = a.referencable)',
'    and (:P59_SCP_CUST is null or :P59_SCP_CUST = a.strategic_customer_program_yn)',
'    and (',
'        exists (select 1 from eba_cust_customer_reftype_ref r',
'        where r.customer_id = a.id and',
'              instr('':''||:P59_REFERENCE_TYPES||'':'','':''||reference_type_id||'':'') > 0)',
'        or ',
'        :P59_REFERENCE_TYPES is null',
'        )',
'    and  NVL(:P59_DISPLAY_AS,''X'') = ''LOGOS''',
'    and (NVL(:P59_PRODUCT,0) = 0 or exists (select 1 from eba_cust_product_uses u where u.CUSTOMER_ID = a.id and u.PRODUCT_ID = :P59_PRODUCT))',
'order by',
'    case :P59_SORT',
'        when ''NAME'' then lower(a.customer_name)',
'        else null',
'    end,',
'    case :P59_SORT',
'        when ''UPDATED'' then current_timestamp - a.updated',
'        when ''OLDFIRST'' then a.created - current_timestamp',
'        when ''NEWFIRST'' then current_timestamp - a.created',
'        else null',
'    end,',
'    case :P59_SORT',
'        when ''NAME'' then current_timestamp - a.updated',
'        else null',
'    end,',
'    case :P59_SORT',
'        when ''UPDATED'' then lower(a.customer_name)',
'        when ''OLDFIRST'' then lower(a.customer_name)',
'        when ''NEWFIRST'' then lower(a.customer_name)',
'        else null',
'    end'))
,p_required_role=>wwv_flow_api.id(16004652111982028856)
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P59_SEARCH,P59_SORT,P59_GEO,P59_INDUSTRY,P59_CATEGORY,P59_STATUS,P59_MAX_ROWS,P59_REFERENCE_TYPES,P59_MARQUEE_CUST,P59_SCP_CUST,P59_TYPE,P59_USE_CASE,P59_LOGO_SIZE,P59_REFERENCEABLE,P59_IMP_PARTNER,P59_COMPETITOR,P59_DISPLAY_AS,P59_PRODUCT'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_api.id(15059243839089863648)
,p_query_num_rows=>5000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_no_data_found=>'No customers found'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15038355615699394961)
,p_query_column_id=>1
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>2
,p_column_heading=>'Card link'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15038355724440394962)
,p_query_column_id=>2
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>3
,p_column_heading=>'Card title'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15038355819399394963)
,p_query_column_id=>3
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>4
,p_column_heading=>'Card text'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15038355974117394964)
,p_query_column_id=>4
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>5
,p_column_heading=>'Card subtext'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15038356028629394965)
,p_query_column_id=>5
,p_column_alias=>'CARD_INITIALS'
,p_column_display_sequence=>6
,p_column_heading=>'Card initials'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15034699919641199554)
,p_query_column_id=>6
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(14902555721428620415)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_plug_template=>wwv_flow_api.id(14897238104700526831)
,p_plug_display_sequence=>50
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(17878114474105061390)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(14897253604799526876)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(14902740283750724843)
,p_name=>'Customer Cards'
,p_region_name=>'cards_region'
,p_template=>wwv_flow_api.id(14897221875819526806)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Cards--desc-2ln:u-colors:t-Cards--displayInitials:t-Cards--3cols:t-Cards--basic:t-Cards--animColorFill'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select apex_util.prepare_url(''f?p=''||:APP_ID||'':50:''||:APP_SESSION||'':::50:P50_ID:''||a.id) card_link,',
'       a.customer_name card_title,',
'       NVL(substr(a.summary,1,255), DBMS_LOB.substr(a.customer_profile,255,1))      card_text,',
'       --nvl(c.status,''Unknown Status'')||'', ''||',
'       nvl((select INDUSTRY_NAME from EBA_CUST_INDUSTRIES i where i.id = a.INDUSTRY_ID),'''')||decode(geography_name,null,null,'', ''|| geography_name) card_subtext,',
'        upper(',
'          decode(instr(a.customer_name,'' ''),',
'                 0, ',
'                 substr(a.customer_name,1,2),',
'                 substr(a.customer_name,1,1)||substr(a.customer_name,instr(a.customer_name,'' '')+1,1)',
'           )) card_initials',
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
'    and (:P59_SEARCH is null or',
'            instr(upper(a.customer_name),upper(:P59_SEARCH)) > 0 or',
'                       instr(upper(a.summary),upper(:P59_SEARCH)) > 0 )',
'    and (NVL(:P59_GEO,0) = 0 or :P59_GEO = a.geography_id)',
'    and (NVL(:P59_COUNTRY,0) = 0 or :P59_COUNTRY = a.country_id)',
'    and (NVL(:P59_INDUSTRY,0) = 0 or  :P59_INDUSTRY = a.industry_id)',
'    and (NVL(:P59_CATEGORY,0) = 0 or :P59_CATEGORY = a.category_id)',
'    and (NVL(:P59_STATUS,0) = 0 or :P59_STATUS = a.status_id)',
'    and (NVL(:P59_TYPE,0) = 0 or :P59_TYPE = a.type_id)',
'    and (NVL(:P59_USE_CASE,0) = 0 or :P59_USE_CASE = a.use_case_id)',
'    and (:P59_MARQUEE_CUST is null or :P59_MARQUEE_CUST = a.marquee_customer_yn)',
'    and (:P59_IMP_PARTNER is null',
'        or exists ( select null',
'                    from eba_cust_cust_partner_ref rf',
'                    where rf.customer_id = a.id',
'                        and rf.partner_id = :P59_IMP_PARTNER ))',
'    and (:P59_COMPETITOR is null',
'        or exists ( select null',
'                    from eba_cust_cust_competitor_ref rf',
'                    where rf.customer_id = a.id',
'                        and rf.competitor_id = :P59_COMPETITOR ))',
'    and (:P59_REFERENCEABLE is null or :P59_REFERENCEABLE = a.referencable)',
'    and (:P59_SCP_CUST is null or :P59_SCP_CUST = a.strategic_customer_program_yn)',
'    and (',
'        exists (select 1 from eba_cust_customer_reftype_ref r',
'        where r.customer_id = a.id and',
'              instr('':''||:P59_REFERENCE_TYPES||'':'','':''||reference_type_id||'':'') > 0)',
'        or ',
'        :P59_REFERENCE_TYPES is null',
'        )',
'    and  NVL(:P59_DISPLAY_AS,''X'') = ''CARDS''',
'    and (NVL(:P59_PRODUCT,0) = 0 or exists (select 1 from eba_cust_product_uses u where u.CUSTOMER_ID = a.id and u.PRODUCT_ID = :P59_PRODUCT))',
'order by',
'    case :P59_SORT',
'        when ''NAME'' then lower(a.customer_name)',
'        else null',
'    end,',
'    case :P59_SORT',
'        when ''UPDATED'' then current_timestamp - a.updated',
'        when ''OLDFIRST'' then a.created - current_timestamp',
'        when ''NEWFIRST'' then current_timestamp - a.created',
'        else null',
'    end,',
'    case :P59_SORT',
'        when ''NAME'' then current_timestamp - a.updated',
'        else null',
'    end,',
'    case :P59_SORT',
'        when ''UPDATED'' then lower(a.customer_name)',
'        when ''OLDFIRST'' then lower(a.customer_name)',
'        when ''NEWFIRST'' then lower(a.customer_name)',
'        else null',
'    end'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P59_SEARCH,P59_SORT,P59_GEO,P59_INDUSTRY,P59_CATEGORY,P59_STATUS,P59_MAX_ROWS,P59_REFERENCE_TYPES,P59_MARQUEE_CUST,P59_SCP_CUST,P59_TYPE,P59_USE_CASE,P59_REFERENCEABLE,P59_IMP_PARTNER,P59_COMPETITOR,P59_DISPLAY_AS,P59_PRODUCT'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_api.id(15059243839089863648)
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    --and (NVL(:P59_PRODUCT,0) = 0 or instr((select listagg(p.id,'','') within group (order by p.id) from eba_cust_products p, eba_cust_product_uses u where u.customer_id = a._id and u.product_id = p.id), :P59_PRODUCT) > 0)',
''))
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(16926862366403178775)
,p_query_column_id=>1
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>1
,p_column_heading=>'Card link'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(16926862412079178776)
,p_query_column_id=>2
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>2
,p_column_heading=>'Card title'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(16926862589105178777)
,p_query_column_id=>3
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>3
,p_column_heading=>'Card text'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(16926862611989178778)
,p_query_column_id=>4
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>4
,p_column_heading=>'Card subtext'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(16926862706744178779)
,p_query_column_id=>5
,p_column_alias=>'CARD_INITIALS'
,p_column_display_sequence=>5
,p_column_heading=>'Card initials'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(14902755795285794833)
,p_plug_name=>'Filters'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--scrollBody:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(14897235571213526829)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(15791876241105714680)
,p_plug_name=>'Customers Report'
,p_region_name=>'report_region'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton'
,p_region_attributes=>'style="display: none;"'
,p_plug_template=>wwv_flow_api.id(14897235128441526826)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.row_key,',
'    a.id,',
'    a.parent_customer_id,',
'    a.customer_account_number,',
'    to_char(nvl(a.DISCOUNT_LEVEL,0),''999G999G999G999G999G999G990'') || ''%'' discount_level,',
'    ''$'' || to_char(nvl(a.TOTAL_CONTRACT_VALUE,0),''999G999G999G999G999G999G990'') total_contract_value,',
'    (select count(''x'') from eba_cust_activity_ref r where a.id = r.customer_id) activities,',
'    customer_name,',
'    a.STRATEGIC_CUSTOMER_PROGRAM_YN,',
'    (select country_name from eba_cust_countries c where id = a.country_id) as country,',
'    c.status,',
'    e.type,',
'    f.use_case,',
'    category,',
'    nvl(geography_name,''Not Defined'') geography_name,',
'    decode(referencable, null, ''No'', referencable) referencable,',
'    (select status from EBA_CUST_REF_PHASE p where p.id = a.reference_phase_id) ref_phase,',
'    a.REF_RECRUITMENT_OWNER,',
'    (select channel from EBA_CUST_SALES_CHANNEL sc where sc.id = a.SALES_CHANNEL_ID) sales_channel,',
'    number_of_users,',
'    decode(marquee_customer_yn, null, ''No'', ''N'', ''No'', ''Y'', ''Yes'') marquee_customer,',
'    decode(greatest(length(nvl(summary,'' '')),50),50,summary,substr(summary,1,50)||''...'') summary,',
'    web_site,',
'    (   select listagg(p.product_name, '', '') within group (order by p.product_name) product_uses',
'        from eba_cust_customers c, eba_cust_product_uses u, eba_cust_products p',
'        where c.id = u.customer_id',
'            and u.product_id = p.id',
'            and c.id = a.id',
'        group by c.customer_name',
'    ) product_uses,',
'    tags,',
'    nvl((select INDUSTRY_NAME from EBA_CUST_INDUSTRIES i where i.id = a.INDUSTRY_ID),''Not Defined'') industry,',
'    a.industry_id,',
'    a.created,',
'    a.created_by,',
'    a.updated,',
'    a.updated_by,',
'    (   select listagg(rt.reference_type, '', '') within group (order by rt.reference_type) reference_types',
'        from eba_cust_reference_types rt, eba_cust_customer_reftype_ref ref',
'        where ref.customer_id = a.id',
'            and rt.id = ref.reference_type_id',
'    ) referencability',
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
'--',
'--    and (:P59_SEARCH is null or',
'--            instr(upper(a.customer_name),upper(:P59_SEARCH)) > 0 or',
'--                       instr(upper(a.summary),upper(:P59_SEARCH)) > 0 )',
'--    and (NVL(:P59_GEO,0) = 0 or :P59_GEO = a.geography_id)',
'--    and (NVL(:P59_COUNTRY,0) = 0 or :P59_COUNTRY = a.country_id)',
'--    and (NVL(:P59_INDUSTRY,0) = 0 or  :P59_INDUSTRY = a.industry_id)',
'--    and (NVL(:P59_CATEGORY,0) = 0 or :P59_CATEGORY = a.category_id)',
'--    and (NVL(:P59_STATUS,0) = 0 or :P59_STATUS = a.status_id)',
'--    and (NVL(:P59_TYPE,0) = 0 or :P59_TYPE = a.type_id)',
'--    and (NVL(:P59_USE_CASE,0) = 0 or :P59_USE_CASE = a.use_case_id)',
'--    and (:P59_MARQUEE_CUST is null or :P59_MARQUEE_CUST = a.marquee_customer_yn)',
'--    and (:P59_IMP_PARTNER is null',
'--        or exists ( select null',
'--                    from eba_cust_cust_partner_ref rf',
'--                    where rf.customer_id = a.id',
'--                        and rf.partner_id = :P59_IMP_PARTNER ))',
'--    and (:P59_COMPETITOR is null',
'--        or exists ( select null',
'--                    from eba_cust_cust_competitor_ref rf',
'--                    where rf.customer_id = a.id',
'--                        and rf.competitor_id = :P59_COMPETITOR ))',
'--    and (:P59_REFERENCEABLE is null or :P59_REFERENCEABLE = a.referencable)',
'--    and (:P59_SCP_CUST is null or :P59_SCP_CUST = a.strategic_customer_program_yn)',
'--    and (',
'--        exists (select 1 from eba_cust_customer_reftype_ref r',
'--        where r.customer_id = a.id and',
'--              instr('':''||:P59_REFERENCE_TYPES||'':'','':''||reference_type_id||'':'') > 0)',
'--        or ',
'--        :P59_REFERENCE_TYPES is null',
'--        )',
'    and NVL(:P59_DISPLAY_AS,''X'') = ''REPORT''',
'--    and (NVL(:P59_PRODUCT,0) = 0 or exists (select 1 from eba_cust_product_uses u where u.CUSTOMER_ID = a.id and u.PRODUCT_ID = :P59_PRODUCT))'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P59_DISPLAY_AS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(15791876480223714685)
,p_name=>'Customers'
,p_max_row_count=>'100000'
,p_max_row_count_message=>'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.'
,p_no_data_found_message=>'No data found.'
,p_allow_report_categories=>'N'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLSX:PDF:RTF'
,p_owner=>'MIKE'
,p_internal_uid=>2328071018446133994
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15791876604442714690)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Selected Customer'
,p_column_link=>'f?p=&APP_ID.:50:&SESSION.::&DEBUG.:50:P50_ID:#ID#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#themes/theme_13/ed-item.gif" alt="Edit" />'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15791883853589714702)
,p_db_column_name=>'CUSTOMER_NAME'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Customer'
,p_column_link=>'f?p=&APP_ID.:50:&SESSION.::&DEBUG.:RP,50:P50_ID:#ID#'
,p_column_linktext=>'#CUSTOMER_NAME#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15791884988506714706)
,p_db_column_name=>'REFERENCABLE'
,p_display_order=>3
,p_column_identifier=>'E'
,p_column_label=>'Publicly Referenceable'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APEX_UTIL.GET_BUILD_OPTION_STATUS(',
'    P_APPLICATION_ID => :APP_ID,',
'    P_BUILD_OPTION_NAME => ''Customer Referencability'') = ''INCLUDE'''))
,p_display_condition2=>'PLSQL'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15791885371850714706)
,p_db_column_name=>'NUMBER_OF_USERS'
,p_display_order=>4
,p_column_identifier=>'F'
,p_column_label=>'# of Users'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_display_condition_type=>'FUNCTION_BODY'
,p_display_condition=>'return wwv_flow_utilities.is_build_option_enabled(''Number_of_users'');'
,p_display_condition2=>'PLSQL'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15791885860576714707)
,p_db_column_name=>'SUMMARY'
,p_display_order=>5
,p_column_identifier=>'G'
,p_column_label=>'Summary'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15791886256443714709)
,p_db_column_name=>'WEB_SITE'
,p_display_order=>6
,p_column_identifier=>'H'
,p_column_label=>'Web Site'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15791886604491714709)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>13
,p_column_identifier=>'O'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
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
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15791886962345714709)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>15
,p_column_identifier=>'Q'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15791884607641714704)
,p_db_column_name=>'CATEGORY'
,p_display_order=>16
,p_column_identifier=>'D'
,p_column_label=>'Category'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15791884173380714702)
,p_db_column_name=>'STATUS'
,p_display_order=>17
,p_column_identifier=>'C'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15791887431280714710)
,p_db_column_name=>'TAGS'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Tags'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_rpt_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select tag',
'  from eba_cust_tags_type_sum',
' where content_type = ''CUSTOMER''',
'   and tag_count > 0'))
,p_rpt_show_filter_lov=>'C'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15791887770469714712)
,p_db_column_name=>'ROW_KEY'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'View'
,p_column_link=>'f?p=&APP_ID.:50:&SESSION.::&DEBUG.:50:P50_ID:#ID#'
,p_column_linktext=>'<span>#ROW_KEY#</span>'
,p_column_link_attr=>'class="t-Button t-Button--small t-Button--hot t-Button--simple t-Button--stretch"'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15791888248224714715)
,p_db_column_name=>'CREATED'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15791888614319714716)
,p_db_column_name=>'UPDATED'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15791889000487714716)
,p_db_column_name=>'GEOGRAPHY_NAME'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Geography'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>'wwv_flow_utilities.is_build_option_enabled(''Geography'')'
,p_display_condition2=>'PLSQL'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15791889396252714718)
,p_db_column_name=>'PRODUCT_USES'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Products'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>'wwv_flow_utilities.is_build_option_enabled(''Products and Services'')'
,p_display_condition2=>'PLSQL'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15791889777020714719)
,p_db_column_name=>'MARQUEE_CUSTOMER'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Marquee Customer'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15791890169263714721)
,p_db_column_name=>'INDUSTRY'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Industry'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15791890590910714721)
,p_db_column_name=>'INDUSTRY_ID'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Selected Industry'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15882193958397999412)
,p_db_column_name=>'REF_PHASE'
,p_display_order=>48
,p_column_identifier=>'AV'
,p_column_label=>'Ref Phase'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APEX_UTIL.GET_BUILD_OPTION_STATUS(',
'    P_APPLICATION_ID => :APP_ID,',
'    P_BUILD_OPTION_NAME => ''Customer Referencability'') = ''INCLUDE'''))
,p_display_condition2=>'PLSQL'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15882524070371298571)
,p_db_column_name=>'SALES_CHANNEL'
,p_display_order=>49
,p_column_identifier=>'AW'
,p_column_label=>'Sales Channel'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15882525680327300095)
,p_db_column_name=>'REF_RECRUITMENT_OWNER'
,p_display_order=>50
,p_column_identifier=>'AX'
,p_column_label=>'Ref Recruitment Owner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APEX_UTIL.GET_BUILD_OPTION_STATUS(',
'    P_APPLICATION_ID => :APP_ID,',
'    P_BUILD_OPTION_NAME => ''Customer Referencability'') = ''INCLUDE'''))
,p_display_condition2=>'PLSQL'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15160820924267425370)
,p_db_column_name=>'REFERENCABILITY'
,p_display_order=>51
,p_column_identifier=>'AY'
,p_column_label=>'Referencability'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16969642059031468758)
,p_db_column_name=>'COUNTRY'
,p_display_order=>61
,p_column_identifier=>'AZ'
,p_column_label=>'Country'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17040038720203079464)
,p_db_column_name=>'TYPE'
,p_display_order=>71
,p_column_identifier=>'BA'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17040039053667079467)
,p_db_column_name=>'USE_CASE'
,p_display_order=>81
,p_column_identifier=>'BB'
,p_column_label=>'Use Case'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17179695084636083557)
,p_db_column_name=>'STRATEGIC_CUSTOMER_PROGRAM_YN'
,p_display_order=>91
,p_column_identifier=>'BC'
,p_column_label=>'SCP Customer'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_api.id(17840427627036986122)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(18498398257445036596)
,p_db_column_name=>'PARENT_CUSTOMER_ID'
,p_display_order=>101
,p_column_identifier=>'BD'
,p_column_label=>'Parent'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_api.id(16628920215310694781)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(18498398360502036597)
,p_db_column_name=>'CUSTOMER_ACCOUNT_NUMBER'
,p_display_order=>111
,p_column_identifier=>'BE'
,p_column_label=>'Customer account number'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1145365569662604927)
,p_db_column_name=>'DISCOUNT_LEVEL'
,p_display_order=>121
,p_column_identifier=>'BF'
,p_column_label=>'Discount Level'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1145365681808604928)
,p_db_column_name=>'TOTAL_CONTRACT_VALUE'
,p_display_order=>131
,p_column_identifier=>'BG'
,p_column_label=>'Total Contract Value'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1145365718717604929)
,p_db_column_name=>'ACTIVITIES'
,p_display_order=>141
,p_column_identifier=>'BH'
,p_column_label=>'Activities'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(2084434525930218459)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'SORT_BY_UPD'
,p_report_seq=>10
,p_report_alias=>'20424235'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CUSTOMER_NAME:SUMMARY:REFERENCABLE:REFERENCABILITY:GEOGRAPHY_NAME:UPDATED::DISCOUNT_LEVEL:TOTAL_CONTRACT_VALUE:ACTIVITIES'
,p_sort_column_1=>'UPDATED'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'CUSTOMER_NAME'
,p_sort_direction_2=>'ASC'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(15791891025821714722)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'23280856'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CUSTOMER_NAME:SUMMARY:REFERENCABLE:REFERENCABILITY:GEOGRAPHY_NAME:UPDATED::DISCOUNT_LEVEL:TOTAL_CONTRACT_VALUE:ACTIVITIES'
,p_sort_column_1=>'CUSTOMER_NAME'
,p_sort_direction_1=>'ASC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(15791891773779754227)
,p_plug_name=>'Hidden Items'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(14897221875819526806)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17973573108142120469)
,p_plug_name=>'More Filters'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(14897232459317526823)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(20264118123428308967)
,p_plug_name=>'&APPLICATION_TITLE.'
,p_icon_css_classes=>'app-customer-tracker'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(14897231876911526821)
,p_plug_display_sequence=>60
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'  t varchar2(4000) := null;',
'begin',
'  begin',
'      t := EBA_CUST_FW.get_preference_value(''WELCOME_TEXT'');',
'  exception',
'      when others then ',
'      t := null;',
'  end;',
'  if t is null or t = ''&nbsp;'' or t = ''Preference does not exist'' then',
'     sys.htp.p(''<p>Track and Manage Customers</p>'');',
'  else',
'     sys.htp.p(''<p>''||apex_escape.html(t)||''</p>'');',
'  end if;',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(20264118487664308970)
,p_plug_name=>'Search'
,p_parent_plug_id=>wwv_flow_api.id(20264118123428308967)
,p_region_css_classes=>'t-Form--search'
,p_region_template_options=>'#DEFAULT#:#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(14897221875819526806)
,p_plug_display_sequence=>170
,p_plug_display_point=>'BODY'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(20264842881957452670)
,p_name=>'Notifications'
,p_template=>wwv_flow_api.id(14897235571213526829)
,p_display_sequence=>1
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    id,',
'    decode(lower(NOTIFICATION_TYPE),''yellow'',''warning'',''red'',''danger'',lower(NOTIFICATION_TYPE)) as ALERT_TYPE,',
'    NOTIFICATION_NAME as ALERT_TITLE,',
'    NOTIFICATION_DESCRIPTION as ALERT_DESC,',
'    '''' alert_action',
'  from EBA_CUST_NOTIFICATIONS',
' where (DISPLAY_FROM is null or DISPLAY_FROM <= current_date) and',
'       (DISPLAY_UNTIL is null or DISPLAY_UNTIL >= current_date)',
' order by nvl(DISPLAY_SEQUENCE,0),NOTIFICATION_NAME'))
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from EBA_CUST_NOTIFICATIONS',
' where (DISPLAY_FROM is null or DISPLAY_FROM <= current_date) and',
'       (DISPLAY_UNTIL is null or DISPLAY_UNTIL >= current_date)'))
,p_display_condition_type=>'EXISTS'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_api.id(14912992594986937906)
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_row_count_max=>500
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
 p_id=>wwv_flow_api.id(20264843176113452675)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_column_heading=>'ID'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(20264843519981452677)
,p_query_column_id=>2
,p_column_alias=>'ALERT_TYPE'
,p_column_display_sequence=>2
,p_column_heading=>'Alert type'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(20264843940649452678)
,p_query_column_id=>3
,p_column_alias=>'ALERT_TITLE'
,p_column_display_sequence=>3
,p_column_heading=>'Alert title'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(20264844304096452679)
,p_query_column_id=>4
,p_column_alias=>'ALERT_DESC'
,p_column_display_sequence=>4
,p_column_heading=>'Alert desc'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(20264844762940452679)
,p_query_column_id=>5
,p_column_alias=>'ALERT_ACTION'
,p_column_display_sequence=>5
,p_column_heading=>'Alert action'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(20264846584611454143)
,p_plug_name=>'ACL Warning'
,p_region_template_options=>'#DEFAULT#:t-Alert--colorBG:t-Alert--defaultIcons:t-Alert--warning:t-Alert--horizontal'
,p_plug_template=>wwv_flow_api.id(14897220145742526801)
,p_plug_display_sequence=>2
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.ACL_WARNING'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'eba_cust_fw.get_preference_value(''ACCESS_CONTROL_ENABLED'') = ''N'''
,p_plug_display_when_cond2=>'PLSQL'
,p_attribute_01=>'f?p=&APP_ID.:SETTINGS:&SESSION.::&DEBUG.:RP::'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(20264880022161669249)
,p_plug_name=>'Timezone'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="clear: both;"'
,p_plug_template=>wwv_flow_api.id(14897221875819526806)
,p_plug_display_sequence=>180
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
 p_id=>wwv_flow_api.id(20264881597499670497)
,p_plug_name=>'Welcome to Customers'
,p_region_template_options=>'#DEFAULT#:t-Alert--wizard:t-Alert--noIcon:t-Alert--info'
,p_component_template_options=>'#DEFAULT#:t-MediaList--cols t-MediaList--2cols'
,p_plug_template=>wwv_flow_api.id(14897220145742526801)
,p_plug_display_sequence=>3
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(18017490525075817736)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(14897248671492526855)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NOT_EXISTS'
,p_plug_display_when_condition=>'select 1 from eba_cust_customers'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(14912333009899840916)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(14902755795285794833)
,p_button_name=>'RESET_REPORT'
,p_button_static_id=>'reset_button'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(14897252845630526874)
,p_button_image_alt=>'Reset'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(15809974207396365347)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(20264118123428308967)
,p_button_name=>'ADD_CUSTOMER'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_api.id(14897253374800526875)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Customer'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:2::'
,p_security_scheme=>wwv_flow_api.id(16004652111982028856)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(20264846856215454146)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(20264846584611454143)
,p_button_name=>'CONFIG_ACL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(14897253374800526875)
,p_button_image_alt=>'Configure ACL'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:35:&SESSION.::&DEBUG.:RP,35::'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(17179695096522083558)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(15791876241105714680)
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(14897252571638526872)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:RP,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(1197532234105308919)
,p_branch_name=>'Go to Getting Started Page'
,p_branch_action=>'f?p=&APP_ID.:1000:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_HEADER'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'EXPRESSION'
,p_branch_condition=>'eba_cust_fw.get_preference_value(''FIRST_RUN'') = ''YES'''
,p_branch_condition_text=>'PLSQL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1135657022423986834)
,p_name=>'P59_DISPLAY_AS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(20264118487664308970)
,p_item_default=>'CARDS'
,p_prompt=>'Display as'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'HOMEPAGE_DISPLAY_AS'
,p_lov=>'.'||wwv_flow_api.id(1188183247427522104)||'.'
,p_field_template=>wwv_flow_api.id(14897252300475526868)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large:t-Form-fieldContainer--radioButtonGroup'
,p_lov_display_extra=>'NO'
,p_escape_on_http_output=>'N'
,p_attribute_01=>'4'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12037606124459677102)
,p_name=>'P59_REFERENCE_TYPES'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(14902755795285794833)
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
 p_id=>wwv_flow_api.id(14902757161071806357)
,p_name=>'P59_GEO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(14902755795285794833)
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
 p_id=>wwv_flow_api.id(14902758378553811897)
,p_name=>'P59_SEARCH'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(14902755795285794833)
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
 p_id=>wwv_flow_api.id(14902759061001816498)
,p_name=>'P59_INDUSTRY'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(17973573108142120469)
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
 p_id=>wwv_flow_api.id(14902759613702826683)
,p_name=>'P59_CATEGORY'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(17973573108142120469)
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
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14902787329127884376)
,p_name=>'P59_MAX_ROWS'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(17973573108142120469)
,p_item_default=>'20'
,p_prompt=>'Rows'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'MAX ROWS'
,p_lov=>'.'||wwv_flow_api.id(14902799709514968344)||'.'
,p_cHeight=>1
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(15059245737117863663)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14902803960190068579)
,p_name=>'P59_STATUS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(14902755795285794833)
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
 p_id=>wwv_flow_api.id(15070017965735282875)
,p_name=>'P59_LOGO_SIZE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(14902755795285794833)
,p_item_default=>'S'
,p_prompt=>'Logo Sizes'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOGO SIZES'
,p_lov=>'.'||wwv_flow_api.id(15082120707303003224)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(15059245737117863663)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15070020274411282898)
,p_name=>'P59_MARQUEE_CUST'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(17973573108142120469)
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
 p_id=>wwv_flow_api.id(15070020333796282899)
,p_name=>'P59_SCP_CUST'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(17973573108142120469)
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
 p_id=>wwv_flow_api.id(16926864930901178801)
,p_name=>'P59_PRODUCT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(14902755795285794833)
,p_item_default=>'0'
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
 p_id=>wwv_flow_api.id(17040038063245079457)
,p_name=>'P59_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(17973573108142120469)
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
 p_id=>wwv_flow_api.id(17040038987514079466)
,p_name=>'P59_USE_CASE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(17973573108142120469)
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
 p_id=>wwv_flow_api.id(17040039872959079475)
,p_name=>'P59_REFERENCEABLE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(14902755795285794833)
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
 p_id=>wwv_flow_api.id(17179697656831083583)
,p_name=>'P59_COUNTRY'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(17973573108142120469)
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
,p_lov_cascade_parent_items=>'P59_GEO'
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
 p_id=>wwv_flow_api.id(17786709008061457176)
,p_name=>'P59_IMP_PARTNER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(17973573108142120469)
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
 p_id=>wwv_flow_api.id(17786709682424457182)
,p_name=>'P59_COMPETITOR'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(17973573108142120469)
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
 p_id=>wwv_flow_api.id(17786710623817457192)
,p_name=>'P59_SORT'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(14902755795285794833)
,p_prompt=>'Sort By'
,p_source=>'UPDATED'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Name;NAME,Last Updated;UPDATED,Oldest to Newest;OLDFIRST,Newest to Oldest;NEWFIRST'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(15059245737117863663)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'U'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
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
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(14902798183379961863)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(15715420452649489925)
,p_name=>'Perform Search on Enter'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P59_SEARCH'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent.which === 13'
,p_bind_type=>'bind'
,p_bind_event_type=>'keydown'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(15715420560009489926)
,p_event_id=>wwv_flow_api.id(15715420452649489925)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(14902740283750724843)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(15034700739546199562)
,p_event_id=>wwv_flow_api.id(15715420452649489925)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(14315848749952426502)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(15715420580784489927)
,p_event_id=>wwv_flow_api.id(15715420452649489925)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CANCEL_EVENT'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(15070016616780282862)
,p_name=>'Toggle Reference Type Checkboxes'
,p_event_sequence=>224
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#reference_check_box'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$(this.triggeringElement).text() === "Check All"'
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(15070016732193282863)
,p_event_id=>wwv_flow_api.id(15070016616780282862)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(".reference_types_checkbox input[type=checkbox]").prop(''checked'',true);',
'$(this.triggeringElement).text(''Uncheck All'');'))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(15070016963400282865)
,p_event_id=>wwv_flow_api.id(15070016616780282862)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(".reference_types_checkbox input[type=checkbox]").prop(''checked'',false);',
'$(this.triggeringElement).text(''Check All'');'))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(15070017355187282869)
,p_event_id=>wwv_flow_api.id(15070016616780282862)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'#CARDS, #LOGOS, #CUSTOMERS'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(15070017624891282872)
,p_event_id=>wwv_flow_api.id(15070016616780282862)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'#CARDS, #LOGOS, #CUSTOMERS'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(15038356240941394967)
,p_name=>'Reset Search Filters'
,p_event_sequence=>234
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(14912333009899840916)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(15038356374282394968)
,p_event_id=>wwv_flow_api.id(15038356240941394967)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P59_SEARCH,P59_GEO,P59_INDUSTRY,P59_CATEGORY,P59_STATUS,P59_MAX_ROWS,P59_REFERENCE_TYPES,P59_LOGO_SIZE,P59_PRODUCT,P59_MARQUEE_CUST,P59_SCP_CUST,P59_TYPE,P59_USE_CASE,P59_REFERENCEABLE,P59_COUNTRY,P59_IMP_PARTNER,P59_COMPETITOR'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(15038357135514394976)
,p_name=>'Set Logo Sizes'
,p_event_sequence=>254
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P59_LOGO_SIZE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(15038357206153394977)
,p_event_id=>wwv_flow_api.id(15038357135514394976)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P59_LOGO_SIZE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var logo_cards$ = $("#logo_region_cards");',
'var logo_select_val = $v(''P59_LOGO_SIZE'');',
'',
'if (logo_select_val === ''S'') {',
'  logo_cards$.addClass("small-logos");',
'  logo_cards$.removeClass("medium-logos large-logos"); ',
'} else if (logo_select_val === ''M'') {',
'  logo_cards$.addClass("medium-logos");',
'  logo_cards$.removeClass("small-logos large-logos");',
'} else {',
'  logo_cards$.addClass("large-logos");',
'  logo_cards$.removeClass("small-logos medium-logos");',
'}'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1135657195481986835)
,p_name=>'Set Logo Sizes on Region Refresh'
,p_event_sequence=>264
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(14315848749952426502)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1135657205132986836)
,p_event_id=>wwv_flow_api.id(1135657195481986835)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P59_LOGO_SIZE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var logo_cards$ = $("#logo_region_cards");',
'var logo_select_val = $v(''P59_LOGO_SIZE'');',
'',
'if (logo_select_val === ''S'') {',
'  logo_cards$.addClass("small-logos");',
'  logo_cards$.removeClass("medium-logos large-logos"); ',
'} else if (logo_select_val === ''M'') {',
'  logo_cards$.addClass("medium-logos");',
'  logo_cards$.removeClass("small-logos large-logos");',
'} else {',
'  logo_cards$.addClass("large-logos");',
'  logo_cards$.removeClass("small-logos medium-logos");',
'}'))
);
wwv_flow_api.component_end;
end;
/
