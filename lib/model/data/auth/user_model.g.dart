// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditInterestsRequest _$EditInterestsRequestFromJson(
        Map<String, dynamic> json) =>
    EditInterestsRequest(
      interestList: (json['interestList'] as List<dynamic>)
          .map((e) => Interest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EditInterestsRequestToJson(
        EditInterestsRequest instance) =>
    <String, dynamic>{
      'interestList': instance.interestList,
    };
