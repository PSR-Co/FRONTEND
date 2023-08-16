import 'package:json_annotation/json_annotation.dart';

import '../general_model.dart';

part 'inquiry_model.g.dart';

@JsonSerializable()
class InquiryModel extends GeneralModel {
  final Map<String, dynamic>? data;

  InquiryModel(
      {required super.code, required super.message, required this.data});

  factory InquiryModel.fromJson(Map<String, dynamic> json) =>
      _$AddInquiryModelFromJson(json);

  Map<String, dynamic> toJson() => _$InquiryModelToJson(this);
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
