import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:psr/model/data/general_model.dart';

part 'faq_model.g.dart';

@JsonSerializable()
class FAQModel extends GeneralModel {
  final FAQData data;

  FAQModel({required super.code, required super.message, required this.data});

  factory FAQModel.fromJson(Map<String, dynamic> json) => _$FAQModelFromJson(json);
}

@JsonSerializable()
class FAQData {
  final List<FAQ> faqLists;

  FAQData({required this.faqLists});

  factory FAQData.fromJson(Map<String, dynamic> json) => _$FAQDataFromJson(json);
}

@JsonSerializable()
class FAQ {
  final int faqId;
  final String type;
  final String title;

  FAQ({required this.faqId, required this.type, required this.title});

  factory FAQ.fromJson(Map<String, dynamic> json) => _$FAQFromJson(json);
}
