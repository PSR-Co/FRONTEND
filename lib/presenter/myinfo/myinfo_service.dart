import 'package:psr/model/network/api_manager.dart';

class MyInfoService {
  final MY_INFO = '/users/mypage';

  static final MyInfoService _myInfoService = MyInfoService._();
  MyInfoService._();
  factory MyInfoService(){
    return _myInfoService;
  }

  Future<dynamic> getMyInfo() async {
    final response = APIManager().request(RequestType.GET, MY_INFO, null, null, null);
    print('response: $response');
    return response;
  }
}