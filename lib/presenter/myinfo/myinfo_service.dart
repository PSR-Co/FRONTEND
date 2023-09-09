import 'package:psr/model/data/myinfo/myinfo_model.dart';
import 'package:psr/model/network/api_manager.dart';

import '../../model/data/general_model.dart';

class MyInfoService {
  final MY_INFO = '/users/mypage';
  final CHANGE_PW = '/users/password-change';
  final LOGOUT = '/users/logout';


  static final MyInfoService _myInfoService = MyInfoService._();

  MyInfoService._();

  factory MyInfoService() {
    return _myInfoService;
  }

  Future<dynamic> getMyInfo() async {
    final response =
        APIManager().request(RequestType.GET, MY_INFO, null, null, null);
    print('response: $response');
    return response;
  }

  Future<dynamic> changePW(String currentPassword, String password) async {
    final body = ChangePW(currentPassword: currentPassword, password: password).toJson();

    final response = APIManager().request(RequestType.PATCH, CHANGE_PW, null, null, body);
    print('response changePW: $response');

    return response;
  }
  
  Future<dynamic> logout() async {
    final response = APIManager().request(RequestType.PATCH, LOGOUT, null, null, null);
    // print('response logout: ${GeneralModel.fromJson(response)}');
    // return (response == null) ? null : AccountModel.fromJson(response);
    // return ((response != null) && (response['code']==200));
    return response;
  }
}
