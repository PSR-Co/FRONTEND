import 'package:json_annotation/json_annotation.dart';

part 'order_request_model.g.dart';

@JsonSerializable()
class OrderRequest {
  final int productId;
  final String ordererName;
  final String? websiteUrl;
  final String inquiry;
  final String description;

  OrderRequest({
    required this.productId,
    required this.ordererName,
    required this.websiteUrl,
    required this.inquiry,
    required this.description,
  });

  Map<String, dynamic> toJson() => _$OrderRequestToJson(this);
}