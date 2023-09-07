import 'package:flutter/cupertino.dart';

import 'package:psr/model/data/auth/signup_model.dart';
import 'package:psr/model/network/api_manager.dart';
import 'package:psr/presenter/auth/user_service.dart';

class SignupService {
  final VALIDATE_EID = "/users/eid";
  final REQUEST_VALIDATION_CODE = "/users/phone/check";
  final VALIDATE_CODE = "/users/phone/validation";
  final VALIDATE_NICKNAME_URL = "/users/nickname";
  final SIGNUP_URL = "/users/signup";

  bool isBusiness = false;
  EntreInfo? _eid = EntreInfo(number: '', companyDate: '', ownerName: '', companyName: '');
  SignupRequest _signupRequest = SignupRequest(email: '', password: '', type: '', phone: '', name: '', profileImgKey: null, nickname: '', marketing: true, notification: true, interestList: [], deviceToken: '');

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
    isBusiness = (selected == '사업자');
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

  void setNotificationSetting(bool notification, String? deviceToken) {
    _signupRequest.marketing = notification;
    _signupRequest.notification = notification;
    _signupRequest.deviceToken = deviceToken;
  }

  /// helper methods
  String getTotalDateStr(String year, String month, String day) {
    if (month.length == 1) { month = '0$month'; }
    if (day.length == 1) { day = '0$day'; }
    return year+month+day;
  }

  String getTrimmedCategory(String category) {
    if (category.length > 5) { return category.replaceAll('\n', ' '); }
    else { return category.replaceAll(' ', ''); }
  }

  /// Request Methods
  Future<bool> validateEid(String number, String companyDate, String ownerName, String companyName) async {
    final eid = EntreInfo(number: number, companyDate: companyDate, ownerName: ownerName, companyName: companyName);
    final response = await APIManager().request(RequestType.POST, VALIDATE_EID, null, null, eid.toJson())
        .catchError((error) { debugPrint('error : $error'); });
    if ((response != null) && (response['code'] == 200)) {
      _eid = eid;
      return true;
    }
    else { return false; }
  }

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
    if (isBusiness) { _signupRequest.entreInfo = _eid; }

    final response = await
      APIManager().request(RequestType.POST,SIGNUP_URL, null, null, _signupRequest.toJson())
          .catchError((error) { debugPrint('error : $error'); });
    return ((response != null) && (response['code'] == 200));
  }
}