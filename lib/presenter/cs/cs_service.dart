import 'package:flutter/cupertino.dart';

import '../../model/network/api_manager.dart';

class CSService {
  final NOTICE_MAIN_URL = '/cs/notices';
  final FAQ_MAIN_URL = '/cs/faqs';
  final HOME_NOTICE_URL = '/cs/notices/home';

  /// Singleton Pattern
  static final CSService _csService = CSService._();

  CSService._();

  factory CSService() {
    return _csService;
  }

  Future<dynamic> getNoticeMainData() async {
    final response = await APIManager()
        .request(RequestType.GET, NOTICE_MAIN_URL, null, null, null);
    return response;
  }

  Future<dynamic> getNoticeDetailData(int noticeId) async {
    final response = await APIManager().request(RequestType.GET,
        '$NOTICE_MAIN_URL/${noticeId.toString()}', null, null, null);
    return response;
  }

  Future<dynamic> getFAQData(Map<String, String>? queryParameters) async {
    final response = await APIManager()
        .request(RequestType.GET, FAQ_MAIN_URL, null, queryParameters, null);

    if (response['data']['faqLists'] != null) {
      return response;
    }
  }

  Future<dynamic> getFAQDetailData(int faqId) async {
    final response = await APIManager().request(
        RequestType.GET, '$FAQ_MAIN_URL/${faqId.toString()}', null, null, null);
    return response;
  }

  Future<dynamic> getHomeNoticeData() async {
    final response = await APIManager().request(
        RequestType.GET, HOME_NOTICE_URL, null, null, null);
    return response;
  }
}
