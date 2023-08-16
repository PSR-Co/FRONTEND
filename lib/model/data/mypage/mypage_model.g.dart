// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mypage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyPageModel _$MyPageModelFromJson(Map<String, dynamic> json) =>
    MyPageModel(
      code: json['code'] as int,
      message: json['message'] as String,
      data: MyPageData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyProductModelToJson(MyPageModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

MyPageData _$MyPageDataFromJson(Map<String, dynamic> json) =>
    MyPageData(
      productList: MyPageContent.fromJson(
          json['productList'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyProductDataToJson(MyPageData instance) =>
    <String, dynamic>{
      'productList': instance.productList,
    };

MyPageContent _$MyPageContentFromJson(Map<String, dynamic> json) =>
    MyPageContent(
      content: (json['content'] as List<dynamic>)
          .map((e) => MyPage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MyProductContentToJson(MyPageContent instance) =>
    <String, dynamic>{
      'content': instance.content,
    };

MyPage _$MyPageFromJson(Map<String, dynamic> json) => MyPage(
      productId: json['productId'] as int,
      imgUrl: json['imgUrl'] as String?,
      category: json['category'] as String,
      name: json['name'] as String,
      price: json['price'] as int,
    );

Map<String, dynamic> _$MyProductToJson(MyPage instance) => <String, dynamic>{
      'productId': instance.productId,
      'imgUrl': instance.imgUrl,
      'category': instance.category,
      'name': instance.name,
      'price': instance.price,
    };
