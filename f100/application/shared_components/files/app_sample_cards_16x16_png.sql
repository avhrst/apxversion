prompt --application/shared_components/files/app_sample_cards_16x16_png
begin
--   Manifest
--     APP STATIC FILES: 100
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>4200481731648079
,p_default_application_id=>100
,p_default_id_offset=>5389331382356895884
,p_default_owner=>'VCONTROL'
);
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF610000000970485973000003B0000003B00127C40FAD0000001974455874536F667477617265007777772E696E6B73636170652E6F72679BEE3C1A000000D04944415438';
wwv_flow_api.g_varchar2_table(2) := '8DED93BD0A827014C57F9AA59666494410B5447BF4064DD153F61C4DBD406B43041544D0F7A765116A5B20FD85C0A5A1331ECEFD5DCE852B35BAE3801892E30CFF06401199AD924CBB6E87BCDE784F7FE97F07186D1C1E5E383CDBDF80F4475658C1D455';
wwv_flow_api.g_varchar2_table(3) := '9A159B926550B40C7CCF27258BDB46DE60B273D91E2FAC0E675AB502393D29CC092B2408089E2EF974927C4665E93C5022560901CD72964EDD667EBA0350B1349E7EC0E078FB0E00A0C812A69AA06A69688A1415130316A73BD3830BC0707D7D7B2249FF';
wwv_flow_api.g_varchar2_table(4) := '5FE005CEA43CD8008C6FEF0000000049454E44AE426082';
wwv_flow_api.create_app_static_file(
 p_id=>wwv_flow_api.id(799723855451922085)
,p_file_name=>'app-sample-cards-16x16.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
wwv_flow_api.component_end;
end;
/
