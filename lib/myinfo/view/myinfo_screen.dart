import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psr/common/layout/circular_progress_indicator.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';
import 'package:psr/common/layout/detail_bar_layout.dart';
import 'package:psr/common/layout/division.dart';
import 'package:psr/model/data/myinfo/myinfo_model.dart';
import 'package:psr/myinfo/view/change_pw_screen.dart';
import 'package:psr/myinfo/view/logout_dialog.dart';
import 'package:psr/myinfo/view/privacy_policy_screen.dart';
import 'package:psr/myinfo/view/set_notification.dart';
import 'package:psr/myinfo/view/terms_of_use_screen.dart';
import 'package:psr/myinfo/view/withdrawal_dialog.dart';
import 'package:psr/presenter/myinfo/myinfo_service.dart';

import '../../auth/view/signup/select_interest_screen.dart';
import '../../auth/view/signup/set_profile_screen.dart';
import '../../common/const/colors.dart';
import '../component/common_dialog.dart';

class MyInfoScreen extends StatefulWidget {
  const MyInfoScreen({super.key});

  @override
  State<MyInfoScreen> createState() => _MyInfoScreenState();
}

class _MyInfoScreenState extends State<MyInfoScreen> {
  final TextStyle welcomeTextStyle = const TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.w700, color: GRAY_4_COLOR);
  final TextStyle userTypeTextStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w700, color: PINK_COLOR);
  final TextStyle withdrawalTextStyle = const TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: GRAY_3_COLOR,
      decoration: TextDecoration.underline);
  final TextStyle infoBoxTitleStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w400, color: GRAY_2_COLOR);
  final TextStyle infoBoxContentStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w400, color: GRAY_4_COLOR);
  final TextStyle headerTextStyle = const TextStyle(
      fontSize: 15.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  final TextStyle askLogoutTextStyle = const TextStyle(
      fontSize: 15.0, fontWeight: FontWeight.w400, color: GRAY_3_COLOR);
  final TextStyle answerLogoutTextStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w400, color: GRAY_3_COLOR);
  final TextStyle alertWithdrawalTextStyle = const TextStyle(
      fontSize: 11.0, fontWeight: FontWeight.w400, color: GRAY_3_COLOR);
  final TextStyle answerWithdrawalTextStyle = const TextStyle(
      fontSize: 15.0, fontWeight: FontWeight.w500, color: GRAY_3_COLOR);
  final TextStyle answerTextStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w700, color: Colors.white);

  // bool isChecked = true;

  MyInfoModel? data;

  Future<dynamic> fetchData() async {
    return await MyInfoService().getMyInfo();
  }

  ///위젯 임시 연결
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: FutureBuilder(
                future: fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    print("myinfo : ${snapshot.error}");
                    return const CircularProgress();
                  } else if (snapshot.hasData) {
                    data = MyInfoModel.fromJson(snapshot.data);
                  } else if (!snapshot.hasData) {
                    print("myinfo : 내 정보가 존재하지 않습니다.");
                    return const CircularProgress();
                  } else {
                    return const CircularProgress();
                  }
                  return Column(
                    children: [
                      const DefaultAppBarLayout(titleText: "내 정보"),
                      profile(data!.data!.nickname, data!.data!.type,
                          data?.data?.imgUrl),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(17.0, 0.0, 17.0, 0.0),
                        child: infoBox(data!.data!.email, data!.data!.phone),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Division(),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(17.0, 0.0, 0.0, 5.0),
                        child: DetailBar(
                          title: "프로필 수정",
                          moveTo: const SetProfileScreen(),
                        ),
                      ),
                      // 수정 코드
                      Padding(
                        padding: const EdgeInsets.fromLTRB(17.0, 5.0, 0.0, 5.0),
                        child: DetailBar(
                          title: "비밀번호 변경",
                          moveTo: const ChangePWScreen(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(17.0, 5.0, 0.0, 5.0),
                        child: DetailBar(
                          title: "관심목록 변경",
                          moveTo: const SelectInterestScreen(),
                        ),
                      ),
                      // 수정 코드
                      Padding(
                        padding: const EdgeInsets.fromLTRB(17.0, 5.0, 0.0, 5.0),
                        child: DetailBar(
                          title: "약관 안내",
                          moveTo: const TermsOfUseScreen(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(17.0, 5.0, 0.0, 10.0),
                        child: DetailBar(
                          title: "개인정보 처리방침",
                          moveTo: const PrivacyPolicyScreen(),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(17.0, 5.0, 17.0, 10.0),
                        // child: setNotification(isChecked),
                        child: SetNotification(),
                      ),
                      const Division(),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(17.0, 0.0, 0.0, 5.0),
                        child: LogoutDialog(),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 5.0),
                        child: WithdrawalDialog(),
                      )
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }

  ///이미지 추후 연결
  Widget profile(String nickname, String type, String? imgUrl) {
    return SizedBox(
      child: Container(
        margin: const EdgeInsets.fromLTRB(17.0, 10.0, 10.0, 20.0),
        child: Row(
          children: [
            ClipOval(
              child: Image.asset(
                imgUrl ?? "asset/images/default_profile.png",
                width: 70.0,
                height: 70.0,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10.0),
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      nickname,
                      style: welcomeTextStyle,
                    ),
                  ),
                  Container(
                    width: 55.0,
                    height: 25.0,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: PINK_COLOR_20,
                        borderRadius: BorderRadius.all(Radius.circular(12.0))),
                    child: Text(
                      type,
                      style: userTypeTextStyle,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget infoBox(String email, String phone) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [BoxShadow(blurRadius: 4.0, color: LIGHT_SHADOW_COLOR)]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            infoBoxRow("아이디", email),
            Container(color: GRAY_0_COLOR, height: 1),
            infoBoxRow("휴대폰", phone),
          ],
        ),
      ),
    );
  }

  Widget infoBoxRow(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: infoBoxTitleStyle,
          ),
          Text(
            content,
            style: infoBoxContentStyle,
          )
        ],
      ),
    );
  }
}
