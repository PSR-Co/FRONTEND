import 'package:json_annotation/json_annotation.dart';
import 'package:psr/model/data/general_model.dart';

part 'add_inquiry_answer_model.g.dart';

@JsonSerializable()
class AddInquiryAnswerModel extends GeneralModel {
  final Map<String, dynamic>? data;
  AddInquiryAnswerModel({required super.code, required super.message, required this.data});
  factory AddInquiryAnswerModel.fromJson(Map<String, dynamic> json) => _$AddInquiryAnswerModelFromJson(json);
}