// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditOrderModel _$EditOrderModelFromJson(Map<String, dynamic> json) =>
    EditOrderModel(
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$EditOrderModelToJson(EditOrderModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

EditOrderRequest _$EditOrderRequestFromJson(Map<String, dynamic> json) =>
    EditOrderRequest(
      ordererName: json['ordererName'] as String,
      websiteUrl: json['websiteUrl'] as String?,
      inquiry: json['inquiry'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$EditOrderRequestToJson(EditOrderRequest instance) =>
    <String, dynamic>{
      'ordererName': instance.ordererName,
      'websiteUrl': instance.websiteUrl,
      'inquiry': instance.inquiry,
      'description': instance.description,
    };
