import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';
import 'package:psr/model/data/general_model.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel extends GeneralModel{
  final Order order;
  OrderModel({required super.code, required super.message, required this.order});
  factory OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}

@JsonSerializable()
class Order {
  final bool isSeller;
  final String status;
  final int orderUserId;
  final String orderDate;
  final int productId;
  final String productName;
  final String ordererName;
  final String websiteUrl;
  final String inquiry;
  final String description;

  Order({required this.isSeller, required this.status, required this.orderUserId, required this.orderDate, required this.productId, required this.productName, required this.ordererName, required this.websiteUrl, required this.inquiry, required this.description});
  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
