import 'package:json_annotation/json_annotation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:psr/model/data/general_model.dart';

part 'myinfo_model.g.dart';

@JsonSerializable()
class MyInfoModel extends GeneralModel {
  final MyInfo? data;

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
  final Map<String, dynamic>? data;

  ChangePWModel(
      {required super.code, required super.message, required this.data});

  factory ChangePWModel.fromJson(Map<String, dynamic> json) =>
      _$ChangePWModelFromJson(json);
}

@JsonSerializable()
class ChangePW {
  final String currentPassword;
  final String password;

  ChangePW({required this.currentPassword, required this.password});

  factory ChangePW.fromJson(Map<String, dynamic> json) =>
      _$ChangePWFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePWToJson(this);
}

@JsonSerializable()
class AccountModel extends GeneralModel {
  final Map<String, dynamic>? data;

  AccountModel(
      {required super.code, required super.message, required this.data});

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);
}

@JsonSerializable()
class NotificationModel extends GeneralModel {
  final Notification data;

  NotificationModel({
    required super.code,
    required super.message,
    required this.data,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}

@JsonSerializable()
class Notification {
  final bool notification;

  Notification({
    required this.notification,
  });

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
}