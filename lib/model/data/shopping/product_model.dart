
import 'package:json_annotation/json_annotation.dart';
import 'package:psr/model/data/general_model.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductResponseModel extends GeneralModel {
  final Product data;

  ProductResponseModel({
    required super.code,
    required super.message,
    required this.data,
  });

  factory ProductResponseModel.fromJson(Map<String, dynamic> json)
  => _$ProductResponseModelFromJson(json);
}

@JsonSerializable()
class Product {
  final bool isOwner;
  final String category;
  final List<String> imgList;
  final int userId;
  final String nickname;
  final int numOfLikes;
  final String name;
  final int price;
  final String description;
  final bool isLike;

  Product({
    required this.isOwner,
    required this.category,
    required this.imgList,
    required this.userId,
    required this.nickname,
    required this.numOfLikes,
    required this.name,
    required this.price,
    required this.description,
    required this.isLike,
  });

  factory Product.fromJson(Map<String, dynamic> json)
  => _$ProductFromJson(json);
}