part of 'home_model.g.dart';

@JsonSerializable()
class HomeModel extends GeneralModel {
  final HomeData data;

  HomeModel({required super.code, required super.message, required this.data});

  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);
}

@JsonSerializable()
class HomeData {
  final List<MainTop> mainTopProductList;
  final List<RecentProduct> recentProductList;
  final List<PopularProduct> popularProductList;

  HomeData(
      {required this.mainTopProductList,
      required this.recentProductList,
      required this.popularProductList});

  factory HomeData.fromJson(Map<String, dynamic> json) =>
      _$HomeDataFromJson(json);
}

@JsonSerializable()
class MainTop {
  final int id;
  final String category;
  final String name;
  final String description;

  MainTop(
      {required this.id,
      required this.category,
      required this.name,
      required this.description});

  factory MainTop.fromJson(Map<String, dynamic> json) =>
      _$MainTopFromJson(json);
}

@JsonSerializable()
class RecentProduct {
  final int id;
  final String imgUrl;
  final String name;

  RecentProduct({required this.id, required this.imgUrl, required this.name});

  factory RecentProduct.fromJson(Map<String, dynamic> json) =>
      _$RecentProductFromJson(json);
}

@JsonSerializable()
class PopularProduct {
  final int id;
  final String imgUrl;
  final String name;

  PopularProduct({required this.id, required this.imgUrl, required this.name});

  factory PopularProduct.fromJson(Map<String, dynamic> json) =>
      _$PopularProductFromJson(json);
}
