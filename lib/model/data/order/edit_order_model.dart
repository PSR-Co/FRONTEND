import 'package:json_annotation/json_annotation.dart';
import 'package:psr/model/data/general_model.dart';

part 'edit_order_model.g.dart';

@JsonSerializable()
class EditOrderModel extends GeneralModel{
  final Map<String,dynamic>? data;
  EditOrderModel({required super.code, required super.message, required this.data});

  factory EditOrderModel.fromJson(Map<String, dynamic> json)
  => _$EditOrderModelFromJson(json);
  Map<String, dynamic> toJson() => _$EditOrderModelToJson(this);
}

@JsonSerializable()
class EditOrderRequest {
  final String ordererName;
  final String? websiteUrl;
  final String inquiry;
  final String description;

  EditOrderRequest({
    required this.ordererName,
    required this.websiteUrl,
    required this.inquiry,
    required this.description
  });

  factory EditOrderRequest.fromJson(Map<String, dynamic> json)
  => _$EditOrderRequestFromJson(json);
  Map<String, dynamic> toJson() => _$EditOrderRequestToJson(this);
}