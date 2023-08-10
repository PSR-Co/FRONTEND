import 'package:json_annotation/json_annotation.dart';
import 'package:psr/model/data/general_model.dart';

part 'home_notice_model.dart';

HomeNoticeModel _$HomeNoticeModelFromJson(Map<String, dynamic> json) =>
    HomeNoticeModel(
        code: json['code'] as int,
        message: json['message'] as String,
        data: HomeNoticeData.fromJson(json['data'] as Map<String, dynamic>));

HomeNoticeData _$HomeNoticeDataFromJson(Map<String, dynamic> json) =>
    HomeNoticeData(
        noticeLists: (json['noticeLists'] as List<dynamic>)
            .map((e) => HomeNotice.fromJson(e as Map<String, dynamic>))
            .toList());

HomeNotice _$HomeNoticeFromJson(Map<String, dynamic> json) =>
    HomeNotice(noticeId: json['noticeId'], title: json['title']);
