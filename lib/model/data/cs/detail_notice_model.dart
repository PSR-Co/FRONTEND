import 'package:json_annotation/json_annotation.dart';
import 'package:psr/model/data/general_model.dart';

part 'detail_notice_model.g.dart';

@JsonSerializable()
class DetailNoticeModel extends GeneralModel {
  final DetailNoticeData data;

  DetailNoticeModel(
      {required super.code, required super.message, required this.data});

  factory DetailNoticeModel.fromJson({required Map<String, dynamic> json}) =>
      _$DetailNoticeModelFromJson(json);
}

@JsonSerializable()
class DetailNoticeData {
  final int noticeId;
  final String title;
  final String date;

  DetailNoticeData({required this.noticeId, required this.title, required this.date});

  factory DetailNoticeData.fromJson(Map<String, dynamic> json) => _$DetailNoticeDataFromJson(json);
}
