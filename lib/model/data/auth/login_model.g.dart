// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      code: json['code'] as int,
      message: json['message'] as String,
      data: LoginResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'type': instance.type,
    };

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
      email: json['email'] as String,
      password: json['password'] as String,
      deviceToken: json['deviceToken'] as String?,
    );

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'deviceToken': instance.deviceToken,
    };

SearchEmailRequest _$SearchEmailRequestFromJson(Map<String, dynamic> json) =>
    SearchEmailRequest(
      name: json['name'] as String,
      smsKey: json['smsKey'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$SearchEmailRequestToJson(SearchEmailRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'smsKey': instance.smsKey,
      'phone': instance.phone,
    };

SearchEmailResponse _$SearchEmailResponseFromJson(Map<String, dynamic> json) =>
    SearchEmailResponse(
      code: json['code'] as int,
      message: json['message'] as String,
      data: UserEmail.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchEmailResponseToJson(
        SearchEmailResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

UserEmail _$UserEmailFromJson(Map<String, dynamic> json) => UserEmail(
      email: json['email'] as String,
    );

Map<String, dynamic> _$UserEmailToJson(UserEmail instance) => <String, dynamic>{
      'email': instance.email,
    };

ValidateForResetPWRequest _$ValidateForResetPWRequestFromJson(
        Map<String, dynamic> json) =>
    ValidateForResetPWRequest(
      email: json['email'] as String,
      smsKey: json['smsKey'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$ValidateForResetPWRequestToJson(
        ValidateForResetPWRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'smsKey': instance.smsKey,
      'phone': instance.phone,
    };

ResetPWRequest _$ResetPWRequestFromJson(Map<String, dynamic> json) =>
    ResetPWRequest(
      email: json['email'] as String,
      password: json['password'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$ResetPWRequestToJson(ResetPWRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
    };
