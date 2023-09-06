import 'package:json_annotation/json_annotation.dart';
import 'package:psr/model/data/general_model.dart';

part 'myinfo_model.g.dart';

@JsonSerializable()
class MyInfoModel extends GeneralModel {
  final MyInfo data;

  MyInfoModel(
      {required super.code, required super.message, required this.data});

  factory MyInfoModel.fromJson(Map<String, dynamic> json) =>
      _$MyInfoModelFromJson(json);
}

@JsonSerializable()
class MyInfo {
  final String email;
  final String? imgUrl;
  final String type;
  final String phone;
  final String nickname;

  MyInfo(
      {required this.email,
      required this.imgUrl,
      required this.type,
      required this.phone,
      required this.nickname});

  factory MyInfo.fromJson(Map<String, dynamic> json) => _$MyInfoFromJson(json);
}

@JsonSerializable()
class ChangePWModel extends GeneralModel {
  final ChangePW data;

  ChangePWModel(
      {required super.code, required super.message, required this.data});

  factory ChangePWModel.fromJson(Map<String, dynamic> json) =>
      _$ChangePWModelFromJson(json);
}

class ChangePW {
  final String currentPassword;
  final String password;

  ChangePW({required this.currentPassword, required this.password});

  factory ChangePW.fromJson(Map<String, dynamic> json) =>
      _$ChangePWFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePWToJson(this);
}
