// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_preview_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewPreviewResponseModel _$ReviewPreviewResponseModelFromJson(
        Map<String, dynamic> json) =>
    ReviewPreviewResponseModel(
      code: json['code'] as int,
      message: json['message'] as String,
      data: ReviewPreviewInfo.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReviewPreviewResponseModelToJson(
        ReviewPreviewResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

ReviewPreviewInfo _$ReviewPreviewInfoFromJson(Map<String, dynamic> json) =>
    ReviewPreviewInfo(
      numOfReviews: json['numOfReviews'] as int,
      avgOfRating: (json['avgOfRating'] as num).toDouble(),
      reviewList: (json['reviewList'] as List<dynamic>)
          .map((e) => ReviewPreview.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReviewPreviewInfoToJson(ReviewPreviewInfo instance) =>
    <String, dynamic>{
      'numOfReviews': instance.numOfReviews,
      'avgOfRating': instance.avgOfRating,
      'reviewList': instance.reviewList,
    };

ReviewPreview _$ReviewPreviewFromJson(Map<String, dynamic> json) =>
    ReviewPreview(
      imgUrl: json['imgUrl'] as String?,
      rating: json['rating'] as int,
      content: json['content'] as String,
    );

Map<String, dynamic> _$ReviewPreviewToJson(ReviewPreview instance) =>
    <String, dynamic>{
      'imgUrl': instance.imgUrl,
      'rating': instance.rating,
      'content': instance.content,
    };
