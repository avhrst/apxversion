prompt --application/shared_components/navigation/lists/customer_actions
begin
--   Manifest
--     LIST: Customer Actions
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>4200481731648079
,p_default_application_id=>100
,p_default_id_offset=>39500229701756973
,p_default_owner=>'VCONTROL'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(14937692742904977505)
,p_name=>'Customer Actions'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(16901700303850326355)
,p_list_item_display_sequence=>15
,p_list_item_link_text=>'Referenceability'
,p_list_item_link_target=>'f?p=&APP_ID.:96:&SESSION.::&DEBUG.:96:P96_ID:&P50_ID.:'
,p_list_item_icon=>'fa-phone'
,p_security_scheme=>wwv_flow_api.id(16004652111982028856)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(14937693240756977507)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Add Contact'
,p_list_item_link_target=>'f?p=&APP_ID.:37:&SESSION.::&DEBUG.:37:P37_CUSTOMER_ID:&P50_ID.:'
,p_list_item_icon=>'fa-user'
,p_required_patch=>wwv_flow_api.id(14994173107612514952)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2604142642548155334)
,p_list_item_display_sequence=>22
,p_list_item_link_text=>'Add Issue'
,p_list_item_link_target=>'f?p=&APP_ID.:129:&SESSION.::&DEBUG.:129:P129_CUSTOMER_ID:&P50_ID.:'
,p_list_item_icon=>'fa-alert'
,p_security_scheme=>wwv_flow_api.id(16004652111982028856)
,p_required_patch=>wwv_flow_api.id(2604194588938613786)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(18219352968234788987)
,p_list_item_display_sequence=>25
,p_list_item_link_text=>'Add Activity'
,p_list_item_link_target=>'f?p=&APP_ID.:150:&SESSION.::&DEBUG.:150:P150_CUSTOMER_ID:&P50_ID.:'
,p_list_item_icon=>'fa-newspaper-o'
,p_security_scheme=>wwv_flow_api.id(16004652111982028856)
,p_required_patch=>wwv_flow_api.id(18176929147143381754)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(14937693534054977507)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Add Product(s)'
,p_list_item_link_target=>'f?p=&APP_ID.:68:&SESSION.::&DEBUG.:RP,68,RIR:P68_CUSTOMER_ID:&P50_ID.:'
,p_list_item_icon=>'fa-square-o'
,p_required_patch=>wwv_flow_api.id(14994165819739448501)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(17786752891703473216)
,p_list_item_display_sequence=>35
,p_list_item_link_text=>'Add Partner(s)'
,p_list_item_link_target=>'f?p=&APP_ID.:110:&SESSION.::&DEBUG.:RP,110,RIR:P110_CUSTOMER_ID:&P50_ID.:'
,p_list_item_icon=>'fa-thumbs-o-up'
,p_required_patch=>wwv_flow_api.id(1378003296573531252)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(17789595644362059043)
,p_list_item_display_sequence=>36
,p_list_item_link_text=>'Add Competitor(s)'
,p_list_item_link_target=>'f?p=&APP_ID.:111:&SESSION.::&DEBUG.:RP,111,RIR:P111_CUSTOMER_ID:&P50_ID.:'
,p_list_item_icon=>'fa-emoji-cringe'
,p_security_scheme=>wwv_flow_api.id(1398520364044278691)
,p_required_patch=>wwv_flow_api.id(1374851708669506570)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(14937693779553977507)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Add Update'
,p_list_item_link_target=>'f?p=&APP_ID.:97:&SESSION.::&DEBUG.:97:P97_CUSTOMER_ID:&P50_ID.:'
,p_list_item_icon=>'fa-comment-o'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(14937694144726977508)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Add Link'
,p_list_item_link_target=>'f?p=&APP_ID.:66:&SESSION.::&DEBUG.:66:P66_CUSTOMER_ID:&P50_ID.:'
,p_list_item_icon=>'fa-chain'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(14937695813967985281)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Add Attachment'
,p_list_item_link_target=>'f?p=&APP_ID.:64:&SESSION.::&DEBUG.:64:P64_CUSTOMER_ID:&P50_ID.:'
,p_list_item_icon=>'fa-paperclip'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.component_end;
end;
/
