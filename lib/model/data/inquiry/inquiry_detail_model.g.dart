// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inquiry_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InquiryDetailModel _$InquiryDetailModelFromJson(Map<String, dynamic> json) =>
    InquiryDetailModel(
      code: json['code'] as int,
      message: json['message'] as String,
      data: InquiryDetail.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InquiryDetailModelToJson(InquiryDetailModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

InquiryDetail _$InquiryDetailFromJson(Map<String, dynamic> json) =>
    InquiryDetail(
      inquiryId: json['inquiryId'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      answer: json['answer'] as String?,
    );

Map<String, dynamic> _$InquiryDetailToJson(InquiryDetail instance) =>
    <String, dynamic>{
      'inquiryId': instance.inquiryId,
      'title': instance.title,
      'content': instance.content,
      'answer': instance.answer,
    };
