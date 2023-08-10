import 'package:json_annotation/json_annotation.dart';
import 'package:psr/model/data/general_model.dart';

part 'home_model.dart';

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => HomeModel(
    code: json['code'] as int,
    message: json['message'] as String,
    data: HomeData.fromJson(json['data'] as Map<String, dynamic>));

HomeData _$HomeDataFromJson(Map<String, dynamic> json) => HomeData(
    mainTopProductList: (json['mainTopProductList'] as List<dynamic>)
        .map((e) => MainTop.fromJson(e as Map<String, dynamic>))
        .toList(),
    recentProductList: (json['recentProductList'] as List<dynamic>)
        .map((e) => RecentProduct.fromJson(e as Map<String, dynamic>))
        .toList(),
    popularProductList: (json['popularProductList'] as List<dynamic>)
        .map((e) => PopularProduct.fromJson(e as Map<String, dynamic>))
        .toList());

MainTop _$MainTopFromJson(Map<String, dynamic> json) => MainTop(
    id: json['id'] as int,
    category: json['category'] as String,
    name: json['name'] as String,
    description: json['description'] as String);

RecentProduct _$RecentProductFromJson(Map<String, dynamic> json) =>
    RecentProduct(
        id: json['id'] as int,
        imgUrl: json['imgUrl'] as String,
        name: json['name'] as String);

PopularProduct _$PopularProductFromJson(Map<String, dynamic> json) =>
    PopularProduct(
        id: json['id'] as int,
        imgUrl: json['imgUrl'] as String,
        name: json['name'] as String);
