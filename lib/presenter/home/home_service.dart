import 'package:psr/model/data/home/home_model.dart';
import 'package:psr/model/network/api_manager.dart';

class HomeService {
  final HOME_PRODUCT = '/products/home';
  MainTop? mainTop = MainTop(id: 0, category: '', name: '', description: '');
  RecentProduct? recentProduct = RecentProduct(id: 0, imgUrl: null, name: '');
  PopularProduct? popularProduct = PopularProduct(id: 0, imgUrl: null, name: '');
  
  static final HomeService _homeService = HomeService._();
  
  HomeService._();
  
  factory HomeService(){
    return _homeService;
  }
  
  Future<dynamic> getHomeData() async {
    final response = await APIManager().request(RequestType.GET, HOME_PRODUCT, null, null, null);
    print("response home : $response");
    return response;
  }
}