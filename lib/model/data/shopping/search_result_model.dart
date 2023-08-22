import 'package:json_annotation/json_annotation.dart';
import 'package:psr/model/data/general_model.dart';
import 'package:psr/model/data/shopping/shopping_main_model.dart';

@JsonSerializable()
class SearchResultResponse extends GeneralModel {
  final SearchResult data;

  SearchResultResponse({
    required super.code,
    required super.message,
    required this.data,
  });

}

@JsonSerializable()
class SearchResult {
  final ResultList productList;

  SearchResult({
    required this.productList
  });
}

@JsonSerializable()
class ResultList {
  final List<ResultProduct> content;
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

  ResultList({
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
}

@JsonSerializable()
class ResultProduct {
  final int productId;
  final String imgUrl;
  final int userId;
  final String nickname;
  final String name;
  final int price;
  final bool isLike;

  ResultProduct({
    required this.productId,
    required this.imgUrl,
    required this.userId,
    required this.nickname,
    required this.name,
    required this.price,
    required this.isLike,
  });
}