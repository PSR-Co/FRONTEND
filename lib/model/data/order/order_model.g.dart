// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      code: json['code'] as int,
      message: json['message'] as String,
      order: Order.fromJson(json['order'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'order': instance.order,
    };

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      isSeller: json['isSeller'] as bool,
      status: json['status'] as String,
      orderUserId: json['orderUserId'] as int,
      orderDate: json['orderDate'] as String,
      productId: json['productId'] as int,
      productName: json['productName'] as String,
      ordererName: json['ordererName'] as String,
      websiteUrl: json['websiteUrl'] as String,
      inquiry: json['inquiry'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'isSeller': instance.isSeller,
      'status': instance.status,
      'orderUserId': instance.orderUserId,
      'orderDate': instance.orderDate,
      'productId': instance.productId,
      'productName': instance.productName,
      'ordererName': instance.ordererName,
      'websiteUrl': instance.websiteUrl,
      'inquiry': instance.inquiry,
      'description': instance.description,
    };
