import 'package:json_annotation/json_annotation.dart';
import 'package:psr/model/data/general_model.dart';

part 'like_model.g.dart';

@JsonSerializable()
class LikeModel extends GeneralModel {
  final LikeData data;

  LikeModel(
      {required super.code, required super.message, required this.data});

  factory LikeModel.fromJson(Map<String, dynamic> json) =>
      _$LikeModelFromJson(json);
}

@JsonSerializable()
class LikeData {
  final LikeContent productList;

  LikeData({required this.productList});

  factory LikeData.fromJson(Map<String, dynamic> json) =>
      _$LikeDataFromJson(json);
}

@JsonSerializable()
class LikeContent {
  final List<Like> content;

  LikeContent({required this.content});

  factory LikeContent.fromJson(Map<String, dynamic> json) =>
      _$LikeContentFromJson(json);
}

@JsonSerializable()
class Like {
  final int productId;
  final String? imgUrl;
  final String category;
  // final String nickname;
  final String name;
  final int price;

  Like(
      {required this.productId,
        required this.imgUrl,
        required this.category,
        // required this.nickname,
        required this.name,
        required this.price});

  factory Like.fromJson(Map<String, dynamic> json) =>
      _$LikeFromJson(json);
}
