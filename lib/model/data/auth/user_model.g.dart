// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditInterests _$EditInterestsFromJson(Map<String, dynamic> json) =>
    EditInterests(
      interestList: (json['interestList'] as List<dynamic>)
          .map((e) => Interest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EditInterestsToJson(EditInterests instance) =>
    <String, dynamic>{
      'interestList': instance.interestList,
    };

EditInterestsResponse _$EditInterestsResponseFromJson(
        Map<String, dynamic> json) =>
    EditInterestsResponse(
      code: json['code'] as int,
      message: json['message'] as String,
      data: EditInterests.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EditInterestsResponseToJson(
        EditInterestsResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

EditUserProfileRequest _$EditUserProfileRequestFromJson(
        Map<String, dynamic> json) =>
    EditUserProfileRequest(
      nickname: json['nickname'] as String,
      imgUrl: json['imgUrl'] as String?,
    );

Map<String, dynamic> _$EditUserProfileRequestToJson(
        EditUserProfileRequest instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'imgUrl': instance.imgUrl,
    };

UserProfileResponse _$UserProfileResponseFromJson(Map<String, dynamic> json) =>
    UserProfileResponse(
      code: json['code'] as int,
      message: json['message'] as String,
      data: UserProfile.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserProfileResponseToJson(
        UserProfileResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
      nickname: json['nickname'] as String,
      imgUrl: json['imgUrl'] as String?,
    );

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'imgUrl': instance.imgUrl,
    };
