import '../../model/network/api_manager.dart';

class CSService {
  final NOTICE_MAIN_URL = '/cs/notices';

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
    final response = await APIManager().request(
        RequestType.GET, '$NOTICE_MAIN_URL/${noticeId.toString()}', null, null, null);
    return response;
  }
}
