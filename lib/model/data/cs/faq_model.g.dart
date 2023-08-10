part of 'faq_model.dart';

FAQModel _$FAQModelFromJson(Map<String, dynamic> json) => FAQModel(
    code: json['code'] as int,
    message: json['message'] as String,
    data: FAQData.fromJson(json['data'] as Map<String, dynamic>));

Map<String, dynamic> _$FAQModelToJson(FAQModel instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data
    };

FAQData _$FAQDataFromJson(Map<String, dynamic> json) => FAQData(
    faqLists: (json['faqLists'] as List<dynamic>)
        .map((e) => FAQ.fromJson(e as Map<String, dynamic>))
        .toList());

Map<String, dynamic> _$FAQDataToJson(FAQData instance) =>
    <String, dynamic>{
      'faqLists': instance.faqLists
};

FAQ _$FAQFromJson(Map<String, dynamic> json) => FAQ(
    faqId: json['faqId'] as int,
    type: json['type'] as String,
    title: json['title'] as String);

Map<String, dynamic> _$FAQToJson(FAQ instance) =>
    <String, dynamic>{
      'faqId': instance.faqId,
      'type': instance.type,
      'title': instance.title
    };