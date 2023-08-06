
import 'package:psr/model/data/general_model.dart';

class AuthModel extends GeneralModel {
  final LoginResponse data;

  AuthModel({
    required super.code,
    required super.message,
    required this.data,
  });

  factory AuthModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    return AuthModel(
      code: json['code'],
      message: json['message'],
      data: LoginResponse.fromJson(json: json['data']),
    );
  }
}

class LoginResponse {
  final String accessToken;
  final String refreshToken;
  final String type;

  LoginResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.type,
  });

  factory LoginResponse.fromJson({
    required Map<String, dynamic> json,
  }) {
    return LoginResponse(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      type: json['type'],
    );
  }
}