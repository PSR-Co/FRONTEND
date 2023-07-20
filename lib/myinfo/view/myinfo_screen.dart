import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';
import 'package:psr/common/layout/detail_bar_layout.dart';
import 'package:psr/common/layout/division.dart';
import 'package:psr/myinfo/view/change_interest_screen.dart';
import 'package:psr/myinfo/view/change_profile_screen.dart';
import 'package:psr/myinfo/view/change_pw_screen.dart';
import 'package:psr/myinfo/view/logout_screen.dart';
import 'package:psr/myinfo/view/privacy_policy_screen.dart';
import 'package:psr/myinfo/view/terms_of_use_screen.dart';

import '../../common/const/colors.dart';

class MyInfoScreen extends StatefulWidget {
  const MyInfoScreen({super.key});

  @override
  State<MyInfoScreen> createState() => _MyInfoScreenState();
}

class _MyInfoScreenState extends State<MyInfoScreen> {
  final TextStyle welcomeTextStyle = const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700, color: GRAY_4_COLOR);
  final TextStyle userTypeTextStyle = const TextStyle(fontSize: 13.0, fontWeight: FontWeight.w700, color: PINK_COLOR);
  final TextStyle withdrawalTextStyle = const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500, color: GRAY_3_COLOR, decoration: TextDecoration.underline);
  final TextStyle infoBoxTitleStyle = const TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400, color: GRAY_2_COLOR);
  final TextStyle infoBoxContentStyle = const TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400, color: GRAY_4_COLOR);

  ///위젯 임시 연결
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
              children: [
                DefaultAppBarLayout(titleText: "내 정보"),
                profile(),
                Padding(padding: const EdgeInsets.fromLTRB(17.0, 0.0, 17.0, 0.0), child: infoBox(),),
                Padding(padding: const EdgeInsets.only(top: 20.0), child: Division(),),
                Padding(padding: const EdgeInsets.fromLTRB(17.0, 0.0, 0.0, 5.0), child: DetailBar(title: "프로필 수정", moveTo: ChangeProfileScreen(),),),
                Padding(padding: const EdgeInsets.fromLTRB(17.0, 5.0, 0.0, 5.0), child: DetailBar(title: "비밀번호 변경", moveTo: ChangePWScreen(),),),
                Padding(padding: const EdgeInsets.fromLTRB(17.0, 5.0, 0.0, 5.0), child: DetailBar(title: "관심목록 변경", moveTo: ChangeInterestScreen(),),),
                Padding(padding: const EdgeInsets.fromLTRB(17.0, 5.0, 0.0, 5.0), child: DetailBar(title: "약관 안내", moveTo: TermsOfUseScreen(),),),
                Padding(padding: const EdgeInsets.fromLTRB(17.0, 5.0, 0.0, 10.0), child: DetailBar(title: "개인정보 처리방침", moveTo: PrivacyPolicyScreen(),),),
                Division(),
                Padding(padding: const EdgeInsets.fromLTRB(17.0, 0.0, 0.0, 5.0), child: DetailBar(title: "로그아웃", moveTo: LogoutScreen(),),),
                Padding(padding: const EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 5.0), child: withdrawal(),)
              ],
            ),
          ),
        ),
      );
  }

  Widget profile() {
    return SizedBox(
      child: Container(
        margin: EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 20.0),
        child: Row(
          children: [
            ClipOval(
              child: Image.asset("asset/images/default_profile.png", width: 90.0, height: 90.0, ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0),
              height: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("루시 앤 셀러", style: welcomeTextStyle,),
                  Container(
                    width: 55.0, height: 25.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: PINK_COLOR_20, borderRadius: BorderRadius.all(Radius.circular(12.0)) ),
                    child: Text("사업자", style: userTypeTextStyle,),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget infoBox(){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        boxShadow: [BoxShadow(blurRadius: 4.0, color: LIGHT_SHADOW_COLOR)]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            infoBoxRow("아이디", "abc@naver.com"),
            Container(color: GRAY_0_COLOR, height: 1),
            infoBoxRow("휴대폰", "010-0000-0000"),
          ],
        ),
      ),
    );
  }
  
  Widget infoBoxRow(String title, String content){
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: infoBoxTitleStyle,),
          Text(content, style: infoBoxContentStyle,)
        ],
      ),
    );
  }

  Widget withdrawal(){
    return Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.centerLeft,
        child: TextButton(
            onPressed: (){},
            child: Text("회원탈퇴", style: withdrawalTextStyle, textAlign: TextAlign.start, )));
  }
}
