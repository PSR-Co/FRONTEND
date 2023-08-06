
import 'package:json_annotation/json_annotation.dart';
import 'package:psr/model/data/general_model.dart';

part 'auth_model.g.dart';

@JsonSerializable()
class AuthModel extends GeneralModel {
  final LoginResponse data;

  AuthModel({
    required super.code,
    required super.message,
    required this.data,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json)
  => _$AuthModelFromJson(json);
  // factory AuthModel.fromJson({
  //   required Map<String, dynamic> json,
  // }) {
  //   return AuthModel(
  //     code: json['code'],
  //     message: json['message'],
  //     data: LoginResponse.fromJson(json: json['data']),
  //   );
  // }
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

  // factory LoginResponse.fromJson({
  //   required Map<String, dynamic> json,
  // }) {
  //   return LoginResponse(
  //     accessToken: json['accessToken'],
  //     refreshToken: json['refreshToken'],
  //     type: json['type'],
  //   );
  // }
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
  // Map<String, dynamic> dataToJson() {
  //   return {
  //     'id': this.id,
  //     'password': this.passwordw,
  //   };
  // }
}