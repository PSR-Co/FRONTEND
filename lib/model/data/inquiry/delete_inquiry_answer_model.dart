import 'package:json_annotation/json_annotation.dart';
import 'package:psr/model/data/general_model.dart';

part 'delete_inquiry_answer_model.g.dart';

@JsonSerializable()
class DeleteInquiryAnswerModel extends GeneralModel{
  final Map<String, dynamic>? data;
  DeleteInquiryAnswerModel({required super.code, required super.message, required this.data});
  factory DeleteInquiryAnswerModel.fromJson(Map<String, dynamic> json) => _$DeleteInquiryAnswerModelFromJson(json);
}