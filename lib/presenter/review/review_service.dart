import 'package:psr/model/data/review/review_model.dart';

import '../../model/network/api_manager.dart';

class ReviewService {
  final REVIEW_LIST_URL = '/products';
  final REVIEW_GET_URL = '/reviews';
  final REVIEW_POST_URL = '/orders';

  /// Singleton Pattern
  static final ReviewService _reviewService = ReviewService._();
  ReviewService._();
  factory ReviewService() {
    return _reviewService;
  }

  Future<dynamic> getReviewListData(String productId) async {
    final response = await APIManager().request(
        RequestType.GET,
        '$REVIEW_LIST_URL/$productId/reviews'
        , null, null, null);
    return response;
  }


}