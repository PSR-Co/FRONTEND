// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponseModel _$ProductResponseModelFromJson(
        Map<String, dynamic> json) =>
    ProductResponseModel(
      code: json['code'] as int,
      message: json['message'] as String,
      data: Product.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductResponseModelToJson(
        ProductResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      isOwner: json['isOwner'] as bool,
      category: json['category'] as String,
      imgList:
          (json['imgList'] as List<dynamic>).map((e) => e as String).toList(),
      userId: json['userId'] as int,
      nickname: json['nickname'] as String,
      numOfLikes: json['numOfLikes'] as int,
      name: json['name'] as String,
      price: json['price'] as int,
      description: json['description'] as String,
      isLike: json['isLike'] as bool,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'isOwner': instance.isOwner,
      'category': instance.category,
      'imgList': instance.imgList,
      'userId': instance.userId,
      'nickname': instance.nickname,
      'numOfLikes': instance.numOfLikes,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
      'isLike': instance.isLike,
    };
