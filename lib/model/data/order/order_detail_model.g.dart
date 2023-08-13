// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetailModel _$OrderDetailModelFromJson(Map<String, dynamic> json) =>
    OrderDetailModel(
      code: json['code'] as int,
      message: json['message'] as String,
      data: OrderDetail.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderDetailModelToJson(OrderDetailModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

OrderDetail _$OrderDetailFromJson(Map<String, dynamic> json) => OrderDetail(
      isSeller: json['isSeller'] as bool,
      status: json['status'] as String,
      orderUserId: json['orderUserId'] as int,
      orderDate: json['orderDate'] as String,
      productId: json['productId'] as int,
      productName: json['productName'] as String,
      ordererName: json['ordererName'] as String,
      websiteUrl: json['websiteUrl'] as String?,
      inquiry: json['inquiry'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$OrderDetailToJson(OrderDetail instance) =>
    <String, dynamic>{
      'isSeller': instance.isSeller,
      'status': instance.status,
      'orderUserId': instance.orderUserId,
      'orderDate': instance.orderDate,
      'productId': instance.productId,
      'productName': instance.productName,
      'ordererName': instance.ordererName,
      'websiteUrl': instance?.websiteUrl,
      'inquiry': instance.inquiry,
      'description': instance.description,
    };
