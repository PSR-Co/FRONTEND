import 'package:json_annotation/json_annotation.dart';

import '../general_model.dart';

part 'home_notice_model.g.dart';

@JsonSerializable()
class HomeNoticeModel extends GeneralModel {
  final HomeNoticeData data;

  HomeNoticeModel(
      {required super.code, required super.message, required this.data});

  factory HomeNoticeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeNoticeModelFromJson(json);
}

@JsonSerializable()
class HomeNoticeData {
  final List<HomeNotice> noticeLists;

  HomeNoticeData({required this.noticeLists});

  factory HomeNoticeData.fromJson(Map<String, dynamic> json) =>
      _$HomeNoticeDataFromJson(json);
}

@JsonSerializable()
class HomeNotice {
  final int noticeId;
  final String title;

  HomeNotice({required this.noticeId, required this.title});

  factory HomeNotice.fromJson(Map<String, dynamic> json) =>
      _$HomeNoticeFromJson(json);
}
