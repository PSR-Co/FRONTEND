// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupRequest _$SignupRequestFromJson(Map<String, dynamic> json) =>
    SignupRequest(
      email: json['email'] as String,
      password: json['password'] as String,
      type: json['type'] as String,
      phone: json['phone'] as String,
      name: json['name'] as String,
      profileImgKey: json['profileImgKey'] as String?,
      nickname: json['nickname'] as String,
      marketing: json['marketing'] as bool,
      notification: json['notification'] as bool,
      interestList: (json['interestList'] as List<dynamic>)
          .map((e) => Interest.fromJson(e as Map<String, dynamic>))
          .toList(),
      entreInfo: json['entreInfo'] == null
          ? null
          : EntreInfo.fromJson(json['entreInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignupRequestToJson(SignupRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'type': instance.type,
      'phone': instance.phone,
      'name': instance.name,
      'profileImgKey': instance.profileImgKey,
      'nickname': instance.nickname,
      'marketing': instance.marketing,
      'notification': instance.notification,
      'interestList': instance.interestList,
      'entreInfo': instance.entreInfo,
    };

Interest _$InterestFromJson(Map<String, dynamic> json) => Interest(
      category: json['category'] as String,
    );

Map<String, dynamic> _$InterestToJson(Interest instance) => <String, dynamic>{
      'category': instance.category,
    };

EntreInfo _$EntreInfoFromJson(Map<String, dynamic> json) => EntreInfo(
      number: json['number'] as String,
      companyDate: json['companyDate'] as String,
      ownerName: json['ownerName'] as String,
      companyName: json['companyName'] as String,
    );

Map<String, dynamic> _$EntreInfoToJson(EntreInfo instance) => <String, dynamic>{
      'number': instance.number,
      'companyDate': instance.companyDate,
      'ownerName': instance.ownerName,
      'companyName': instance.companyName,
    };

Nickname _$NicknameFromJson(Map<String, dynamic> json) => Nickname(
      nickname: json['nickname'] as String,
    );

Map<String, dynamic> _$NicknameToJson(Nickname instance) => <String, dynamic>{
      'nickname': instance.nickname,
    };
