
import 'package:json_annotation/json_annotation.dart';
import 'package:psr/model/data/general_model.dart';

part 'user_product_model.g.dart';

@JsonSerializable()
class UserProductResponse extends GeneralModel {
  final UserProductInfo data;

  UserProductResponse({
    required super.code,
    required super.message,
    required this.data,
  });

  factory UserProductResponse.fromJson(Map<String, dynamic> json)
  => _$UserProductResponseFromJson(json);
}

@JsonSerializable()
class UserProductInfo {
  final String imgUrl;
  final String type;
  final String nickname;
  final UserProductList productList;

  UserProductInfo({
    required this.imgUrl,
    required this.type,
    required this.nickname,
    required this.productList,
  });

  factory UserProductInfo.fromJson(Map<String, dynamic> json)
  => _$UserProductInfoFromJson(json);
}

@JsonSerializable()
class UserProductList {
  final List<UserProduct> content;

  UserProductList({
    required this.content,
  });

  factory UserProductList.fromJson(Map<String, dynamic> json)
  => _$UserProductListFromJson(json);
}

@JsonSerializable()
class UserProduct {
  final int productId;
  final String imgUrl;
  final String category;
  final String name;
  final String price;

  UserProduct({
    required this.productId,
    required this.imgUrl,
    required this.category,
    required this.name,
    required this.price,
  });

  factory UserProduct.fromJson(Map<String, dynamic> json)
  => _$UserProductFromJson(json);
}