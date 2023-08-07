import 'package:json_annotation/json_annotation.dart';
import 'package:psr/model/data/general_model.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends GeneralModel {

  final ProductsData data;

  ProductModel({
    required super.code,
    required super.message,
    required this.data
  });

  factory ProductModel.fromJson(Map<String, dynamic> json)
  => _$ProductModelFromJson(json);

  // factory ProductModel.fromJson({
  //   required Map<String, dynamic> json,
  // }) {
  //   return ProductModel(
  //       code: json['code'],
  //       message: json['message'],
  //       data: ProductsData.fromJson(json: json['data']),
  //   );
  // }
}

@JsonSerializable()
class ProductsData {
  final List<PopularProduct> popularList;
  final List<Product> productList;

  ProductsData({
    required this.popularList,
    required this.productList,
  });

  factory ProductsData.fromJson(Map<String, dynamic> json)
  => _$ProductsDataFromJson(json);

  // factory ProductsData.fromJson({
  //   required Map<String, dynamic> json,
  // }) {
  //   return ProductsData(
  //       popularList: List.from(json['popularList']).map((e) => PopularProduct.fromJson(json: e)).toList(),
  //       productList: List.from(json['productList']).map((e) => Product.fromJson(json: e)).toList(),
  //   );
  // }
}

@JsonSerializable()
class PopularProduct {
  final int productId;
  final String imgKey;
  final String name;
  final int price;
  final int numOfLike;
  final bool isLike;
  final double avgOfRating;
  final int numOfReview;

  PopularProduct({
    required this.productId,
    required this.imgKey,
    required this.name,
    required this.price,
    required this.numOfLike,
    required this.isLike,
    required this.avgOfRating,
    required this.numOfReview,
  });

  factory PopularProduct.fromJson(Map<String, dynamic> json)
  => _$PopularProductFromJson(json);

  // factory PopularProduct.fromJson({
  //   required Map<String, dynamic> json,
  // }) {
  //   return PopularProduct(
  //       productId: json['productId'],
  //       imgKey: json['imgKey'],
  //       name: json['name'],
  //       price: json['price'],
  //       numOfLike: json['numOfLike'],
  //       isLike: json['isLike'],
  //       avgOfRating: json['avgOfRating'],
  //       numOfReview: json['numOfReview']
  //   );
  // }
}

@JsonSerializable()
class Product {
  final int productId;
  final String imgKey;
  final int userIdx;
  final String nickname;
  final String name;
  final int price;
  final bool isLike;

  Product({
    required this.productId,
    required this.imgKey,
    required this.userIdx,
    required this.nickname,
    required this.name,
    required this.price,
    required this.isLike,
  });

  factory Product.fromJson(Map<String, dynamic> json)
  => _$ProductFromJson(json);

  // factory Product.fromJson(Map<String, dynamic> json)
  // => _$ProductModelFromJson(json);
  // factory Product.fromJson({
  //   required Map<String, dynamic> json,
  // }) {
  //   return Product(
  //       productId: json['productId'],
  //       imgKey: json['imgKey'],
  //       userIdx: json['userIdx'],
  //       nickname: json['nickname'],
  //       name: json['name'],
  //       price: json['price'],
  //       isLike: json['isLike']
  //   );
  // }
}