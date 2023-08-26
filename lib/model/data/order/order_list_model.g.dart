// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderListModel _$OrderListModelFromJson(Map<String, dynamic> json) =>
    OrderListModel(
      code: json['code'] as int,
      message: json['message'] as String,
      data: OrderListData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderListModelToJson(OrderListModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

OrderListData _$OrderListDataFromJson(Map<String, dynamic> json) =>
    OrderListData(
      content: (json['content'] as List<dynamic>)
          .map((e) => OrderList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderListDataToJson(OrderListData instance) =>
    <String, dynamic>{
      'content': instance.content,
    };

OrderList _$OrderListFromJson(Map<String, dynamic> json) => OrderList(
      orderId: json['orderId'] as int,
      orderDate: json['orderDate'] as String,
      userName: json['userName'] as String,
      productId: json['productId'] as int,
      productName: json['productName'] as String,
      productImgUrl: json['productImgUrl'] as String?,
      reviewId: json['reviewId'] as int?,
    );

Map<String, dynamic> _$OrderListToJson(OrderList instance) => <String, dynamic>{
      'orderId': instance.orderId,
      'orderDate': instance.orderDate,
      'userName': instance.userName,
      'productId': instance.productId,
      'productName': instance.productName,
      'productImgUrl': instance.productImgUrl,
      'reviewId': instance.reviewId,
    };
