// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_inquiry_answer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddInquiryAnswerModel _$AddInquiryAnswerModelFromJson(
        Map<String, dynamic> json) =>
    AddInquiryAnswerModel(
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$AddInquiryAnswerModelToJson(
        AddInquiryAnswerModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
