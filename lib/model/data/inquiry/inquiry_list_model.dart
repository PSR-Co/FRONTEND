import 'package:json_annotation/json_annotation.dart';
import 'package:psr/model/data/general_model.dart';

part 'inquiry_list_model.g.dart';

@JsonSerializable()
class InquiryListModel extends GeneralModel {
  final InquiryListData data;
  InquiryListModel({required super.code, required super.message, required this.data});
  factory InquiryListModel.fromJson(Map<String, dynamic> json) => _$InquiryListModelFromJson(json);
}

@JsonSerializable()
class InquiryListData {
  final List<InquiryList>? inquiries;
  InquiryListData({required this.inquiries});
  factory InquiryListData.fromJson(Map<String, dynamic> json) => _$InquiryListDataFromJson(json);
}

@JsonSerializable()
class InquiryList {
  final int inquiryId;
  final String title;
  InquiryList({required this.inquiryId, required this.title});
  factory InquiryList.fromJson(Map<String, dynamic> json) => _$InquiryListFromJson(json);
}