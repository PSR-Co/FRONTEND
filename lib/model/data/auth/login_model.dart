
import 'package:json_annotation/json_annotation.dart';
import 'package:psr/model/data/general_model.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel extends GeneralModel {
  final LoginResponse data;

  LoginModel({
    required super.code,
    required super.message,
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json)
  => _$LoginModelFromJson(json);
}

@JsonSerializable()
class LoginResponse {
  final String accessToken;
  final String refreshToken;
  final String type;

  LoginResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.type,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json)
  => _$LoginResponseFromJson(json);
}

@JsonSerializable()
class LoginRequest {
  final String email;
  final String password;

  LoginRequest({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}