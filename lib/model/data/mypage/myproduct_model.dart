import 'package:json_annotation/json_annotation.dart';
import 'package:psr/model/data/general_model.dart';

part 'myproduct_model.g.dart';

@JsonSerializable()
class MyProductModel extends GeneralModel {
  final MyProductData data;
  MyProductModel({required super.code, required super.message, required this.data});
  factory MyProductModel.fromJson(Map<String, dynamic> json) => _$MyProductModelFromJson(json);
}

@JsonSerializable()
class MyProductData {
  final MyProductContent productList;
  MyProductData({required this.productList});
  factory MyProductData.fromJson(Map<String, dynamic> json) => _$MyProductDataFromJson(json);
}

@JsonSerializable()
class MyProductContent {
  final List<MyProduct> content;
  MyProductContent({required this.content});
  factory MyProductContent.fromJson(Map<String, dynamic> json) => _$MyProductContentFromJson(json);
}

@JsonSerializable()
class MyProduct {
  final int productId;
  final String? imgUrl;
  final String category;
  final String name;
  final int price;
  MyProduct({required this.productId, required this.imgUrl, required this.category, required this.name, required this.price});
  factory MyProduct.fromJson(Map<String, dynamic> json) => _$MyProductFromJson(json);
}