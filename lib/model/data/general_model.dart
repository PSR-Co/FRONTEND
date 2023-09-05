import 'package:json_annotation/json_annotation.dart';

part 'general_model.g.dart';

@JsonSerializable()
class GeneralModel {
  final int code;
  final String message;

  GeneralModel({
    required this.code,
    required this.message,
  });

  factory GeneralModel.fromJson(Map<String, dynamic> json)
  => _$GeneralModelFromJson(json);
}