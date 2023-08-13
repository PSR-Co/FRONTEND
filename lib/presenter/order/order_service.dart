import 'package:psr/model/network/api_manager.dart';

class OrderService {
  final ORDER_DETAIL = '/orders';

  static final OrderService _orderService = OrderService._();

  OrderService._();

  factory OrderService(){return _orderService;}

  Future<dynamic> getOrderData(Map<String, dynamic> queryParameters) async {
    final response = await APIManager().request(RequestType.GET, ORDER_DETAIL, null, queryParameters, null);
    return response;
  }

  Future<dynamic> getOrderDetailData(int orderId) async {
    final response = await APIManager().request(RequestType.GET, '$ORDER_DETAIL/$orderId', null, null, null);
    print('response: $response');
    return response;
  }

  Future<dynamic> editOrderData(int orderId, Map<String, dynamic>? queryParameters, Map<String, dynamic> body) async {
    final response = await APIManager().request(RequestType.PATCH, '$ORDER_DETAIL/$orderId', null, queryParameters, body);
  }
}