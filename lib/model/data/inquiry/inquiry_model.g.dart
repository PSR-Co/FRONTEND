// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inquiry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InquiryModel _$InquiryModelFromJson(Map<String, dynamic> json) => InquiryModel(
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$InquiryModelToJson(InquiryModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

AddInquiryRequest _$AddInquiryRequestFromJson(Map<String, dynamic> json) =>
    AddInquiryRequest(
      title: json['title'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$AddInquiryRequestToJson(AddInquiryRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
    };
