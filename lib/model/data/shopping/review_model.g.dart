// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewResponseModel _$ReviewResponseModelFromJson(Map<String, dynamic> json) =>
    ReviewResponseModel(
      code: json['code'] as int,
      message: json['message'] as String,
      data: ReviewInfo.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReviewResponseModelToJson(
        ReviewResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

ReviewInfo _$ReviewInfoFromJson(Map<String, dynamic> json) => ReviewInfo(
      numOfReviews: json['numOfReviews'] as int,
      avgOfRating: (json['avgOfRating'] as num).toDouble(),
      reviewList: (json['reviewList'] as List<dynamic>)
          .map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReviewInfoToJson(ReviewInfo instance) =>
    <String, dynamic>{
      'numOfReviews': instance.numOfReviews,
      'avgOfRating': instance.avgOfRating,
      'reviewList': instance.reviewList,
    };

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      imgUrl: json['imgUrl'] as String?,
      rating: json['rating'] as int,
      content: json['content'] as String,
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'imgUrl': instance.imgUrl,
      'rating': instance.rating,
      'content': instance.content,
    };
