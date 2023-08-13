import 'package:json_annotation/json_annotation.dart';
import 'package:psr/model/data/general_model.dart';

part 'review_model.g.dart';

@JsonSerializable()
class ReviewResponseModel extends GeneralModel {
  final ReviewInfo data;

  ReviewResponseModel({
    required super.code,
    required super.message,
    required this.data,
  });

  factory ReviewResponseModel.fromJson(Map<String, dynamic> json)
  => _$ReviewResponseModelFromJson(json);
}

@JsonSerializable()
class ReviewInfo {
  final int numOfReviews;
  final double avgOfRating;
  final List<Review> reviewList;

  ReviewInfo({
    required this.numOfReviews,
    required this.avgOfRating,
    required this.reviewList,
  });

  factory ReviewInfo.fromJson(Map<String, dynamic> json)
  => _$ReviewInfoFromJson(json);
}

@JsonSerializable()
class Review {
  final String? imgUrl;
  final int rating;
  final String content;

  Review({
    required this.imgUrl,
    required this.rating,
    required this.content,
  });

  factory Review.fromJson(Map<String, dynamic> json)
  => _$ReviewFromJson(json);
}