import 'package:json_annotation/json_annotation.dart';

import '../general_model.dart';

part 'add_inquiry_model.g.dart';

@JsonSerializable()
class AddInquiryModel extends GeneralModel {
  final Map<String, dynamic>? data;

  AddInquiryModel(
      {required super.code, required super.message, required this.data});

  factory AddInquiryModel.fromJson(Map<String, dynamic> json) =>
      _$AddInquiryModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddInquiryModelToJson(this);
}

@JsonSerializable()
class AddInquiryRequest {
  final String title;
  final String content;

  AddInquiryRequest(
      {required this.title,
        required this.content});

  factory AddInquiryRequest.fromJson(Map<String, dynamic> json) =>
      _$AddInquiryRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddInquiryRequestToJson(this);
}

