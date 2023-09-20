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
            null, body)
        .catchError((error) {
      debugPrint('error : $error');
    })
    ;

    return (response == null) ? null : EditOrderModel.fromJson(response);
  }

  Future<dynamic> editOrderStatus(int orderId, Map<String, dynamic> status) async {
    final response = await APIManager().request(RequestType.PATCH, '$ORDER_DETAIL/$orderId/status', null, null, status);
    return (response == null) ? null : EditOrderModel.fromJson(response);
  }
}
