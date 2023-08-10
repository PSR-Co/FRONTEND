import 'package:flutter/cupertino.dart';

import '../../model/data/auth/signup_model.dart';
import '../../model/data/auth/user_model.dart';
import '../../model/network/api_manager.dart';

class UserService {
  final EDIT_INTERESTLIST = '/users/watchlists';

  /// Singleton Pattern
  static final UserService _userService = UserService._();
  UserService._();
  factory UserService() {
    return _userService;
  }

  /// helper methods
  String getTrimmedCategory(String category) {
    if (category.length > 5) { return category.replaceAll('\n', ' '); }
    else { return category.replaceAll(' ', ''); }
  }

  /// Request Methods
  Future<bool> requestEditInterestList(List<String> interestList) async {
    List<Interest> selectedList = [];
    for (var e in interestList) {
      selectedList.add(Interest(category: getTrimmedCategory(e)));
    }

    final body = EditInterestsRequest(interestList: selectedList).toJson();
    final response = await APIManager().request(RequestType.PATCH, EDIT_INTERESTLIST, null, null, body)
        .catchError((error) { debugPrint('error : $error'); });

    return ((response != null) && (response['code'] == 200));
  }

}