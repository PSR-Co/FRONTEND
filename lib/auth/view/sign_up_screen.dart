import 'package:flutter/material.dart';
import 'package:psr/auth/component/input_business_info.dart';
import 'package:psr/auth/component/role_button_list.dart';
import 'package:psr/common/const/colors.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';
import 'package:psr/common/layout/purple_filled_button.dart';

import '../../common/const/constants.dart';
import '../component/agree_terms.dart';
import '../component/input_accout_info.dart';
import '../component/set_interest_list.dart';
import '../component/input_profile.dart';
import '../component/input_user_info.dart';

class SignUpScreen extends StatefulWidget {

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {

  VoidCallback? didTapNextButton;
  String? selectedRole;
  int currentPageIndex = 0;

  bool isBusiness = false;
  bool isOptionView = false;

  List<Widget> bodyWidgets = [
    const AgreeToTerms(),
    const RoleButtonList(),
    const InputBusinessInfo(),
    const InputAccountInfo(),
    const InputUserInfo(),
    const InputProfile(),
    const SetInterestList(),
  ];

  Widget getInputInfoBody() {
    if (isBusiness) { return const InputBusinessInfo(); }
    else { return const InputAccountInfo(); }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const DefaultAppBarLayout(titleText: '회원가입',),
      body: renderBody(),
      bottomNavigationBar: PurpleFilledButton(
        title: (currentPageIndex < bodyWidgets.length-2) ? '다음' : '완료',
        onPressed: setNextTapButtonAction,
        height: 40,
      ),
    );
  }

  Widget renderBody() {
    return ListView(
      children: [
        getProgressBar(),
        getGuideTitle(SIGNUP_GUIDE_TITLE.elementAt(currentPageIndex)),
        bodyWidgets.elementAt(currentPageIndex),
      ],
    );
  }

  Widget getProgressBar() {
    const int optionViewCnt = 2;

    return isOptionView ? Container()
        : SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 5,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: SIGNUP_GUIDE_TITLE.length - optionViewCnt,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 1),
                  width: MediaQuery.of(context).size.width / (SIGNUP_GUIDE_TITLE.length - optionViewCnt),
                  height: 1.5,
                  color: ((currentPageIndex-1) > index) ? PURPLE_COLOR : GRAY_1_COLOR,
                );
              },
            ),
          );
  }

  Widget getGuideTitle(String title) {
    const titleStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: GRAY_4_COLOR,
    );
    const warningStyle = TextStyle(
      fontSize: 12,
      color: Colors.red,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: (isBusiness && currentPageIndex == 1)
              ? const EdgeInsets.only(top: 30, left: 18, right: 18)
              : const EdgeInsets.symmetric(vertical: 30, horizontal: 18),
          child: Text(title, style: titleStyle,)
        ),
        (isBusiness && currentPageIndex == 1)
        ? Container(
          margin: const EdgeInsets.only(left: 18, right: 18, top: 10, bottom: 20),
          child: const Text('사업자 진위 여부 파악을 위해\n사업자 등록증에 표기된 대로 입력해주세요', style: warningStyle,),
        )
        : Container()
      ],
    );
  }

  /// event methods
  void setNextTapButtonAction(){
    setState(() {
      if (currentPageIndex == 0 && !isBusiness) { currentPageIndex += 2; }
      else { currentPageIndex += 1; }

      isOptionView = (currentPageIndex == 1) || (currentPageIndex == bodyWidgets.length-1);
    });
  }
}
