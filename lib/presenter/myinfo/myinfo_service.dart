import 'package:psr/model/data/myinfo/myinfo_model.dart';
import 'package:psr/model/network/api_manager.dart';

class MyInfoService {
  final MY_INFO = '/users/mypage';
  final CHANGE_PW = '/users/password-change';
  final LOGOUT = '/users/logout';
  final WITHDRAWAL = '/users/signout';
  final EDIT_NOTIFICATION_PERMISSION = '/users/notification';

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
    return response;
  }
  
  Future<dynamic> withdrawal() async {
    final response = APIManager().request(RequestType.DELETE, WITHDRAWAL, null, null, null);
    return response;
  }

  Future<bool> editNotificationPermission() async {
    final response = await APIManager().request(RequestType.POST, EDIT_NOTIFICATION_PERMISSION, null, null, null);
    final result = NotificationModel.fromJson(response);
    if (response == null) { return false; }
    else { return result.data.notification; }
  }
}
