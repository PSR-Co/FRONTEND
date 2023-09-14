import 'package:json_annotation/json_annotation.dart';
import 'package:psr/model/data/auth/signup_model.dart';
import 'package:psr/model/data/general_model.dart';

part 'user_model.g.dart';

@JsonSerializable()
class EditInterests {
  final List<Interest> interestList;

  EditInterests({
    required this.interestList,
  });

  Map<String, dynamic> toJson() => _$EditInterestsToJson(this);
  factory EditInterests.fromJson(Map<String, dynamic> json)
  => _$EditInterestsFromJson(json);
}

@JsonSerializable()
class EditInterestsResponse extends GeneralModel {
  final EditInterests data;

  EditInterestsResponse({
    required super.code,
    required super.message,
    required this.data,
  });

  factory EditInterestsResponse.fromJson(Map<String, dynamic> json)
  => _$EditInterestsResponseFromJson(json);
}

@JsonSerializable()
class EditUserProfileRequest {
  final String nickname;
  final String? imgUrl;

  EditUserProfileRequest({
    required this.nickname,
    required this.imgUrl,
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
  final String nickname;
  final String? imgUrl;

  UserProfile({
    required this.nickname,
    this.imgUrl,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json)
  => _$UserProfileFromJson(json);
}