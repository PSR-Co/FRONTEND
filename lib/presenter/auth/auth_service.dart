import 'package:flutter/cupertino.dart';
import 'package:psr/model/data/auth/auth_model.dart';

import '../../model/network/api_manager.dart';

class AuthService {
  // TODO: 로그인, 회원가입, 아이디 찾기, 비밀번호 재설정 등의 네트워크 요청 처리
  final LOGIN_URL = '/users/login';

  Future<bool> login(String id, String pw) async {
    final loginData = {"email" : id, "password" : pw};
    final response = await
    APIManager().request(RequestType.POST, LOGIN_URL, null, null, loginData)
        .catchError((error) { debugPrint('error : ${error}'); });
    // print('로그인 요청 후 response -> ${response}');

    if (response != null) {
      final data = AuthModel.fromJson(json: response);
      APIManager().writeToken(data.data.accessToken, data.data.refreshToken);
      return true;

    } else {
      return false;
    }
  }
}