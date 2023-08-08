
import 'package:json_annotation/json_annotation.dart';
import 'package:psr/model/data/general_model.dart';

part 'signup_model.g.dart';

@JsonSerializable()
class SignupRequest extends GeneralModel {
  final String email;
  final String password;
  final String profileImgKey;
  final String nickname;
  final bool marketing;
  final bool notification;
  final List<Interest> interestList;

  SignupRequest({
    required super.code,
    required super.message,
    required this.email,
    required this.password,
    required this.profileImgKey,
    required this.nickname,
    required this.marketing,
    required this.notification,
    required this.interestList,
  });

  Map<String, dynamic> toJson() => _$SignupRequestToJson(this);
}

@JsonSerializable()
class BusinessSignupRequest extends SignupRequest {
  final EntreInfo entreInfo;

  BusinessSignupRequest({
    required super.code,
    required super.message,
    required super.email,
    required super.password,
    required super.profileImgKey,
    required super.nickname,
    required super.marketing,
    required super.notification,
    required super.interestList,
    required this.entreInfo,
  });
}

@JsonSerializable()
class Interest {
  final String category;

  Interest({
    required this.category,
  });

  Map<String, dynamic> toJson() => _$InterestToJson(this);

  factory Interest.fromJson(Map<String, dynamic> json)
  => _$InterestFromJson(json);
}

@JsonSerializable()
class EntreInfo {
  final String number;
  final String companyDate;
  final String ownerName;
  final String companyName;

  EntreInfo({
    required this.number,
    required this.companyDate,
    required this.ownerName,
    required this.companyName,
  });

  Map<String, dynamic> toJson() => _$EntreInfoToJson(this);

  factory EntreInfo.fromJson(Map<String, dynamic> json)
  => _$EntreInfoFromJson(json);
}

@JsonSerializable()
class Nickname {
  final String nickname;

  Nickname({
    required this.nickname,
  });

  Map<String, dynamic> toJson() => _$NicknameToJson(this);
}

@JsonSerializable()
class Eid {
  final String number;
  final String companyDate;
  final String ownerName;
  final String companyName;

  Eid({
    required this.number,
    required this.companyDate,
    required this.ownerName,
    required this.companyName,
  });

  Map<String, dynamic> toJson() => _$EidToJson(this);
}
