import 'package:psr/model/data/shopping/order_request_model.dart';
import 'package:psr/model/data/shopping/product_model.dart';

import '../../model/network/api_manager.dart';

class ShoppingService {
  final SHOPPING_URL = '/products';
  final REQUEST_ORDER_URL = '/orders';

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
  
  Future<bool> declareProduct(String productId, String reason) async {
    final body = {'category': reason};
    final response = await APIManager().request(
        RequestType.POST,
        '$SHOPPING_URL/$productId/report'
        , null, null, body);
    return ((response != null) && (response['code'] == 200));
  }

  Future<dynamic> getUserProductsData(String userId) async {
    final response = await APIManager().request(
        RequestType.GET,
        '$SHOPPING_URL/users/$userId',
        null, null, null);
    return response;
  }

  Future<bool> likeProduct(int productId) async {
    final response = await APIManager().request(
        RequestType.POST,
        '$SHOPPING_URL/$productId/likes',
        null, null, null);
    return ((response != null) && (response['code'] == 200));
  }


  Future<bool> requestProduct(
      int? productId,
      String category,
      String name,
      String price,
      String description,
      List<String>? imgList
      ) async {

    final body = ProductRequestModel(
        category: category,
        name: name,
        price: int.parse(price),
        description: description,
        imgList: imgList
    ).toJson();

    if (productId == null) {
      // 상품 등록 요청
      final response = await APIManager().request(
          RequestType.POST,
          SHOPPING_URL,
          null, null, body);

      return ((response != null) && (response['code'] == 200));

    } else {
      // 상품 수정 요청
      final response = await APIManager().request(
          RequestType.PATCH,
          '$SHOPPING_URL/$productId',
          null, null, body);

      return ((response != null) && (response['code'] == 200));
    }

  }

  Future<bool> deleteProduct(int productId) async {
    final response = await APIManager().request(
        RequestType.DELETE,
        '$SHOPPING_URL/$productId',
        null, null, null);
    return ((response != null) && (response['code'] == 200));
  }


  /// 요청하기 method
  Future<bool> requestOrder(
      int productId,
      String name,
      String? webUrl,
      String inquiry,
      String description
      ) async {

    final body = OrderRequest(
        productId: productId,
        ordererName: name,
        websiteUrl: webUrl,
        inquiry: inquiry, 
        description: description
    ).toJson();

    final response = await APIManager().request(
        RequestType.POST,
        REQUEST_ORDER_URL,
        null, null, body);
    return ((response != null) && (response['code'] == 200));
  }
}