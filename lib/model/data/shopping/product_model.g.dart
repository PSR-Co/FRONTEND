// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      code: json['code'] as int,
      message: json['message'] as String,
      data: ProductsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

ProductsData _$ProductsDataFromJson(Map<String, dynamic> json) => ProductsData(
      popularList: (json['popularList'] as List<dynamic>)
          .map((e) => PopularProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      productList:
          ProductList.fromJson(json['productList'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductsDataToJson(ProductsData instance) =>
    <String, dynamic>{
      'popularList': instance.popularList,
      'productList': instance.productList,
    };

PopularProduct _$PopularProductFromJson(Map<String, dynamic> json) =>
    PopularProduct(
      productId: json['productId'] as int,
      imgUrl: json['imgUrl'] as String,
      name: json['name'] as String,
      price: json['price'] as int,
      isLike: json['isLike'] as bool,
      avgOfRating: (json['avgOfRating'] as num).toDouble(),
      numOfReview: json['numOfReview'] as int,
    );

Map<String, dynamic> _$PopularProductToJson(PopularProduct instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'imgUrl': instance.imgUrl,
      'name': instance.name,
      'price': instance.price,
      'isLike': instance.isLike,
      'avgOfRating': instance.avgOfRating,
      'numOfReview': instance.numOfReview,
    };

ProductList _$ProductListFromJson(Map<String, dynamic> json) => ProductList(
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

Map<String, dynamic> _$ProductListToJson(ProductList instance) =>
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

Pageable _$PageableFromJson(Map<String, dynamic> json) => Pageable(
      sort: Sort.fromJson(json['sort'] as Map<String, dynamic>),
      offset: json['offset'] as int,
      pageNumber: json['pageNumber'] as int,
      pageSize: json['pageSize'] as int,
      paged: json['paged'] as bool,
      unpaged: json['unpaged'] as bool,
    );

Map<String, dynamic> _$PageableToJson(Pageable instance) => <String, dynamic>{
      'sort': instance.sort,
      'offset': instance.offset,
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'paged': instance.paged,
      'unpaged': instance.unpaged,
    };

Sort _$SortFromJson(Map<String, dynamic> json) => Sort(
      empty: json['empty'] as bool,
      sorted: json['sorted'] as bool,
      unsorted: json['unsorted'] as bool,
    );

Map<String, dynamic> _$SortToJson(Sort instance) => <String, dynamic>{
      'empty': instance.empty,
      'sorted': instance.sorted,
      'unsorted': instance.unsorted,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      productId: json['productId'] as int,
      imgUrl: json['imgUrl'] as String,
      userId: json['userId'] as int,
      nickname: json['nickname'] as String,
      name: json['name'] as String,
      price: json['price'] as int,
      isLike: json['isLike'] as bool,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'productId': instance.productId,
      'imgUrl': instance.imgUrl,
      'userId': instance.userId,
      'nickname': instance.nickname,
      'name': instance.name,
      'price': instance.price,
      'isLike': instance.isLike,
    };
