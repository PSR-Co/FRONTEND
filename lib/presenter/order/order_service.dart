import 'package:flutter/cupertino.dart';
import 'package:psr/model/data/general_model.dart';
import 'package:psr/model/data/order/edit_order_model.dart';
import 'package:psr/model/network/api_manager.dart';

class OrderService {
  final ORDER_DETAIL = '/orders';

  static final OrderService _orderService = OrderService._();

  OrderService._();

  factory OrderService() {
    return _orderService;
  }

  Future<dynamic> getOrderData(Map<String, dynamic> queryParameters) async {
    final response = await APIManager()
        .request(RequestType.GET, ORDER_DETAIL, null, queryParameters, null);
    return response;
  }

  Future<dynamic> getOrderDetailData(int orderId) async {
    final response = await APIManager()
        .request(RequestType.GET, '$ORDER_DETAIL/$orderId', null, null, null);
    return response;
  }

  Future<dynamic> editOrderData(
      int orderId,
      Map<String, dynamic>? queryParameters,
      String ordererName,
      String? websiteUrl,
      String inquiry,
      String description) async {
    final body = EditOrderRequest(
            ordererName: ordererName,
            websiteUrl: websiteUrl,
            inquiry: inquiry,
            description: description)
        .toJson();
    final response = await APIManager()
        .request(RequestType.PATCH, '$ORDER_DETAIL/$orderId', null,
            queryParameters, body)
        .catchError((error) {
      debugPrint('error : $error');
    });
    print('body: $body');

    print('response: $response');
    return (response == null) ? null : GeneralModel.fromJson(response);
  }
}
