import 'package:flutter/cupertino.dart';
import 'package:psr/model/data/auth/auth_model.dart';

import '../../model/network/api_manager.dart';

class AuthService {
  final LOGIN_URL = '/users/login';

  /// Singleton Pattern
  static final AuthService _authService = AuthService._();
  AuthService._();
  factory AuthService() {
    return _authService;
  }

  Future<bool> login(String id, String pw) async {
    final body = LoginRequest(email: id, password: pw).toJson();
    final response = await
    APIManager().request(RequestType.POST, LOGIN_URL, null, null, body)
        .catchError((error) { debugPrint('error : ${error}'); });

    if (response != null) {
      final data = AuthModel.fromJson(response);
      APIManager().writeToken(data.data.accessToken, data.data.refreshToken);
      return true;

    } else {
      return false;
    }
  }
}