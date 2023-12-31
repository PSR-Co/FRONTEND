// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewListResponseModel _$ReviewListResponseModelFromJson(
        Map<String, dynamic> json) =>
    ReviewListResponseModel(
      code: json['code'] as int,
      message: json['message'] as String,
      data: ReviewListInfo.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReviewListResponseModelToJson(
        ReviewListResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

ReviewListInfo _$ReviewListInfoFromJson(Map<String, dynamic> json) =>
    ReviewListInfo(
      content: (json['content'] as List<dynamic>)
          .map((e) => ReviewItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageable: Pageable.fromJson(json['pageable'] as Map<String, dynamic>),
      last: json['last'] as bool,
      totalPages: json['totalPages'] as int,
      totalElements: json['totalElements'] as int,
      size: json['size'] as int,
      number: json['number'] as int,
      sort: Sort.fromJson(json['sort'] as Map<String, dynamic>),
      first: json['first'] as bool,
      numberOfElements: json['numberOfElements'] as int,
      empty: json['empty'] as bool,
    );

Map<String, dynamic> _$ReviewListInfoToJson(ReviewListInfo instance) =>
    <String, dynamic>{
      'content': instance.content,
      'pageable': instance.pageable,
      'last': instance.last,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'size': instance.size,
      'number': instance.number,
      'sort': instance.sort,
      'first': instance.first,
      'numberOfElements': instance.numberOfElements,
      'empty': instance.empty,
    };

ReviewItem _$ReviewItemFromJson(Map<String, dynamic> json) => ReviewItem(
      reviewId: json['reviewId'] as int,
      rating: json['rating'] as int,
      content: json['content'] as String,
      imgList:
          (json['imgList'] as List<dynamic>?)?.map((e) => e as String).toList(),
      reviewedDate: json['reviewedDate'] as String,
      nickName: json['nickName'] as String,
      profileImgUrl: json['profileImgUrl'] as String?,
      isMyReview: json['isMyReview'] as bool,
    );

Map<String, dynamic> _$ReviewItemToJson(ReviewItem instance) =>
    <String, dynamic>{
      'reviewId': instance.reviewId,
      'rating': instance.rating,
      'content': instance.content,
      'imgList': instance.imgList,
      'reviewedDate': instance.reviewedDate,
      'nickName': instance.nickName,
      'profileImgUrl': instance.profileImgUrl,
      'isMyReview': instance.isMyReview,
    };

ReviewResponseModel _$ReviewResponseModelFromJson(Map<String, dynamic> json) =>
    ReviewResponseModel(
      code: json['code'] as int,
      message: json['message'] as String,
      data: Review.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReviewResponseModelToJson(
        ReviewResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      reviewId: json['reviewId'] as int,
      rating: json['rating'] as int,
      content: json['content'] as String,
      imgList:
          (json['imgList'] as List<dynamic>?)?.map((e) => e as String).toList(),
      nickname: json['nickname'] as String,
      productName: json['productName'] as String?,
      productImgUrl: json['productImgUrl'] as String?,
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'reviewId': instance.reviewId,
      'rating': instance.rating,
      'content': instance.content,
      'imgList': instance.imgList,
      'nickname': instance.nickname,
      'productName': instance.productName,
      'productImgUrl': instance.productImgUrl,
    };

AddReview _$AddReviewFromJson(Map<String, dynamic> json) => AddReview(
      rating: json['rating'] as int,
      content: json['content'] as String,
      imgList:
          (json['imgList'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AddReviewToJson(AddReview instance) => <String, dynamic>{
      'rating': instance.rating,
      'content': instance.content,
      'imgList': instance.imgList,
    };
