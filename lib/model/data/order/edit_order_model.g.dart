// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditOrderModel _$EditOrderModelFromJson(Map<String, dynamic> json) =>
    EditOrderModel(
      code: json['code'] as int,
      message: json['message'] as String,
      data: EditOrderData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EditOrderModelToJson(EditOrderModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

EditOrderData _$EditOrderDataFromJson(Map<String, dynamic> json) =>
    EditOrderData(
      data: json['data'] as String?,
    );

Map<String, dynamic> _$EditOrderDataToJson(EditOrderData instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
