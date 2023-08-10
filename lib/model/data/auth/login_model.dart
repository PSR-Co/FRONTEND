
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

@JsonSerializable()
class SearchEmailRequest {
  final String name;
  final String smsKey;
  final String phone;

  SearchEmailRequest({
    required this.name,
    required this.smsKey,
    required this.phone,
  });

  Map<String, dynamic> toJson() => _$SearchEmailRequestToJson(this);
}

@JsonSerializable()
class SearchEmailResponse extends GeneralModel {
  final UserEmail data;

  SearchEmailResponse({
    required super.code,
    required super.message,
    required this.data
  });

  factory SearchEmailResponse.fromJson(Map<String, dynamic> json)
  => _$SearchEmailResponseFromJson(json);
}

@JsonSerializable()
class UserEmail {
  final String email;

  UserEmail({
    required this.email
  });

  factory UserEmail.fromJson(Map<String, dynamic> json)
  => _$UserEmailFromJson(json);
}

@JsonSerializable()
class ValidateForResetPWRequest {
  final String email;
  final String smsKey;
  final String phone;

  ValidateForResetPWRequest({
    required this.email,
    required this.smsKey,
    required this.phone,
  });

  factory ValidateForResetPWRequest.fromJson(Map<String, dynamic> json)
  => _$ValidateForResetPWRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ValidateForResetPWRequestToJson(this);
}

@JsonSerializable()
class ResetPWRequest {
  final String email;
  final String password;
  final String phone;

  ResetPWRequest({
    required this.email,
    required this.password,
    required this.phone,
  });

  Map<String, dynamic> toJson() => _$ResetPWRequestToJson(this);
}