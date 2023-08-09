// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoticeModel _$NoticeModelFromJson(Map<String, dynamic> json) =>
    NoticeModel(
      code: json['code'] as int,
      message: json['message'] as String,
      data: NoticeData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NoticeModelToJson(NoticeModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

NoticeData _$NoticeDataFromJson(Map<String, dynamic> json) =>
    NoticeData(
        noticeId: json['noticeId'] as int,
        title: json['title'] as String,
        date: json['date'] as DateTime
    );

Map<String, dynamic> _$NoticeDataToJson(NoticeData instance) =>
    <String, dynamic>{
      'noticeId': instance.noticeId,
      'title': instance.title,
      'date': instance.date,

    };