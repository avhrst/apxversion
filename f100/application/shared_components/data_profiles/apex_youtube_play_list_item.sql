prompt --application/shared_components/data_profiles/apex_youtube_play_list_item
begin
--   Manifest
--     DATA PROFILE: APEX Youtube Play List Item
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>4200481731648079
,p_default_application_id=>100
,p_default_id_offset=>5389331382356895884
,p_default_owner=>'VCONTROL'
);
wwv_flow_api.create_data_profile(
 p_id=>wwv_flow_api.id(5394773668229340784)
,p_name=>'APEX Youtube Play List Item'
,p_format=>'JSON'
,p_row_selector=>'items'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(5394774721036340785)
,p_data_profile_id=>wwv_flow_api.id(5394773668229340784)
,p_name=>'ID'
,p_sequence=>1
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'id'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(5394775074794340785)
,p_data_profile_id=>wwv_flow_api.id(5394773668229340784)
,p_name=>'ETAG'
,p_sequence=>2
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'etag'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(5394775352408340785)
,p_data_profile_id=>wwv_flow_api.id(5394773668229340784)
,p_name=>'KIND'
,p_sequence=>3
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'kind'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(5394775630622340785)
,p_data_profile_id=>wwv_flow_api.id(5394773668229340784)
,p_name=>'TITLE'
,p_sequence=>4
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'snippet.title'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(5394776254498340785)
,p_data_profile_id=>wwv_flow_api.id(5394773668229340784)
,p_name=>'CHANNELID'
,p_sequence=>6
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'snippet.channelId'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(5394776577547340786)
,p_data_profile_id=>wwv_flow_api.id(5394773668229340784)
,p_name=>'PLAYLISTID'
,p_sequence=>7
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'snippet.playlistId'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(5394777170931340786)
,p_data_profile_id=>wwv_flow_api.id(5394773668229340784)
,p_name=>'VIDEOID'
,p_sequence=>9
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'snippet.resourceId.videoId'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(5394777431456340786)
,p_data_profile_id=>wwv_flow_api.id(5394773668229340784)
,p_name=>'URL'
,p_sequence=>10
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'snippet.thumbnails.high.url'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(5394777716974340786)
,p_data_profile_id=>wwv_flow_api.id(5394773668229340784)
,p_name=>'WIDTH'
,p_sequence=>11
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'snippet.thumbnails.high.width'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(5394778070938340786)
,p_data_profile_id=>wwv_flow_api.id(5394773668229340784)
,p_name=>'HEIGHT'
,p_sequence=>12
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'snippet.thumbnails.high.height'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(5394781941448340790)
,p_data_profile_id=>wwv_flow_api.id(5394773668229340784)
,p_name=>'DESCRIPTION'
,p_sequence=>25
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'snippet.description'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(5394782256402340790)
,p_data_profile_id=>wwv_flow_api.id(5394773668229340784)
,p_name=>'PUBLISHEDAT'
,p_sequence=>26
,p_data_type=>'TIMESTAMP WITH TIME ZONE'
,p_format_mask=>'YYYY"-"MM"-"DD"T"HH24":"MI:SSTZR'
,p_has_time_zone=>true
,p_selector=>'snippet.publishedAt'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(5394774463607340784)
,p_data_profile_id=>wwv_flow_api.id(5394773668229340784)
,p_name=>'VIDEOPUBLISHEDAT'
,p_sequence=>29
,p_data_type=>'TIMESTAMP WITH TIME ZONE'
,p_format_mask=>'YYYY"-"MM"-"DD"T"HH24":"MI:SSTZR'
,p_has_time_zone=>true
,p_selector=>'contentDetails.videoPublishedAt'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(712704118141834006)
,p_data_profile_id=>wwv_flow_api.id(5394773668229340784)
,p_name=>'VIDEO_DURATION'
,p_sequence=>39
,p_column_type=>'SQL_EXPRESSION'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>true
,p_is_filterable=>false
,p_transform_type=>'SQL_EXPRESSION'
,p_expression1=>'eba_demo_card_pkg.get_video_duration( p_video_id => VIDEOID )'
);
wwv_flow_api.component_end;
end;
/
