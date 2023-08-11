import '../../model/network/api_manager.dart';

class ShoppingService {
  final SHOPPING_URL = '/products';

  /// Singleton Pattern
  static final ShoppingService _shoppingService = ShoppingService._();
  ShoppingService._();
  factory ShoppingService() {
    return _shoppingService;
  }

  Future<dynamic> getShoppingMainData(String category) async {
    final response = await APIManager().request(
        RequestType.GET,
        SHOPPING_URL,
        null,
        {"category" : category},
        null
    );
    return response;
  }

  Future<dynamic> getProductData(String productId) async {
    final response = await APIManager().request(
        RequestType.GET,
        '$SHOPPING_URL/$productId',
        null, null, null);
    return response;
  }

  Future<dynamic> getReviewData(String productId) async {
    final response = await APIManager().request(
        RequestType.GET,
        '$SHOPPING_URL/$productId/reviews/top',
        null, null, null);
    return response;
  }
}