import 'package:flutter/cupertino.dart';
import 'package:psr/model/data/auth/login_model.dart';

import '../../model/network/api_manager.dart';

class LoginService {
  final LOGIN_URL = '/users/login';

  /// Singleton Pattern
  static final LoginService _authService = LoginService._();
  LoginService._();
  factory LoginService() {
    return _authService;
  }

  Future<bool> login(String id, String pw) async {
    final body = LoginRequest(email: id, password: pw).toJson();
    final response = await
    APIManager().request(RequestType.POST, LOGIN_URL, null, null, body)
        .catchError((error) { debugPrint('error : ${error}'); });

    if (response != null) {
      final data = LoginModel.fromJson(response);
      APIManager().writeToken(data.data.accessToken, data.data.refreshToken);
      return true;

    } else {
      return false;
    }
  }
}