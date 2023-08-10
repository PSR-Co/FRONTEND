import 'package:flutter/cupertino.dart';

import 'package:psr/model/data/auth/signup_model.dart';
import 'package:psr/model/network/api_manager.dart';
import 'package:psr/presenter/auth/user_service.dart';

class SignupService {
  final REQUEST_VALIDATION_CODE = "/users/phone/check";
  final VALIDATE_CODE = "/users/phone/validation";
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

  Future<void> setInterestList(List<String> interests) async {
    if (await APIManager().checkToken()) {
      // 로컬에 저장된 token이 있는 경우 -> 로그인한 회원인 경우 (관심목록 변경 요청)
      UserService().requestEditInterestList(interests);

    } else {
      // 로컬에 저장된 token이 없는 경우 -> 회원가입 진행중인 경우
      interests.forEach((element) {
        _signupRequest.interestList.add(Interest(category: getTrimmedCategory(element)));
      });
    }
  }

  void setNickname(String nickname) { _signupRequest.nickname = nickname; }

  void setProfileImage(String? profileImgKey) { _signupRequest.profileImgKey = (profileImgKey == null) ? null : profileImgKey!; }


  /// helper methods
  String getTrimmedCategory(String category) {
    if (category.length > 5) { return category.replaceAll('\n', ' '); }
    else { return category.replaceAll(' ', ''); }
  }

  /// Request Methods
  Future<bool> requestValidationCode(String phoneNum) async {
    final body = {"phone": phoneNum};
    final response = await APIManager().request(RequestType.POST, REQUEST_VALIDATION_CODE, null, null, body)
        .catchError((error) { debugPrint('error : $error'); });

    return ((response != null) && (response['code'] == 200));
  }

  Future<bool> validatePhoneWithCode(String phoneNum, String code) async {
    final body = {"phone": phoneNum, "smsKey": code};
    final response = await APIManager().request(RequestType.POST, VALIDATE_CODE, null, null, body)
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
    return ((response != null) && (response['code'] == 200));
  }
}