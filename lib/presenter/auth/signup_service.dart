import 'package:flutter/cupertino.dart';

import 'package:psr/model/data/auth/signup_model.dart';
import 'package:psr/model/network/api_manager.dart';

class SignupService {
  final VALIDATE_NICKNAME_URL = "/users/nickname";
  final SIGNUP_URL = "/users/signup";

  /// Singleton Pattern
  static final SignupService _signupService = SignupService._();
  SignupService._();
  factory SignupService() {
    return _signupService;
  }

  Future<bool?> validateNickname(String nickname) async {
    final body = Nickname(nickname: nickname).toJson();
    final response = await 
        APIManager().request(RequestType.POST, VALIDATE_NICKNAME_URL, null, null, body)
            .catchError((error) { debugPrint('error : $error'); });

    if (response != null) {
      return response['data'];
    } else {
      return null;
    }
  }

}