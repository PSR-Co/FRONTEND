import 'package:json_annotation/json_annotation.dart';
import 'package:psr/model/data/general_model.dart';

part 'order_detail_model.g.dart';

@JsonSerializable()
class OrderDetailModel extends GeneralModel{
  final OrderDetail data;
  OrderDetailModel({required super.code, required super.message, required this.data});
  factory OrderDetailModel.fromJson(Map<String, dynamic> json) => _$OrderDetailModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderDetailModelToJson(this);
}

@JsonSerializable()
class OrderDetail {
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

  OrderDetail({required this.isSeller, required this.status, required this.orderUserId, required this.orderDate, required this.productId, required this.productName, required this.ordererName, required this.websiteUrl, required this.inquiry, required this.description});
  factory OrderDetail.fromJson(Map<String, dynamic> json) => _$OrderDetailFromJson(json);
  Map<String, dynamic> toJson() => _$OrderDetailToJson(this);
}
