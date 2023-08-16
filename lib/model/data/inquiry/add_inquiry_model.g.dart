// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_inquiry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddInquiryModel _$AddInquiryModelFromJson(Map<String, dynamic> json) =>
    AddInquiryModel(
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$AddInquiryModelToJson(AddInquiryModel instance) =>
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
