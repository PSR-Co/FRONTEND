import 'package:json_annotation/json_annotation.dart';
import 'package:psr/model/data/auth/signup_model.dart';

part 'user_model.g.dart';

@JsonSerializable()
class EditInterestsRequest {
  final List<Interest> interestList;

  EditInterestsRequest({
    required this.interestList,
  });

  Map<String, dynamic> toJson() => _$EditInterestsRequestToJson(this);
}