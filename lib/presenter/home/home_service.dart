import 'package:psr/model/network/api_manager.dart';

class HomeService {
  final HOME_PRODUCT = '/products/home';
  
  static final HomeService _homeService = HomeService._();
  
  HomeService._();
  
  factory HomeService(){
    return _homeService;
  }
  
  Future<dynamic> getHomeData() async {
    final response = await APIManager().request(RequestType.GET, HOME_PRODUCT, null, null, null);
    return response;
  }
}