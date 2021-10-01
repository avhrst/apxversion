prompt --application/deployment/install/install_eba_demo_card_pkg
begin
--   Manifest
--     INSTALL: INSTALL-eba_demo_card_pkg
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>4200481731648079
,p_default_application_id=>100
,p_default_id_offset=>5389331382356895884
,p_default_owner=>'VCONTROL'
);
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(711940847095128287)
,p_install_id=>wwv_flow_api.id(5394817275311454157)
,p_name=>'eba_demo_card_pkg'
,p_sequence=>200
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace package eba_demo_card_pkg as',
'',
'    function get_video_duration (',
'        p_video_id in varchar2 ) return varchar2;',
'',
'    procedure get_profile_image (',
'        p_empno in number);',
'',
'end eba_demo_card_pkg;',
'/',
'',
'create or replace package body eba_demo_card_pkg as',
'',
'    --',
'    -- Get YouTube video duration using REST Data Source',
'    -- ',
'    function get_video_duration (',
'            p_video_id in varchar2 ) return varchar2',
'    is',
'        l_columns    apex_exec.t_columns;',
'        l_parameters apex_exec.t_parameters;',
'        l_context    apex_exec.t_context;',
'    ',
'        type t_column_position is table of pls_integer index by varchar2(32767);',
'        l_column_position t_column_position;',
'        l_hour     number;',
'        l_duration varchar2(255);',
'    begin',
'    ',
'        -- specify columns to select from the REST Data Source',
'        apex_exec.add_column( ',
'            p_columns       => l_columns,',
'            p_column_name   => ''DURATION'' );',
'',
'        apex_exec.add_parameter (',
'            p_parameters => l_parameters,',
'            p_name       => ''id'',',
'            p_value      => p_video_id );',
'    ',
'        -- invoke REST Data Source and select data',
'        l_context := apex_exec.open_rest_source_query(',
'            p_static_id  => ''APEX_Youtube_Videos'',',
'            p_parameters => l_parameters,',
'            p_columns    => l_columns );',
'    ',
'        -- now get result set positions for the selected columns',
'        l_column_position( ''DURATION'' ) := apex_exec.get_column_position( l_context, ''DURATION'' );',
'       ',
'        -- loop through result set and print out contents',
'        while apex_exec.next_row( l_context ) loop',
'            l_duration := apex_exec.get_varchar2( l_context, l_column_position( ''DURATION'' ) );',
'        end loop;',
'        ',
'        -- finally: release all resources',
'        apex_exec.close( l_context );',
'        ',
'        -- convert iso-8601 time format to readable format',
'        l_hour := extract (hour from to_dsinterval( l_duration ));',
'        l_duration := case when l_hour > 0 then to_char( l_hour, ''09'' )||'':'' end ||',
'                      to_char( extract (minute from to_dsinterval( l_duration )), ''09'' )||'':''||',
'                      to_char( extract (second from to_dsinterval( l_duration )), ''09'' );',
'    ',
'        return l_duration;',
'    exception',
'        when others then',
'            -- IMPORTANT: also release all resources, when an exception occcurs!',
'            apex_exec.close( l_context );',
'            raise;',
'    end get_video_duration;',
'',
'    --',
'    -- Get employee profile BLOB image and display inline',
'    --',
'    procedure get_profile_image (',
'        p_empno in number)',
'    is',
'    begin',
'        for l_emp in (',
'            select *',
'            from eba_demo_card_emp',
'            where empno = p_empno )',
'        loop',
'            --',
'            sys.htp.init;',
'            sys.owa_util.mime_header( l_emp.mimetype, FALSE );',
'            sys.htp.p( ''Content-length: '' || sys.dbms_lob.getlength( l_emp.profile_image ) );',
'            sys.htp.p( ''Content-Disposition: inline; filename="'' || l_emp.filename || ''"'' );',
'            sys.htp.p( ''Cache-Control: max-age=3600'' );  -- tell the browser to cache for one hour, adjust as necessary',
'            sys.owa_util.http_header_close;',
'            sys.wpg_docload.download_file( l_emp.profile_image );',
'         ',
'            apex_application.stop_apex_engine;',
'        end loop;',
'    end get_profile_image;',
'',
'end eba_demo_card_pkg;',
'/',
''))
);
wwv_flow_api.component_end;
end;
/
