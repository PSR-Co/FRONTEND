
import 'package:json_annotation/json_annotation.dart';
import 'package:psr/model/data/general_model.dart';
import 'package:psr/model/data/shopping/shopping_main_model.dart';

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
  final String? imgUrl;
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
  final Pageable pageable;
  final bool last;
  final int totalPages;
  final int totalElements;
  final int size;
  final int number;
  final Sort sort;
  final bool first;
  final int numberOfElements;
  final bool empty;

  UserProductList({
    required this.content,
    required this.pageable,
    required this.last,
    required this.totalPages,
    required this.totalElements,
    required this.size,
    required this.number,
    required this.sort,
    required this.first,
    required this.numberOfElements,
    required this.empty,
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
  final int price;

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