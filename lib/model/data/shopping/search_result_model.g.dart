// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResultResponse _$SearchResultResponseFromJson(
        Map<String, dynamic> json) =>
    SearchResultResponse(
      code: json['code'] as int,
      message: json['message'] as String,
      data: SearchResult.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchResultResponseToJson(
        SearchResultResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

SearchResult _$SearchResultFromJson(Map<String, dynamic> json) => SearchResult(
      productList:
          ResultList.fromJson(json['productList'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchResultToJson(SearchResult instance) =>
    <String, dynamic>{
      'productList': instance.productList,
    };

ResultList _$ResultListFromJson(Map<String, dynamic> json) => ResultList(
      content: (json['content'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageable: Pageable.fromJson(json['pageable'] as Map<String, dynamic>),
      last: json['last'] as bool,
      totalPages: json['totalPages'] as int,
      totalElements: json['totalElements'] as int,
      size: json['size'] as int,
      number: json['number'] as int,
      sort: Sort.fromJson(json['sort'] as Map<String, dynamic>),
      first: json['first'] as bool,
      numberOfElements: json['numberOfElements'] as int,
      empty: json['empty'] as bool,
    );

Map<String, dynamic> _$ResultListToJson(ResultList instance) =>
    <String, dynamic>{
      'content': instance.content,
      'pageable': instance.pageable,
      'last': instance.last,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'size': instance.size,
      'number': instance.number,
      'sort': instance.sort,
      'first': instance.first,
      'numberOfElements': instance.numberOfElements,
      'empty': instance.empty,
    };
