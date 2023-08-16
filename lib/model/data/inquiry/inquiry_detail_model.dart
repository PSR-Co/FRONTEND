import 'package:json_annotation/json_annotation.dart';
import 'package:psr/model/data/general_model.dart';

part 'inquiry_detail_model.g.dart';

@JsonSerializable()
class InquiryDetailModel extends GeneralModel{
  final InquiryDetail? data;
  InquiryDetailModel({required super.code, required super.message, required this.data});
  factory InquiryDetailModel.fromJson(Map<String, dynamic> json) => _$InquiryDetailModelFromJson(json);
}

@JsonSerializable()
class InquiryDetail {
  final int inquiryId;
  final String title;
  final String content;
  final String? answer;
  InquiryDetail({required this.inquiryId, required this.title, required this.content, required this.answer});
  factory InquiryDetail.fromJson(Map<String, dynamic> json) => _$InquiryDetailFromJson(json);
}