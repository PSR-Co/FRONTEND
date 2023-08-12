import 'package:psr/model/network/api_manager.dart';

class OrderService {
  final ORDER_DETAIL = '/orders/';

  static final OrderService _orderService = OrderService._();

  OrderService._();

  factory OrderService(){return _orderService;}

  Future<dynamic> getOrderData(int orderId) async {
    final response = await APIManager().request(RequestType.GET, 'ORDER_DETAIL$orderId', null, null, null);
    return response;
  }
}