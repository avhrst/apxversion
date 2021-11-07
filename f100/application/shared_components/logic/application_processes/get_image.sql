prompt --application/shared_components/logic/application_processes/get_image
begin
--   Manifest
--     APPLICATION PROCESS: GET_IMAGE
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>4200481731648079
,p_default_application_id=>100
,p_default_id_offset=>39500229701756973
,p_default_owner=>'VCONTROL'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(15066199846043315365)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_IMAGE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'   l_image     blob;',
'   l_name      varchar2(255);',
'   l_mime_type varchar2(255);',
'   l_length    number;',
'',
'begin',
'',
'   select logo_blob,',
'        logo_name,',
'        logo_mimetype,',
'        dbms_lob.getlength(logo_blob)',
'   into l_image,',
'      l_name,',
'      l_mime_type,',
'      l_length',
'',
'   from eba_cust_customers',
'   where id = :GET_ID;',
'   ',
'   sys.htp.init();',
'   ',
'   sys.owa_util.mime_header(',
'      nvl(l_mime_type, ''application/octet''),',
'      false',
'   );',
'',
'   sys.htp.p(''Cache-Control: max-age=36000'');',
'   sys.htp.p(''Content-Length: '' || l_length);',
'   sys.htp.p(''Content-Disposition: inline; filename="'' || apex_escape.html(l_name) || ''"; filename*=UTF-8'''''''''' || apex_escape.html(l_name));',
'   ',
'   sys.owa_util.http_header_close;',
'   ',
'   sys.wpg_docload.download_file(l_image);',
'   ',
'   apex_application.stop_apex_engine;',
'   ',
'end;'))
,p_process_clob_language=>'PLSQL'
);
wwv_flow_api.component_end;
end;
/
