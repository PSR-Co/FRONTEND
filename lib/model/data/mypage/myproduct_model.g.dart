// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'myproduct_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyProductModel _$MyProductModelFromJson(Map<String, dynamic> json) =>
    MyProductModel(
      code: json['code'] as int,
      message: json['message'] as String,
      data: MyProductData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyProductModelToJson(MyProductModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

MyProductData _$MyProductDataFromJson(Map<String, dynamic> json) =>
    MyProductData(
      productList: MyProductContent.fromJson(
          json['productList'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyProductDataToJson(MyProductData instance) =>
    <String, dynamic>{
      'productList': instance.productList,
    };

MyProductContent _$MyProductContentFromJson(Map<String, dynamic> json) =>
    MyProductContent(
      content: (json['content'] as List<dynamic>)
          .map((e) => MyProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MyProductContentToJson(MyProductContent instance) =>
    <String, dynamic>{
      'content': instance.content,
    };

MyProduct _$MyProductFromJson(Map<String, dynamic> json) => MyProduct(
      productId: json['productId'] as int,
      imgUrl: json['imgUrl'] as String?,
      category: json['category'] as String,
      name: json['name'] as String,
      price: json['price'] as int,
    );

Map<String, dynamic> _$MyProductToJson(MyProduct instance) => <String, dynamic>{
      'productId': instance.productId,
      'imgUrl': instance.imgUrl,
      'category': instance.category,
      'name': instance.name,
      'price': instance.price,
    };
