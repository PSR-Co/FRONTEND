import 'package:json_annotation/json_annotation.dart';
import 'package:psr/model/data/general_model.dart';

part 'edit_order_model.g.dart';

@JsonSerializable()
class EditOrderModel extends GeneralModel {
  final EditOrderData data;
  EditOrderModel({required super.code, required super.message, required this.data});
  factory EditOrderModel.fromJson(Map<String, dynamic> json) => _$EditOrderModelFromJson(json);
  Map<String, dynamic> toJson() => _$EditOrderModelToJson(this);
}

@JsonSerializable()
class EditOrderData {
 final String? data;
 EditOrderData({required this.data});
 factory EditOrderData.fromJson(Map<String, dynamic> json) => _$EditOrderDataFromJson(json);
 Map<String, dynamic> toJson() => _$EditOrderDataToJson(this);
}