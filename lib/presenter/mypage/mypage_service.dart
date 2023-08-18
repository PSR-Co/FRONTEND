import 'package:psr/model/network/api_manager.dart';

class MyPageService {
  final MY_PRODUCT = '/products/myproducts';
  final LIKE = '/products/likes';
  static final MyPageService _myPageService = MyPageService._();

  MyPageService._();

  factory MyPageService() {
    return _myPageService;
  }

  Future<dynamic> getMyProduct() async {
    final response = await APIManager()
        .request(RequestType.GET, MY_PRODUCT, null, null, null);
    return response;
  }

  Future<dynamic> getLikes() async {
    final response = await APIManager().request(RequestType.GET, LIKE, null, null, null);
    print('response: $response');
    return response;
  }
}
