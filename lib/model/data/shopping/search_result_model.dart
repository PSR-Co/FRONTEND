import 'package:json_annotation/json_annotation.dart';
import 'package:psr/model/data/general_model.dart';
import 'package:psr/model/data/shopping/shopping_main_model.dart';

part 'search_result_model.g.dart';

@JsonSerializable()
class SearchResultResponse extends GeneralModel {
  final SearchResult data;

  SearchResultResponse({
    required super.code,
    required super.message,
    required this.data,
  });

  factory SearchResultResponse.fromJson(Map<String, dynamic> json)
  => _$SearchResultResponseFromJson(json);
}

@JsonSerializable()
class SearchResult {
  final ResultList productList;

  SearchResult({
    required this.productList
  });

  factory SearchResult.fromJson(Map<String, dynamic> json)
  => _$SearchResultFromJson(json);
}

@JsonSerializable()
class ResultList {
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

  factory ResultList.fromJson(Map<String, dynamic> json)
  => _$ResultListFromJson(json);
}