// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

///Notice Main
NoticeModel _$NoticeModelFromJson(Map<String, dynamic> json) => NoticeModel(
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

NoticeData _$NoticeDataFromJson(Map<String, dynamic> json) => NoticeData(
    noticeLists: (json['noticeLists'] as List<dynamic>)
        .map((e) => Notice.fromJson(e as Map<String, dynamic>))
        .toList());

Map<String, dynamic> _$NoticeDataToJson(NoticeData instance) =>
    <String, dynamic>{'noticeLists': instance.noticeLists};

Notice _$NoticeFromJson(Map<String, dynamic> json) => Notice(
    noticeId: json['noticeId'] as int,
    title: json['title'] as String,
    date: json['date'] as String);

Map<String, dynamic> _$NoticeToJson(Notice instance) => <String, dynamic>{
      'noticeId': instance.noticeId,
      'title': instance.title,
      'date': instance.date,
    };

///Notice Detail
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

