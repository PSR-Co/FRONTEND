// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderRequest _$OrderRequestFromJson(Map<String, dynamic> json) => OrderRequest(
      productId: json['productId'] as int,
      ordererName: json['ordererName'] as String,
      websiteUrl: json['websiteUrl'] as String,
      inquiry: json['inquiry'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$OrderRequestToJson(OrderRequest instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'ordererName': instance.ordererName,
      'websiteUrl': instance.websiteUrl,
      'inquiry': instance.inquiry,
      'description': instance.description,
    };
