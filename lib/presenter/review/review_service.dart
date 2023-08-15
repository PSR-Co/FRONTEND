
import '../../model/data/review/review_model.dart';
import '../../model/network/api_manager.dart';

class ReviewService {
  final REVIEW_LIST_URL = '/products';
  final REVIEW_URL = '/reviews';
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

  Future<dynamic> getReviewData(String reviewId) async {
    final response = await APIManager().request(
        RequestType.GET,
        '$REVIEW_URL/$reviewId'
        ,null ,null, null);
    return response;
  }

  Future<bool> addReview(int orderId, int rating, String content, List<String> imgKeyList) async {
    final body = AddReview(
        rating: rating,
        content: content,
        imgList: (imgKeyList.isEmpty) ? null : imgKeyList
    ).toJson();

    final response = await APIManager().request(
        RequestType.POST,
        '$REVIEW_POST_URL/$orderId/review',
        null, null, body);
    return ((response != null) && (response['code'] == 200));
  }

  Future<bool> declareReview(String reviewId, String reason) async {
    String? type;
    switch (reason) {
      case '스팸홍보/도배': type = 'JUNK';
      case '욕설/혐오/차별': type = 'ABUSE';
      case '음란물/유해한 정보': type = 'PORN';
      case '사기/불법정보': type = 'FRAUD';
      case '게시글 성격에 부적합함': type = 'NOT_FIT';
    }

    final body = {'category': type};
    final response = await APIManager().request(
        RequestType.POST,
        '$REVIEW_URL/$reviewId/report'
        , null, null, body);
    return ((response != null) && (response['code'] == 200));
  }
}