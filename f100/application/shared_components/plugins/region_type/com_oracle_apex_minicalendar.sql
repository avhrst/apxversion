prompt --application/shared_components/plugins/region_type/com_oracle_apex_minicalendar
begin
--   Manifest
--     PLUGIN: COM.ORACLE.APEX.MINICALENDAR
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>4200481731648079
,p_default_application_id=>100
,p_default_id_offset=>39500229701756973
,p_default_owner=>'VCONTROL'
);
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(14912747036934021273)
,p_plugin_type=>'REGION TYPE'
,p_name=>'COM.ORACLE.APEX.MINICALENDAR'
,p_display_name=>'Mini Calendar'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','COM.ORACLE.APEX.MINICALENDAR'),'')
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'procedure render_mini_calendar( p_region in apex_plugin.t_region ) is',
'    c_date_col  constant varchar2(255) := p_region.attribute_01;',
'    c_label_col constant varchar2(255) := p_region.attribute_02;',
'',
'    l_date_col_no  pls_integer;',
'    l_label_col_no pls_integer;',
'',
'    c_collection constant varchar2(255) := ''APEX$MINICALENDAR$''||rawtohex(sys_guid());',
'    l_column_value_list    apex_plugin_util.t_column_value_list2;',
'',
'    l_region_source        varchar2(32767) := p_region.source;',
'',
'    --',
'    l_date  timestamp with local time zone;',
'    l_label varchar2(2000);',
'    l_found boolean;',
'    l_count number;',
'',
'    cursor dt_csr is',
'        select c001 label, d001 the_date',
'        from apex_collections',
'        where collection_name = c_collection',
'        order by d001 asc;',
'    dt_rec dt_csr%ROWTYPE;',
'',
'    -- Variables for knowing what to display.',
'    l_startdate  date;',
'    l_enddate    date;',
'    l_daycount   number;',
'    l_month      varchar2(6);',
'',
'    l_class      varchar2(512) := '''';',
'    l_disp       varchar2(255)  := '''';',
'    l_id         varchar2(512) := p_region.static_id;',
'begin',
'    -- get the data to be displayed',
'    l_column_value_list := apex_plugin_util.get_data2 (',
'                               p_sql_statement  => l_region_source,',
'                               p_min_columns    => 2,',
'                               p_max_columns    => null,',
'                               p_component_name => p_region.name,',
'                               p_max_rows       => null );',
'',
'    -- Get the actual column number for the fields we want.',
'    l_date_col_no := apex_plugin_util.get_column_no (',
'                        p_attribute_label   => ''Date column'',',
'                        p_column_alias      => c_date_col,',
'                        p_column_value_list => l_column_value_list,',
'                        p_is_required       => true,',
'                        p_data_type         => null -- might be date, timestamp, etc.',
'                    );',
'',
'    l_label_col_no := apex_plugin_util.get_column_no (',
'                        p_attribute_label   => ''Label column'',',
'                        p_column_alias      => c_label_col,',
'                        p_column_value_list => l_column_value_list,',
'                        p_is_required       => true,',
'                        p_data_type         => apex_plugin_util.c_data_type_varchar2',
'                    );',
'',
'    apex_collection.create_or_truncate_collection( p_collection_name => c_collection );',
'    -- Loop through the data and shove it into the collection for ease of access.',
'    for l_row_num in 1..l_column_value_list(1).value_list.count loop',
'        l_found := true;',
'        if l_column_value_list(l_date_col_no).value_list(l_row_num).date_value is not null then',
'            l_date := l_column_value_list(l_date_col_no).value_list(l_row_num).date_value;',
'        elsif l_column_value_list(l_date_col_no).value_list(l_row_num).timestamp_value is not null then',
'            l_date := l_column_value_list(l_date_col_no).value_list(l_row_num).timestamp_value;',
'        elsif l_column_value_list(l_date_col_no).value_list(l_row_num).timestamp_tz_value is not null then',
'            l_date := l_column_value_list(l_date_col_no).value_list(l_row_num).timestamp_tz_value;',
'        elsif l_column_value_list(l_date_col_no).value_list(l_row_num).timestamp_ltz_value is not null then',
'            l_date := l_column_value_list(l_date_col_no).value_list(l_row_num).timestamp_ltz_value;',
'        else',
'            -- Couldn''t get a usable date value; ignore this row.',
'            l_found := false;',
'        end if;',
'        if l_found then',
'            select count(*) into l_count',
'            from apex_collections',
'            where collection_name = c_collection',
'                and d001 = trunc(l_date);',
'',
'            if l_count = 0 then',
'                l_label := apex_plugin_util.escape(',
'                            apex_plugin_util.get_value_as_varchar2(',
'                                p_data_type => l_column_value_list(l_label_col_no).data_type,',
'                                p_value     => l_column_value_list(l_label_col_no).value_list(l_row_num) ),',
'                            p_region.escape_output );',
'                apex_collection.add_member(',
'                    p_collection_name => c_collection,',
'                    p_c001            => l_label,',
'                    p_d001            => trunc(l_date)',
'                );',
'            end if;',
'        end if;',
'    end loop;',
'',
'    open dt_csr;',
'    fetch dt_csr into dt_rec;',
'    if dt_csr%FOUND then',
'        l_date  := dt_rec.the_date;',
'        l_label := dt_rec.label;',
'    else',
'        l_date  := trunc(localtimestamp);',
'        l_label := ''Today'';',
'    end if;',
'',
'    -- Print the calendar header.',
'    sys.htp.prn(''<div class="a-MiniCal">'');',
'    sys.htp.prn(''<h3 class="a-MiniCal-title">''||to_char(l_date, ''Month'')||'' ''||to_char(l_date,''YYYY'')||''</h3>'');',
'    sys.htp.prn(''<table class="a-MiniCal-month" summary="Calendar of ''||to_char(l_date, ''Month'')||'' ''||to_char(l_date,''YYYY'')||''">'');',
'    sys.htp.prn(''<thead>'');',
'    sys.htp.prn(''<tr>'');',
'    sys.htp.prn(''<th class="a-MiniCal-dayOfWeek" scope="col" id="''||l_id||''_SUN" title="Sunday">Su</th>'');',
'    sys.htp.prn(''<th class="a-MiniCal-dayOfWeek" scope="col" id="''||l_id||''_MON" title="Monday">Mo</th>'');',
'    sys.htp.prn(''<th class="a-MiniCal-dayOfWeek" scope="col" id="''||l_id||''_TUE" title="Tuesday">Tu</th>'');',
'    sys.htp.prn(''<th class="a-MiniCal-dayOfWeek" scope="col" id="''||l_id||''_WED" title="Wednesday">We</th>'');',
'    sys.htp.prn(''<th class="a-MiniCal-dayOfWeek" scope="col" id="''||l_id||''_THU" title="Thursday">Th</th>'');',
'    sys.htp.prn(''<th class="a-MiniCal-dayOfWeek" scope="col" id="''||l_id||''_FRI" title="Friday">Fr</th>'');',
'    sys.htp.prn(''<th class="a-MiniCal-dayOfWeek" scope="col" id="''||l_id||''_SAT" title="Saturday">Sa</th>'');',
'    sys.htp.prn(''</tr>'');',
'    sys.htp.prn(''</thead>'');',
'    -- Print the calendar body.',
'    sys.htp.prn(''<tbody>'');',
'    -- Do some quick manipulation to get the day of the week that the first of the month',
'     --  lands on, and then shift our starting date to the first day of that week.',
'    l_startdate := trunc(l_date,''MM'') - to_char(trunc(l_date,''MM''),''D'') + 1;',
'    l_enddate := last_day(l_date) + 7-to_char(last_day(l_date),''D'');',
'    l_month := to_char(l_date,''YYYYMM'');',
'',
'    for l_daycount in 0..(l_enddate - l_startdate) loop',
'        l_class := '''';',
'        l_disp := apex_escape.html(to_char(l_startdate+l_daycount,''fmDD''));',
'        -- If the day isn''t part of the month being displayed, grey it out.',
'        if to_char(l_startdate+l_daycount,''YYYYMM'') <> l_month then',
'            l_class := ''is-null'';',
'            l_disp := ''<span class="a-MiniCal-date">''||l_disp||''</span>'';',
'        else',
'            if to_char(l_startdate+l_daycount,''D'') in (''1'',''7'') then',
'                l_class := l_class || ''is-weekend '';',
'                l_disp := ''<span class="a-MiniCal-date">''||l_disp||''</span>'';',
'            end if;',
'            if l_month = to_char(localtimestamp,''YYYYMM'')',
'                    and l_startdate+l_daycount = current_date then',
'                l_class := l_class || ''is-today '';',
'                l_disp := ''<span class="a-MiniCal-date">''||l_disp||''</span>'';',
'            end if;',
'            if to_char(l_startdate+l_daycount,''YYYYMMDD'')',
'                    = to_char(l_date,''YYYYMMDD'') then',
'                l_class := l_class || ''is-active '';',
'                l_disp := ''<span class="a-MiniCal-date" title="''|| apex_escape.html(l_label) ||''">''||l_disp||''</span>'';',
'            end if;',
'        end if;',
'        if to_char(l_startdate+l_daycount,''D'') = ''1'' then',
'            sys.htp.prn(''<tr>'');',
'        end if;',
'        sys.htp.prn(''<td class="a-MiniCal-day ''||l_class||''" headers="''||l_id||''_''||to_char(l_startdate+l_daycount,''DY'')||''">''||l_disp||''</td>'');',
'        if to_char(l_startdate+l_daycount,''D'') = ''7'' then',
'            sys.htp.prn(''</tr>'');',
'        end if;',
'        if to_char(l_startdate+l_daycount,''YYYYMMDD'') = to_char(l_date,''YYYYMMDD'') then',
'            fetch dt_csr into dt_rec;',
'            if dt_csr%FOUND then',
'                l_date  := dt_rec.the_date;',
'                l_label := dt_rec.label;',
'            end if;',
'        end if;',
'    end loop;',
'    close dt_csr;',
'',
'    -- Clean up after ourselves.',
'    apex_collection.delete_collection( p_collection_name => c_collection );',
'',
'    sys.htp.prn(''</tbody>'');',
'    sys.htp.prn(''</table>'');',
'    sys.htp.prn(''</div>'');',
'end render_mini_calendar;',
'',
'function render ( p_region in apex_plugin.t_region,',
'    p_plugin in apex_plugin.t_plugin, p_is_printer_friendly in boolean )',
'    return apex_plugin.t_region_render_result is',
'begin',
'    -- CSS for the Gantt Chart',
'    apex_css.add_file (',
'        p_name => ''com_oracle_apex_minicalendar'',',
'        p_directory => p_plugin.file_prefix );',
'',
'    render_mini_calendar( p_region );',
'    return null;',
'end;'))
,p_api_version=>1
,p_render_function=>'render'
,p_standard_attributes=>'SOURCE_SQL:ESCAPE_OUTPUT'
,p_substitute_attributes=>true
,p_reference_id=>1435018733936024259
,p_subscribe_plugin_settings=>true
,p_help_text=>'This region plug-in displays a small calendar with the specified date highlighted.'
,p_version_identifier=>'5.0.1'
,p_files_version=>2
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(202128866311634461)
,p_plugin_id=>wwv_flow_api.id(14912747036934021273)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Date Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_column_data_types=>'DATE:TIMESTAMP:TIMESTAMP_TZ:TIMESTAMP_LTZ'
,p_is_translatable=>false
,p_help_text=>'Select the column from the region SQL Query which holds the single date value for the calendar.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(202129239475634469)
,p_plugin_id=>wwv_flow_api.id(14912747036934021273)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Label Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_help_text=>'Select the column from the region SQL Query which holds the label for the calendar.'
);
wwv_flow_api.create_plugin_std_attribute(
 p_id=>wwv_flow_api.id(202130478938634503)
,p_plugin_id=>wwv_flow_api.id(14912747036934021273)
,p_name=>'SOURCE_SQL'
,p_sql_min_column_count=>1
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'The query must return at least two columns--a date and its label (other columns will be ignored). The calendar will display for the earliest date returned, highlighting all dates returned within that month.',
'',
'<pre>',
'select date_value, label_value',
'from ...',
'</pre>'))
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
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '7461626C652E617065782D6D696E692D63616C656E6461727B77696474683A313030257D0D0A7461626C652E617065782D6D696E692D63616C656E6461722063617074696F6E7B6261636B67726F756E642D636F6C6F723A236563663166393B6261636B';
wwv_flow_api.g_varchar2_table(2) := '67726F756E642D696D6167653A2D7765626B69742D6772616469656E74286C696E6561722C203530252030252C2035302520313030252C20636F6C6F722D73746F702830252C2023663266356639292C20636F6C6F722D73746F7028313030252C202365';
wwv_flow_api.g_varchar2_table(3) := '636631663929293B6261636B67726F756E642D696D6167653A2D7765626B69742D6C696E6561722D6772616469656E7428236632663566392C23656366316639293B6261636B67726F756E642D696D6167653A2D6D6F7A2D6C696E6561722D6772616469';
wwv_flow_api.g_varchar2_table(4) := '656E7428236632663566392C23656366316639293B6261636B67726F756E642D696D6167653A6C696E6561722D6772616469656E7428236632663566392C23656366316639293B666F6E742D73697A653A313270783B666F6E742D7765696768743A626F';
wwv_flow_api.g_varchar2_table(5) := '6C643B636F6C6F723A233430343034303B636F6C6F723A7267626128302C302C302C302E3735293B746578742D736861646F773A302031707820302072676261283235352C3235352C3235352C302E3735293B70616464696E673A387078203870782030';
wwv_flow_api.g_varchar2_table(6) := '203870783B746578742D616C69676E3A63656E7465723B2D7765626B69742D626F782D736861646F773A302031707820302072676261283235352C3235352C3235352C302E36352920696E7365743B2D6D6F7A2D626F782D736861646F773A3020317078';
wwv_flow_api.g_varchar2_table(7) := '20302072676261283235352C3235352C3235352C302E36352920696E7365743B626F782D736861646F773A302031707820302072676261283235352C3235352C3235352C302E36352920696E7365747D0D0A7461626C652E617065782D6D696E692D6361';
wwv_flow_api.g_varchar2_table(8) := '6C656E6461722074686561642074687B6261636B67726F756E642D636F6C6F723A236537656466393B6261636B67726F756E642D696D6167653A2D7765626B69742D6772616469656E74286C696E6561722C203530252030252C2035302520313030252C';
wwv_flow_api.g_varchar2_table(9) := '20636F6C6F722D73746F702830252C2023656366316639292C20636F6C6F722D73746F7028313030252C202365376564663929293B6261636B67726F756E642D696D6167653A2D7765626B69742D6C696E6561722D6772616469656E7428236563663166';
wwv_flow_api.g_varchar2_table(10) := '392C23653765646639293B6261636B67726F756E642D696D6167653A2D6D6F7A2D6C696E6561722D6772616469656E7428236563663166392C23653765646639293B6261636B67726F756E642D696D6167653A6C696E6561722D6772616469656E742823';
wwv_flow_api.g_varchar2_table(11) := '6563663166392C23653765646639293B666F6E742D73697A653A313070783B666F6E742D7765696768743A626F6C643B636F6C6F723A233630363036303B636F6C6F723A7267626128302C302C302C302E35293B70616464696E673A3470783B74657874';
wwv_flow_api.g_varchar2_table(12) := '2D736861646F773A302031707820302072676261283235352C3235352C3235352C302E35293B626F726465722D626F74746F6D3A31707820736F6C696420236230626463637D0D0A7461626C652E617065782D6D696E692D63616C656E6461722074626F';
wwv_flow_api.g_varchar2_table(13) := '64792074722074647B77696474683A3134253B6261636B67726F756E643A6E6F6E6520236661666166613B746578742D616C69676E3A63656E7465723B626F726465722D626F74746F6D3A31707820736F6C696420236538653865383B6C696E652D6865';
wwv_flow_api.g_varchar2_table(14) := '696768743A323470783B636F6C6F723A233430343034303B666F6E742D73697A653A313170783B666F6E742D7765696768743A6E6F726D616C3B706F736974696F6E3A72656C61746976657D0D0A7461626C652E617065782D6D696E692D63616C656E64';
wwv_flow_api.g_varchar2_table(15) := '61722074626F64792074722074643A6C6173742D6368696C647B626F726465722D72696768743A6E6F6E657D0D0A7461626C652E617065782D6D696E692D63616C656E6461722074626F64792074722074642E696E6163746976657B6261636B67726F75';
wwv_flow_api.g_varchar2_table(16) := '6E642D636F6C6F723A234630463046303B636F6C6F723A234330433043303B666F6E742D7765696768743A6E6F726D616C7D0D0A7461626C652E617065782D6D696E692D63616C656E6461722074626F64792074722074642E7765656B656E647B636F6C';
wwv_flow_api.g_varchar2_table(17) := '6F723A233730373037303B6261636B67726F756E642D636F6C6F723A234631463446397D0D0A7461626C652E617065782D6D696E692D63616C656E6461722074626F64792074722074642E746F6461797B666F6E742D7765696768743A626F6C647D0D0A';
wwv_flow_api.g_varchar2_table(18) := '7461626C652E617065782D6D696E692D63616C656E6461722074626F64792074722074642E616374697665207370616E7B646973706C61793A626C6F636B3B6D617267696E3A3370783B666F6E742D73697A653A313170783B6C696E652D686569676874';
wwv_flow_api.g_varchar2_table(19) := '3A313670783B6261636B67726F756E642D636F6C6F723A234645453439433B626F726465722D7261646975733A3370783B626F726465723A31707820736F6C696420236363623336383B666F6E742D7765696768743A626F6C643B2D7765626B69742D62';
wwv_flow_api.g_varchar2_table(20) := '6F782D736861646F773A302031707820302072676261283235352C3235352C3235352C302E36352920696E7365743B2D6D6F7A2D626F782D736861646F773A302031707820302072676261283235352C3235352C3235352C302E36352920696E7365743B';
wwv_flow_api.g_varchar2_table(21) := '626F782D736861646F773A302031707820302072676261283235352C3235352C3235352C302E36352920696E7365747D0D0A7461626C652E617065782D6D696E692D63616C656E6461722074626F64792074723A6C6173742D6368696C642074647B626F';
wwv_flow_api.g_varchar2_table(22) := '726465722D626F74746F6D3A6E6F6E657D0D0A';
null;
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
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(202131157285634509)
,p_plugin_id=>wwv_flow_api.id(14912747036934021273)
,p_file_name=>'com_oracle_apex_minicalendar.css'
,p_mime_type=>'text/css'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
wwv_flow_api.component_end;
end;
/
