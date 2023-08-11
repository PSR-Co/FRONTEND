import 'package:json_annotation/json_annotation.dart';
import 'package:psr/model/data/general_model.dart';

part 'shopping_main_model.g.dart';

@JsonSerializable()
class ShoppingMainResponse extends GeneralModel {

  final ProductsData data;

  ShoppingMainResponse({
    required super.code,
    required super.message,
    required this.data
  });

  factory ShoppingMainResponse.fromJson(Map<String, dynamic> json)
  => _$ShoppingMainResponseFromJson(json);
}

@JsonSerializable()
class ProductsData {
  final List<PopularProduct> popularList;
  final ProductList productList;

  ProductsData({
    required this.popularList,
    required this.productList,
  });

  factory ProductsData.fromJson(Map<String, dynamic> json)
  => _$ProductsDataFromJson(json);
}

@JsonSerializable()
class PopularProduct {
  final int productId;
  final String imgUrl;
  final String name;
  final int price;
  final bool isLike;
  final double avgOfRating;
  final int numOfReview;

  PopularProduct({
    required this.productId,
    required this.imgUrl,
    required this.name,
    required this.price,
    required this.isLike,
    required this.avgOfRating,
    required this.numOfReview,
  });

  factory PopularProduct.fromJson(Map<String, dynamic> json)
  => _$PopularProductFromJson(json);
}

@JsonSerializable()
class ProductList {
  final List<Product> content;
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

  ProductList({
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

  factory ProductList.fromJson(Map<String, dynamic> json)
  => _$ProductListFromJson(json);
}

@JsonSerializable()
class Pageable {
  final Sort sort;
  final int offset;
  final int pageNumber;
  final int pageSize;
  final bool paged;
  final bool unpaged;

  Pageable({
    required this.sort,
    required this.offset,
    required this.pageNumber,
    required this.pageSize,
    required this.paged,
    required this.unpaged,
  });

  factory Pageable.fromJson(Map<String, dynamic> json)
  => _$PageableFromJson(json);
}

@JsonSerializable()
class Sort {
  final bool empty;
  final bool sorted;
  final bool unsorted;

  Sort({
    required this.empty,
    required this.sorted,
    required this.unsorted,
  });

  factory Sort.fromJson(Map<String, dynamic> json)
  => _$SortFromJson(json);
}

@JsonSerializable()
class Product {
  final int productId;
  final String imgUrl;
  final int userId;
  final String nickname;
  final String name;
  final int price;
  final bool isLike;

  Product({
    required this.productId,
    required this.imgUrl,
    required this.userId,
    required this.nickname,
    required this.name,
    required this.price,
    required this.isLike,
  });

  factory Product.fromJson(Map<String, dynamic> json)
  => _$ProductFromJson(json);
}
