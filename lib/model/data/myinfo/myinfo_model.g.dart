// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'myinfo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyInfoModel _$MyInfoModelFromJson(Map<String, dynamic> json) => MyInfoModel(
      code: json['code'] as int,
      message: json['message'] as String,
      data: MyInfo.fromJson(json['data'] as Map<String, dynamic>),
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
    };
