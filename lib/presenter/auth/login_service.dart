import 'package:flutter/cupertino.dart';
import 'package:psr/model/data/auth/login_model.dart';

import '../../model/data/general_model.dart';
import '../../model/network/api_manager.dart';

class LoginService {
  final LOGIN_URL = '/users/login';
  final SEARCH_EMAIL_URL = '/users/email/search';
  final VALIDATE_FOR_RESET_PW_URL = '/users/password';
  final RESET_PW_URL = '/users/password-reset';

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
        .catchError((error) { debugPrint('error : $error'); });

    if (response != null) {
      final data = LoginModel.fromJson(response);
      APIManager().writeToken(data.data.accessToken, data.data.refreshToken);
      APIManager().writeUserType(data.data.type);
      return true;
    }
    else { return false; }
  }

  Future<SearchEmailResponse?> searchEmail(String name, String smsKey, String phoneNum) async {
    final body = SearchEmailRequest(name: name, smsKey: smsKey, phone: phoneNum).toJson();
    final response = await
      APIManager().request(RequestType.POST, SEARCH_EMAIL_URL, null, null, body)
        .catchError((error) { debugPrint('error : $error'); });

    return (response == null) ? null : SearchEmailResponse.fromJson(response);
  }

  Future<GeneralModel?> validateForResetPW(String email, String phoneNum, String smsKey) async {
    final body = ValidateForResetPWRequest(email: email, smsKey: smsKey, phone: phoneNum).toJson();
    final response = await
      APIManager().request(RequestType.POST, VALIDATE_FOR_RESET_PW_URL, null, null, body)
        .catchError((error) { debugPrint('error : $error'); });
    return (response == null) ? null : GeneralModel.fromJson(response);
  }

  Future<GeneralModel?> resetPW(String email, String pw, String phoneNum) async {
    final body = ResetPWRequest(email: email, password: pw, phone: phoneNum).toJson();
    final response = await
        APIManager().request(RequestType.PATCH, RESET_PW_URL, null, null, body)
            .catchError((error) { debugPrint('error : $error'); });
    return (response == null) ? null : GeneralModel.fromJson(response);
  }
}