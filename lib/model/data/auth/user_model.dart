import 'package:json_annotation/json_annotation.dart';
import 'package:psr/model/data/auth/signup_model.dart';
import 'package:psr/model/data/general_model.dart';

part 'user_model.g.dart';

@JsonSerializable()
class EditInterestsRequest {
  final List<Interest> interestList;

  EditInterestsRequest({
    required this.interestList,
  });

  Map<String, dynamic> toJson() => _$EditInterestsRequestToJson(this);
}

@JsonSerializable()
class EditUserProfileRequest {
  final String nickname;
  final String? profileImgKey;

  EditUserProfileRequest({
    required this.nickname,
    required this.profileImgKey,
  });

  Map<String, dynamic> toJson() => _$EditUserProfileRequestToJson(this);
}

@JsonSerializable()
class UserProfileResponse extends GeneralModel {
  final UserProfile data;

  UserProfileResponse({
    required super.code,
    required super.message,
    required this.data,
  });

  factory UserProfileResponse.fromJson(Map<String, dynamic> json)
  => _$UserProfileResponseFromJson(json);
}

@JsonSerializable()
class UserProfile {
  final String email;
  final String? imgUrl;

  UserProfile({
    required this.email,
    this.imgUrl,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json)
  => _$UserProfileFromJson(json);
}