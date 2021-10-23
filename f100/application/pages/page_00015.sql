prompt --application/pages/page_00015
begin
--   Manifest
--     PAGE: 00015
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
 p_id=>15
,p_user_interface_id=>wwv_flow_api.id(14582016822628385285)
,p_name=>'Search Results'
,p_alias=>'SEARCH-RESULTS'
,p_step_title=>'Search Results'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(14758150334850125803)
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>',
'ul.sSearchResultsReport span.title span.highlight {',
'  background-color: #FFEA87;',
'  text-decoration: underline',
'  }',
'ul.sSearchResultsReport span.highlight {',
'  background-color: #FFEA87;',
'  }',
'</style>'))
,p_step_template=>wwv_flow_api.id(14897195001700526770)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'ALLAN'
,p_last_upd_yyyymmddhh24miss=>'20210301102539'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(16347217912220894021)
,p_plug_name=>'Search'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--hiddenOverflow:t-Form--labelsAbove'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(14897235571213526829)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_02'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(16347219317061894026)
,p_plug_name=>'Search'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(14897235571213526829)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   c pls_integer := 0;',
'   l_detail varchar2(4000);',
'   i pls_integer;',
'   l pls_integer;',
'   l_max_rows    integer;',
'begin',
'l_max_rows := nvl(:P15_ROWS,10);',
'if :P15_SEARCH is null',
'and :P15_STATUS is null then',
'   sys.htp.p(''<p>''||',
'       apex_escape.html(''Please enter at least one search condition.'')||',
'       ''</p>'');',
'else',
'  --',
'  -- PUT YOUR QUERY HERE',
'  --',
'  for c1 in (',
'select',
'    ROW_KEY,',
'    ID,',
'    CUSTOMER_NAME,',
'    STATUS,',
'    CATEGORY,',
'    GEOGRAPHY_NAME,',
'    REFERENCABLE,',
'    NUMBER_OF_USERS,',
'    SUMMARY,',
'    WEB_SITE,',
'    PRODUCT_USES,',
'    industry,',
'    TAGS,',
'    CREATED,',
'    CREATED_BY,',
'    UPDATED,',
'    UPDATED_BY',
'from EBA_CUST_CUSTOMERS_V',
'where  (nvl(:P15_STATUS,0) = 0 or status_id = :P15_STATUS)',
'  and (   instr(upper(CUSTOMER_NAME),upper(:P15_SEARCH)) > 0 ',
'       or instr(upper(CATEGORY),upper(:P15_SEARCH)) > 0 ',
'       or instr(upper(GEOGRAPHY_NAME),upper(:P15_SEARCH)) > 0 ',
'       or instr(upper(industry),upper(:P15_SEARCH)) > 0 ',
'       or instr(upper(SUMMARY),upper(:P15_SEARCH)) > 0',
'       or instr(upper(PRODUCT_USES),upper(:P15_SEARCH)) > 0',
'       or instr(upper(WEB_SITE),upper(:P15_SEARCH)) > 0',
'       or instr(upper(tags),upper(:P15_SEARCH)) > 0',
'       or instr(upper(status),upper(:P15_SEARCH)) > 0',
'       or :P15_SEARCH is null',
'      )',
'  ) ',
'  loop',
'    c := c + 1;',
'    if c = 1 then',
'       sys.htp.p(''<ul class="sSearchResultsReport">'');',
'    end if;',
'    sys.htp.p(''<li>'');',
'    sys.htp.prn(''<span class="title">'');',
'    --',
'    -- DEFINE DRILL DOWN LINK HERE',
'    --',
'    sys.htp.prn(''<a href="''|| apex_util.prepare_url(''f?p=''||:APP_ID||'':50:''||:APP_SESSION||'':::50:P50_ID:''||c1.id)||''">'' );',
'',
'    --',
'    -- ASSIGN PRIMAY ATTRIBUTE HERE, REFERENCE QUERY COLUMN',
'    --',
'    l_detail := c1.CUSTOMER_NAME;',
'    --',
'    i := instr(upper(l_detail),upper(:P15_SEARCH));',
'    if  i > 0 then',
'       l := length(:P15_SEARCH);',
'       l_detail := apex_escape.html(substr(l_detail,1,i-1))||',
'          ''<span class="highlight">''||',
'          apex_escape.html(substr(l_detail,i,l))||''</span>''||',
'          apex_escape.html(substr(l_detail,i+l));',
'    else',
'        l_detail := apex_escape.html(l_detail);',
'    end if;',
'    sys.htp.prn(l_detail);                ',
'    sys.htp.prn(''</a></span><br>'');',
'    --',
'    --',
'    sys.htp.prn(''<span class="description">'');',
'    --',
'    -- ASSIGN SECONDARY ATTRIBUTE HERE, REFERENCE QUERY COLUMN',
'    -- ',
'    l_detail := ''Category: '' || c1.CATEGORY;',
'    --',
'    i := instr(upper(l_detail),upper(:P15_SEARCH));',
'    if  i > 0 then',
'       l := length(:P15_SEARCH);',
'       l_detail := apex_escape.html(substr(l_detail,1,i-1))||',
'          ''<span class="highlight">''||',
'          apex_escape.html(substr(l_detail,i,l))||''</span>''||',
'          apex_escape.html(substr(l_detail,i+l));',
'    else',
'        l_detail := apex_escape.html(l_detail);',
'    end if;',
'    sys.htp.prn(l_detail);',
'    sys.htp.prn(''</span>'');',
'    --',
'    -- DEFINE ADDITIONAL QUERY COLUMNS FOR SEARCH BELOW',
'    --',
'    sys.htp.p(''<br /><span class="type">'');',
'    sys.htp.prn(''Geography: '');',
'    sys.htp.prn(apex_escape.html(c1.GEOGRAPHY_NAME));',
'    sys.htp.prn(''</span>'');',
'    sys.htp.p(''<br /><span class="type">'');',
'    sys.htp.prn(''Industry: '');',
'    sys.htp.prn(apex_escape.html(c1.industry));',
'    sys.htp.prn(''</span>'');',
'    --',
'    sys.htp.p(''<br /><span class="type">'');',
'    sys.htp.prn(''Status: '');',
'    sys.htp.prn(apex_escape.html(c1.status));',
'    sys.htp.prn(''</span>'');',
'    --',
'    if c1.SUMMARY is not null then',
'    sys.htp.p(''<br /><span class="type">'');',
'    sys.htp.prn(''Summary: '');',
'    sys.htp.prn(apex_escape.html(substr(c1.SUMMARY,1,300)));',
'    sys.htp.prn(''</span>'');',
'    end if;',
'    --',
'    if c1.PRODUCT_USES is not null then',
'    sys.htp.p(''<br /><span class="type">'');',
'    sys.htp.prn(''Products: '');',
'    sys.htp.prn(apex_escape.html(c1.PRODUCT_USES));',
'    sys.htp.prn(''</span>'');',
'    end if;',
'    ',
'    --',
'    if c1.tags is not null then',
'    sys.htp.p(''<br /><span class="type">'');',
'    sys.htp.prn(''Tags: '');',
'    sys.htp.prn(apex_escape.html(c1.tags));',
'    sys.htp.prn(''</span>'');',
'    end if;',
'    --',
'    if c1.WEB_SITE is not null then',
'    sys.htp.p(''<br /><span class="type">'');',
'    sys.htp.prn(''Web Site: '');',
'    sys.htp.prn(apex_escape.html(c1.WEB_SITE));',
'    sys.htp.prn(''</span>'');',
'    end if;',
'    --',
'    sys.htp.prn(''</li>'');',
'    if c = l_max_rows then',
'       exit;',
'    end if;',
'',
'  end loop;',
'  if c > 0 then ',
'    sys.htp.p(''</ul>'');',
'    sys.htp.p(''<span class="infoTextRegion"><p>''||c||'' customer(s) found.</p></span>'');',
'  else ',
'    sys.htp.p(''<span class="infoTextRegion"><p>No customers found.</p></span>'');',
'  end if;',
'end if;',
'end;',
'',
'declare',
'   c pls_integer := 0;',
'   l_detail varchar2(4000);',
'   i pls_integer;',
'   l pls_integer;',
'   l_max_rows    integer;',
'begin',
'l_max_rows := nvl(:P15_ROWS,100);',
'if :P15_SEARCH is not null then',
'  --',
'  -- PUT YOUR QUERY HERE',
'  --',
'  for c1 in (',
'select ',
'"ID",',
'customer_id,',
'"NAME",',
'"TITLE",',
'"PHONE",',
'"EMAIL",',
'tags,',
'"COMPANY",',
'(select contact_type from eba_cust_contact_types t where t.id = a.contact_type_id) "CONTACT_TYPE",',
'"CITY",',
'"STATE",',
'"COUNTRY",',
'A."CREATED",',
'A."CREATED_BY",',
'A."UPDATED",',
'A."UPDATED_BY",',
'(select customer_name from eba_cust_customers c where c.id = a.customer_id) customer_name',
' from   "EBA_CUST_CONTACTS" A  ',
'where instr(upper(NAME),upper(:P15_SEARCH)) > 0 ',
'       or instr(upper(TITLE),upper(:P15_SEARCH)) > 0 ',
'       or instr(upper(PHONE),upper(:P15_SEARCH)) > 0',
'       or instr(upper(EMAIL),upper(:P15_SEARCH)) > 0',
'       or instr(upper(tags),upper(:P15_SEARCH)) > 0',
'       or instr(upper(tags),upper(:P15_SEARCH)) > 0',
'       or instr(upper(COMPANY),upper(:P15_SEARCH)) > 0',
'       or :P15_SEARCH is null',
'      )',
'',
'  loop',
'    c := c + 1;',
'    if c = 1 then',
'       sys.htp.p(''<ul class="sSearchResultsReport">'');',
'    end if;',
'    sys.htp.p(''<li>'');',
'    sys.htp.prn(''<span class="title">'');',
'    --',
'    -- DEFINE DRILL DOWN LINK HERE',
'    --',
'    sys.htp.prn(''<a href="''|| apex_util.prepare_url(''f?p=''||:APP_ID||'':50:''||:APP_SESSION||'':::50:P50_ID:''||c1.id)||''">'' );',
'',
'    --',
'    -- ASSIGN PRIMAY ATTRIBUTE HERE, REFERENCE QUERY COLUMN',
'    --',
'    l_detail := c1.NAME;',
'    --',
'    i := instr(upper(l_detail),upper(:P15_SEARCH));',
'    if  i > 0 then',
'       l := length(:P15_SEARCH);',
'       l_detail := apex_escape.html(substr(l_detail,1,i-1))||',
'          ''<span class="highlight">''||',
'          apex_escape.html(substr(l_detail,i,l))||''</span>''||',
'          apex_escape.html(substr(l_detail,i+l));',
'    else',
'        l_detail := apex_escape.html(l_detail);',
'    end if;',
'    sys.htp.prn(l_detail);                ',
'    sys.htp.prn(''</a></span>'');',
'    --',
'    --',
'    sys.htp.prn(''<span class="description">'');',
'    --',
'    -- ASSIGN SECONDARY ATTRIBUTE HERE, REFERENCE QUERY COLUMN',
'    -- ',
'    l_detail := c1.COMPANY;',
'    --',
'    i := instr(upper(l_detail),upper(:P15_SEARCH));',
'    if  i > 0 then',
'       l := length(:P15_SEARCH);',
'       l_detail := apex_escape.html(substr(l_detail,1,i-1))||',
'          ''<span class="highlight">''||',
'          apex_escape.html(substr(l_detail,i,l))||''</span>''||',
'          apex_escape.html(substr(l_detail,i+l));',
'    else',
'        l_detail := apex_escape.html(l_detail);',
'    end if;',
'    sys.htp.prn(l_detail);',
'    sys.htp.prn(''</span>'');',
'    --',
'    -- DEFINE ADDITIONAL QUERY COLUMNS FOR SEARCH BELOW',
'    --',
'    sys.htp.p(''<span class="type">'');',
'    sys.htp.prn(''Email: '');',
'    sys.htp.prn(apex_escape.html(c1.email));',
'    sys.htp.prn(''</span>'');',
'    --',
'    sys.htp.p(''<br /><span class="type">'');',
'    sys.htp.prn(''Title: '');',
'    sys.htp.prn(apex_escape.html(c1.TITLE));',
'    sys.htp.prn(''</span>'');',
'    --',
'    if c1.phone is not null then',
'    sys.htp.p(''<br /><span class="type">'');',
'    sys.htp.prn(''Phone: '');',
'    sys.htp.prn(apex_escape.html(c1.phone));',
'    sys.htp.prn(''</span>'');',
'    end if;',
'    --',
'    if c1.tags is not null then',
'    sys.htp.p(''<br /><span class="type">'');',
'    sys.htp.prn(''Tags: '');',
'    sys.htp.prn(apex_escape.html(c1.tags));',
'    sys.htp.prn(''</span>'');',
'    end if;',
'    --',
'    if c1.contact_type is not null then',
'    sys.htp.p(''<br /><span class="type">'');',
'    sys.htp.prn(''Contact Type: '');',
'    sys.htp.prn(apex_escape.html(c1.contact_type));',
'    sys.htp.prn(''</span>'');',
'    end if;',
'    --',
'    sys.htp.prn(''</li>'');',
'    if c = l_max_rows then',
'       exit;',
'    end if;',
'',
'  end loop;',
'  if c > 0 then ',
'    sys.htp.p(''</ul>'');',
'    sys.htp.p(''<span class="infoTextRegion"><p>''||c||'' contact(s) found.</p></span>'');',
'  else ',
'    sys.htp.p(''<span class="infoTextRegion"><p>No contacts found.</p></span>'');',
'  end if;',
'end if;',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(16347219522518894027)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(14897238104700526831)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(17878114474105061390)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(14897253604799526876)
,p_translate_title=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(16347218308413894023)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(16347219522518894027)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(14897252845630526874)
,p_button_image_alt=>'Reset'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.:2,1,15::'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_row=>'Y'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(16347218132411894021)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(16347219522518894027)
,p_button_name=>'SEARCH'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(14897253374800526875)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'REGION_TEMPLATE_NEXT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(16347220133645894031)
,p_branch_action=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_comment=>'Created 14-DEC-2011 09:16 by SHAKEEB'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16347218533970894023)
,p_name=>'P15_ROWS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(16347217912220894021)
,p_item_default=>'100'
,p_prompt=>'Results'
,p_source=>'100'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ROWS'
,p_lov=>'.'||wwv_flow_api.id(16347220220312894033)||'.'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'ABOVE'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(14897252431002526870)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'SUBMIT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16347218910801894025)
,p_name=>'P15_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(16347217912220894021)
,p_prompt=>'Search'
,p_placeholder=>'Search'
,p_source=>'&P100_SEARCH.'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'ABOVE'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(14897252300475526868)
,p_item_icon_css_classes=>'fa-search'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16347219131359894025)
,p_name=>'P15_STATUS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(16347217912220894021)
,p_prompt=>'Status'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'STATUSES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select status d, id r',
'from   EBA_CUST_STATUS',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All Status Codes -'
,p_lov_null_value=>'0'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_label_alignment=>'ABOVE'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(14897252431002526870)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'SUBMIT'
,p_attribute_03=>'Y'
);
wwv_flow_api.component_end;
end;
/
