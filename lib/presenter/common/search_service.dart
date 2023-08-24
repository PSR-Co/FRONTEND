import 'package:psr/model/network/api_manager.dart';

class SearchService {
  final SEARCH_URL = '/products/search';

  /// Singleton Pattern
  static final SearchService _searchService = SearchService._();
  SearchService._();
  factory SearchService() {
    return _searchService;
  }

  dynamic getSearchResultData(String keyword, String? sort) async {
    String sortType = (sort == null) ? "최신순" : sort!;
    final response = await APIManager().request(
        RequestType.GET,
        SEARCH_URL,
        null,
        {
          "keyword" : keyword,
          "sortType" : sortType,
        },
        null
    );
    return  response;
  }

}