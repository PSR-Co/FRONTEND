// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LikeModel _$LikeModelFromJson(Map<String, dynamic> json) => LikeModel(
      code: json['code'] as int,
      message: json['message'] as String,
      data: LikeData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LikeModelToJson(LikeModel instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

LikeData _$LikeDataFromJson(Map<String, dynamic> json) => LikeData(
      productList:
          LikeContent.fromJson(json['productList'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LikeDataToJson(LikeData instance) => <String, dynamic>{
      'productList': instance.productList,
    };

LikeContent _$LikeContentFromJson(Map<String, dynamic> json) => LikeContent(
      content: (json['content'] as List<dynamic>)
          .map((e) => Like.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LikeContentToJson(LikeContent instance) =>
    <String, dynamic>{
      'content': instance.content,
    };

Like _$LikeFromJson(Map<String, dynamic> json) => Like(
      productId: json['productId'] as int,
      imgUrl: json['imgUrl'] as String?,
      category: json['category'] as String,
      // nickname: json['nickname'] as String,
      name: json['name'] as String,
      price: json['price'] as int,
    );

Map<String, dynamic> _$LikeToJson(Like instance) => <String, dynamic>{
      'productId': instance.productId,
      'imgUrl': instance.imgUrl,
      'category': instance.category,
      // 'nickname': instance.nickname,
      'name': instance.name,
      'price': instance.price,
    };
