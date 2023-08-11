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

EditUserProfileRequest _$EditUserProfileRequestFromJson(
        Map<String, dynamic> json) =>
    EditUserProfileRequest(
      nickname: json['nickname'] as String,
      profileImgKey: json['profileImgKey'] as String?,
    );

Map<String, dynamic> _$EditUserProfileRequestToJson(
        EditUserProfileRequest instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'profileImgKey': instance.profileImgKey,
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
