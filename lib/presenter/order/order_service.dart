import 'package:psr/model/network/api_manager.dart';

class OrderService {
  final ORDER_DETAIL = '/orders';

  static final OrderService _orderService = OrderService._();

  OrderService._();

  factory OrderService(){return _orderService;}

  Future<dynamic> getOrderData(Map<String, dynamic> queryParameters) async {
    final response = await APIManager().request(RequestType.GET, ORDER_DETAIL, null, queryParameters, null);
    print('response: $response');
    return response;
  }
}