// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => HomeModel(
      code: json['code'] as int,
      message: json['message'] as String,
      data: HomeData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

HomeData _$HomeDataFromJson(Map<String, dynamic> json) => HomeData(
      mainTopProductList: (json['mainTopProductList'] as List<dynamic>)
          .map((e) => MainTop.fromJson(e as Map<String, dynamic>))
          .toList(),
      recentProductList: (json['recentProductList'] as List<dynamic>)
          .map((e) => RecentProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      popularProductList: (json['popularProductList'] as List<dynamic>)
          .map((e) => PopularProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeDataToJson(HomeData instance) => <String, dynamic>{
      'mainTopProductList': instance.mainTopProductList,
      'recentProductList': instance.recentProductList,
      'popularProductList': instance.popularProductList,
    };

MainTop _$MainTopFromJson(Map<String, dynamic> json) => MainTop(
      id: json['id'] as int,
      category: json['category'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$MainTopToJson(MainTop instance) => <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'name': instance.name,
      'description': instance.description,
    };

RecentProduct _$RecentProductFromJson(Map<String, dynamic> json) =>
    RecentProduct(
      id: json['id'] as int,
      imgUrl: json['imgUrl'] as String?,
      name: json['name'] as String,
    );

Map<String, dynamic> _$RecentProductToJson(RecentProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imgUrl': instance.imgUrl,
      'name': instance.name,
    };

PopularProduct _$PopularProductFromJson(Map<String, dynamic> json) =>
    PopularProduct(
      id: json['id'] as int,
      imgUrl: json['imgUrl'] as String?,
      name: json['name'] as String,
    );

Map<String, dynamic> _$PopularProductToJson(PopularProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imgUrl': instance.imgUrl,
      'name': instance.name,
    };
