import 'package:json_annotation/json_annotation.dart';
import 'package:psr/model/data/general_model.dart';

part 'notice_model.g.dart';

///Notice Main
@JsonSerializable()
class NoticeModel extends GeneralModel {
  final NoticeData data;

  NoticeModel(
      {required super.code, required super.message, required this.data});

  factory NoticeModel.fromJson({required Map<String, dynamic> json}) =>
      _$NoticeModelFromJson(json);
}

@JsonSerializable()
class NoticeData {
  final List<Notice> noticeLists;

  NoticeData({required this.noticeLists});

  factory NoticeData.fromJson(Map<String, dynamic> json) =>
      _$NoticeDataFromJson(json);
}

@JsonSerializable()
class Notice {
  final int noticeId;
  final String title;
  final String date;

  Notice({required this.noticeId, required this.title, required this.date});

  factory Notice.fromJson(Map<String, dynamic> json) => _$NoticeFromJson(json);
}

///Notice Detail
@JsonSerializable()
class DetailNoticeModel extends GeneralModel {
  final DetailNoticeData data;

  DetailNoticeModel(
      {required super.code, required super.message, required this.data});

  factory DetailNoticeModel.fromJson(Map<String, dynamic> json) =>
      _$DetailNoticeModelFromJson(json);
}

@JsonSerializable()
class DetailNoticeData {
  final int noticeId;
  final String title;
  final String date;
  final String content;
  final String? imgUrl;

  DetailNoticeData({required this.noticeId, required this.title, required this.date, required this.content, required this.imgUrl});

  factory DetailNoticeData.fromJson(Map<String, dynamic> json) => _$DetailNoticeDataFromJson(json);
}
