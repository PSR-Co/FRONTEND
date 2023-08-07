import '../../model/network/api_manager.dart';

class ShoppingService {
  final SHOPPING_MAIN_URL = '/products';

  /// Singleton Pattern
  static final ShoppingService _shoppingService = ShoppingService._();
  ShoppingService._();
  factory ShoppingService() {
    return _shoppingService;
  }

  Future<dynamic> getShoppingMainData(String category) async {
    final response = await APIManager().request(
        RequestType.GET,
        SHOPPING_MAIN_URL,
        null,
        {"category" : category},
        null
    );
    return response;
  }
}