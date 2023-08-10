import 'package:flutter/cupertino.dart';

import 'package:psr/model/data/auth/signup_model.dart';
import 'package:psr/model/network/api_manager.dart';

class SignupService {
  final REQUEST_VALIDATION_CODE = "/users/phone/check";
  final VALIDATE_NICKNAME_URL = "/users/nickname";
  final SIGNUP_URL = "/users/signup";
  
  SignupRequest _signupRequest = SignupRequest(email: '', password: '', type: '', phone: '', name: '', profileImgKey: null, nickname: '', marketing: true, notification: true, interestList: []);

  /// Singleton Pattern
  static final SignupService _signupService = SignupService._();
  SignupService._();
  factory SignupService() {
    return _signupService;
  }

  /// Getter Methods
  SignupRequest getSignupRequestBody() { return _signupRequest; }

  /// Setter Methods
  void setRole(String selected) {
    _signupRequest.type = selected;
  }

  void setAccountInfo(String email, String pw) {
    _signupRequest.email = email;
    _signupRequest.password = pw;
  }

  void setUserInfo(String name, String phoneNum) {
    _signupRequest.name = name;
    _signupRequest.phone = phoneNum;
  }

  void setInterestList(List<String> interests) {
    interests.forEach((element) {
      _signupRequest.interestList.add(Interest(category: getTrimmedCategory(element)));
    });
  }

  void setNickname(String nickname) { _signupRequest.nickname = nickname; }

  void setProfileImage(String? profileImgKey) { _signupRequest.profileImgKey = (profileImgKey == null) ? null : profileImgKey!; }


  /// helper methods
  String getTrimmedCategory(String category) {
    if (category.length > 5) {
      return category.replaceAll('\n', ' ');
    } else {
      return category.replaceAll(' ', '');
    }
  }

  /// Request Methods
  Future<bool> requestValidationCode(String phoneNum) async {
    final body = {"phone": phoneNum};
    final response = await APIManager().request(RequestType.POST, REQUEST_VALIDATION_CODE, null, null, body)
        .catchError((error) { debugPrint('error : $error'); });

    return ((response != null) && (response['code'] == 200));
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

  Future<bool> signup() async {
    final response = await
      APIManager().request(RequestType.POST, SIGNUP_URL, null, null, _signupRequest.toJson());

    if ((response != null) && (response['code'] == 200)) {
      // TODO: 요청 성공할 경우 토큰 저장

      return true;
    } else { return false; }
  }

}