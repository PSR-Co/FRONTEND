import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';
import 'package:psr/model/data/general_model.dart';

part 'order_list_model.g.dart';

@JsonSerializable()
class OrderListModel extends GeneralModel{
  final OrderListData data;
  OrderListModel({required super.code, required super.message, required this.data});
  factory OrderListModel.fromJson(Map<String, dynamic> json) => _$OrderListModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderListModelToJson(this);
}

@JsonSerializable()
class OrderListData {
  final List<OrderList> content;
  OrderListData({required this.content});
  factory OrderListData.fromJson(Map<String, dynamic> json) => _$OrderListDataFromJson(json);
  Map<String, dynamic> toJson() => _$OrderListDataToJson(this);
}

@JsonSerializable()
class OrderList {
  final int orderId;
  final String orderDate;
  final String userName;
  final int productId;
  final String productName;
  final String? productImgUrl;
  final int? reviewId;


  OrderList({required this.orderId, required this.orderDate, required this.userName, required this.productId, required this.productName, required this.productImgUrl, required this.reviewId});
  factory OrderList.fromJson(Map<String, dynamic> json) => _$OrderListFromJson(json);
  Map<String, dynamic> toJson() => _$OrderListToJson(this);
}
