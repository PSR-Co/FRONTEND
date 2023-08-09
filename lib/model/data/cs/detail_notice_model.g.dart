// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_notice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailNoticeModel _$DetailNoticeModelFromJson(Map<String, dynamic> json) => DetailNoticeModel(
      code: json['code'] as int,
      message: json['message'] as String,
      data: DetailNoticeData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailNoticeModelToJson(DetailNoticeModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

DetailNoticeData _$DetailNoticeDataFromJson(Map<String, dynamic> json) => DetailNoticeData(
    noticeId: json['noticeId'] as int,
    title: json['title'] as String,
    date: json['date'] as String);

Map<String, dynamic> _$DetailNoticeDataToJson(DetailNoticeData instance) => <String, dynamic>{
      'noticeId': instance.noticeId,
      'title': instance.title,
      'date': instance.date,
    };
