import 'package:json_annotation/json_annotation.dart';
import 'package:psr/model/data/general_model.dart';

part 'notice_model.g.dart';

@JsonSerializable()
class NoticeModel extends GeneralModel{
  final NoticeData data;

  NoticeModel({required super.code, required super.message, required this.data});

  factory NoticeModel.fromJson({required Map<String, dynamic> json})
      => _$NoticeModelFromJson(json);
}

@JsonSerializable()
class NoticeData {
  final List<Notice> noticeLists;

  NoticeData({required this.noticeLists});

  factory NoticeData.fromJson(Map<String, dynamic> json)
  => _$NoticeDataFromJson(json);
}

@JsonSerializable()
class Notice {
  final int noticeId;
  final String title;
  final String date;

  Notice({
    required this.noticeId,
    required this.title,
    required this.date
  });

  factory Notice.fromJson(Map<String, dynamic> json)
  => _$NoticeFromJson(json);
}
