// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProductResponse _$UserProductResponseFromJson(Map<String, dynamic> json) =>
    UserProductResponse(
      code: json['code'] as int,
      message: json['message'] as String,
      data: UserProductInfo.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserProductResponseToJson(
        UserProductResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

UserProductInfo _$UserProductInfoFromJson(Map<String, dynamic> json) =>
    UserProductInfo(
      imgUrl: json['imgUrl'] as String,
      type: json['type'] as String,
      nickname: json['nickname'] as String,
      productList:
          UserProductList.fromJson(json['productList'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserProductInfoToJson(UserProductInfo instance) =>
    <String, dynamic>{
      'imgUrl': instance.imgUrl,
      'type': instance.type,
      'nickname': instance.nickname,
      'productList': instance.productList,
    };

UserProductList _$UserProductListFromJson(Map<String, dynamic> json) =>
    UserProductList(
      content: (json['content'] as List<dynamic>)
          .map((e) => UserProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserProductListToJson(UserProductList instance) =>
    <String, dynamic>{
      'content': instance.content,
    };

UserProduct _$UserProductFromJson(Map<String, dynamic> json) => UserProduct(
      productId: json['productId'] as int,
      imgUrl: json['imgUrl'] as String,
      category: json['category'] as String,
      name: json['name'] as String,
      price: json['price'] as String,
    );

Map<String, dynamic> _$UserProductToJson(UserProduct instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'imgUrl': instance.imgUrl,
      'category': instance.category,
      'name': instance.name,
      'price': instance.price,
    };
