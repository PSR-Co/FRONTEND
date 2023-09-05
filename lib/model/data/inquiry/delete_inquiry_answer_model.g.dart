// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_inquiry_answer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteInquiryAnswerModel _$DeleteInquiryAnswerModelFromJson(
        Map<String, dynamic> json) =>
    DeleteInquiryAnswerModel(
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$DeleteInquiryAnswerModelToJson(
        DeleteInquiryAnswerModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
