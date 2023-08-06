// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      code: json['code'] as int,
      message: json['message'] as String,
      data: ProductsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

ProductsData _$ProductsDataFromJson(Map<String, dynamic> json) => ProductsData(
      popularList: (json['popularList'] as List<dynamic>)
          .map((e) => PopularProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      productList: (json['productList'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductsDataToJson(ProductsData instance) =>
    <String, dynamic>{
      'popularList': instance.popularList,
      'productList': instance.productList,
    };

PopularProduct _$PopularProductFromJson(Map<String, dynamic> json) =>
    PopularProduct(
      productId: json['productId'] as int,
      imgKey: json['imgKey'] as String,
      name: json['name'] as String,
      price: json['price'] as int,
      numOfLike: json['numOfLike'] as int,
      isLike: json['isLike'] as bool,
      avgOfRating: (json['avgOfRating'] as num).toDouble(),
      numOfReview: json['numOfReview'] as int,
    );

Map<String, dynamic> _$PopularProductToJson(PopularProduct instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'imgKey': instance.imgKey,
      'name': instance.name,
      'price': instance.price,
      'numOfLike': instance.numOfLike,
      'isLike': instance.isLike,
      'avgOfRating': instance.avgOfRating,
      'numOfReview': instance.numOfReview,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      productId: json['productId'] as int,
      imgKey: json['imgKey'] as String,
      userIdx: json['userIdx'] as int,
      nickname: json['nickname'] as String,
      name: json['name'] as String,
      price: json['price'] as int,
      isLike: json['isLike'] as bool,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'productId': instance.productId,
      'imgKey': instance.imgKey,
      'userIdx': instance.userIdx,
      'nickname': instance.nickname,
      'name': instance.name,
      'price': instance.price,
      'isLike': instance.isLike,
    };
