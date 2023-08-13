// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_notice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeNoticeModel _$HomeNoticeModelFromJson(Map<String, dynamic> json) =>
    HomeNoticeModel(
      code: json['code'] as int,
      message: json['message'] as String,
      data: HomeNoticeData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeNoticeModelToJson(HomeNoticeModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

HomeNoticeData _$HomeNoticeDataFromJson(Map<String, dynamic> json) =>
    HomeNoticeData(
      noticeLists: (json['noticeLists'] as List<dynamic>)
          .map((e) => HomeNotice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeNoticeDataToJson(HomeNoticeData instance) =>
    <String, dynamic>{
      'noticeLists': instance.noticeLists,
    };

HomeNotice _$HomeNoticeFromJson(Map<String, dynamic> json) => HomeNotice(
      noticeId: json['noticeId'] as int,
      title: json['title'] as String,
    );

Map<String, dynamic> _$HomeNoticeToJson(HomeNotice instance) =>
    <String, dynamic>{
      'noticeId': instance.noticeId,
      'title': instance.title,
    };
