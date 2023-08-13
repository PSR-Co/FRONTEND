import 'package:json_annotation/json_annotation.dart';
import 'package:psr/model/data/general_model.dart';

part 'review_preview_model.g.dart';

@JsonSerializable()
class ReviewPreviewResponseModel extends GeneralModel {
  final ReviewPreviewInfo data;

  ReviewPreviewResponseModel({
    required super.code,
    required super.message,
    required this.data,
  });

  factory ReviewPreviewResponseModel.fromJson(Map<String, dynamic> json)
  => _$ReviewPreviewResponseModelFromJson(json);
}

@JsonSerializable()
class ReviewPreviewInfo {
  final int numOfReviews;
  final double avgOfRating;
  final List<ReviewPreview> reviewList;

  ReviewPreviewInfo({
    required this.numOfReviews,
    required this.avgOfRating,
    required this.reviewList,
  });

  factory ReviewPreviewInfo.fromJson(Map<String, dynamic> json)
  => _$ReviewPreviewInfoFromJson(json);
}

@JsonSerializable()
class ReviewPreview {
  final String? imgUrl;
  final int rating;
  final String content;

  ReviewPreview({
    required this.imgUrl,
    required this.rating,
    required this.content,
  });

  factory ReviewPreview.fromJson(Map<String, dynamic> json)
  => _$ReviewPreviewFromJson(json);
}