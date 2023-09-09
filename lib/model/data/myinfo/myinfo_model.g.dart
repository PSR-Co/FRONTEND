// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'myinfo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyInfoModel _$MyInfoModelFromJson(Map<String, dynamic> json) => MyInfoModel(
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'] == null ? null
        : MyInfo.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyInfoModelToJson(MyInfoModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

MyInfo _$MyInfoFromJson(Map<String, dynamic> json) => MyInfo(
      email: json['email'] as String,
      imgUrl: json['imgUrl'] as String?,
      type: json['type'] as String,
      phone: json['phone'] as String,
      nickname: json['nickname'] as String,
    );

Map<String, dynamic> _$MyInfoToJson(MyInfo instance) => <String, dynamic>{
      'email': instance.email,
      'imgUrl': instance.imgUrl,
      'type': instance.type,
      'phone': instance.phone,
      'nickname': instance.nickname,
    };

ChangePWModel _$ChangePWModelFromJson(Map<String, dynamic> json) =>
    ChangePWModel(
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ChangePWModelToJson(ChangePWModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

ChangePW _$ChangePWFromJson(Map<String, dynamic> json) => ChangePW(
  currentPassword: json['currentPassword'] as String,
  password: json['password'] as String,
);

Map<String, dynamic> _$ChangePWToJson(ChangePW instance) => <String, dynamic>{
  'currentPassword': instance.currentPassword,
  'password': instance.password,
};

AccountModel _$AccountModelFromJson(Map<String, dynamic> json) =>
    AccountModel(
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$AccountModelToJson(AccountModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };