import 'package:json_annotation/json_annotation.dart';
import 'package:psr/model/data/general_model.dart';

part 'mypage_model.g.dart';

@JsonSerializable()
class MyPageModel extends GeneralModel {
  final MyPageData data;

  MyPageModel(
      {required super.code, required super.message, required this.data});

  factory MyPageModel.fromJson(Map<String, dynamic> json) =>
      _$MyPageModelFromJson(json);
}

@JsonSerializable()
class MyPageData {
  final MyPageContent productList;

  MyPageData({required this.productList});

  factory MyPageData.fromJson(Map<String, dynamic> json) =>
      _$MyPageDataFromJson(json);
}

@JsonSerializable()
class MyPageContent {
  final List<MyPage> content;

  MyPageContent({required this.content});

  factory MyPageContent.fromJson(Map<String, dynamic> json) =>
      _$MyPageContentFromJson(json);
}

@JsonSerializable()
class MyPage {
  final int productId;
  final String? imgUrl;
  final String category;
  final String name;
  final int price;

  MyPage(
      {required this.productId,
      required this.imgUrl,
      required this.category,
      required this.name,
      required this.price});

  factory MyPage.fromJson(Map<String, dynamic> json) =>
      _$MyPageFromJson(json);
}
