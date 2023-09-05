// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inquiry_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InquiryListModel _$InquiryListModelFromJson(Map<String, dynamic> json) =>
    InquiryListModel(
      code: json['code'] as int,
      message: json['message'] as String,
      data: InquiryListData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InquiryListModelToJson(InquiryListModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

InquiryListData _$InquiryListDataFromJson(Map<String, dynamic> json) =>
    InquiryListData(
      inquiries: (json['inquiries'] as List<dynamic>?)
          ?.map((e) => InquiryList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InquiryListDataToJson(InquiryListData instance) =>
    <String, dynamic>{
      'inquiries': instance.inquiries,
    };

InquiryList _$InquiryListFromJson(Map<String, dynamic> json) => InquiryList(
      inquiryId: json['inquiryId'] as int,
      title: json['title'] as String,
    );

Map<String, dynamic> _$InquiryListToJson(InquiryList instance) =>
    <String, dynamic>{
      'inquiryId': instance.inquiryId,
      'title': instance.title,
    };
