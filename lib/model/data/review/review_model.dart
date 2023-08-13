
import 'package:json_annotation/json_annotation.dart';
import 'package:psr/model/data/general_model.dart';

import '../shopping/shopping_main_model.dart';

part 'review_model.g.dart';

@JsonSerializable()
class ReviewListResponseModel extends GeneralModel {
  final ReviewListInfo data;

  ReviewListResponseModel({
    required super.code,
    required super.message,
    required this.data,
  });

  factory ReviewListResponseModel.fromJson(Map<String, dynamic> json)
  => _$ReviewListResponseModelFromJson(json);
}

@JsonSerializable()
class ReviewListInfo {
  final List<Review> content;
  final Pageable pageable;
  final bool last;
  final int totalPages;
  final int totalElements;
  final int size;
  final int number;
  final Sort sort;
  final bool first;
  final int numberOfElements;
  final bool empty;

  ReviewListInfo({
    required this.content,
    required this.pageable,
    required this.last,
    required this.totalPages,
    required this.totalElements,
    required this.size,
    required this.number,
    required this.sort,
    required this.first,
    required this.numberOfElements,
    required this.empty,
  });

  factory ReviewListInfo.fromJson(Map<String, dynamic> json)
  => _$ReviewListInfoFromJson(json);
}

@JsonSerializable()
class Review {
  final int reviewId;
  final int rating;
  final String content;
  final List<String>? imgList;
  final String reviewedDate;
  final String nickName;
  final String? profileImgKey;

  Review({
    required this.reviewId,
    required this.rating,
    required this.content,
    required this.imgList,
    required this.reviewedDate,
    required this.nickName,
    required this.profileImgKey,
  });

  factory Review.fromJson(Map<String, dynamic> json)
  => _$ReviewFromJson(json);
}