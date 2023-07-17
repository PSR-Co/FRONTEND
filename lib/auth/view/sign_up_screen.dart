import 'package:flutter/material.dart';
import 'package:psr/auth/component/role_button_list.dart';
import 'package:psr/common/const/colors.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';
import 'package:psr/common/layout/purple_filled_button.dart';

import '../../common/const/constants.dart';
import '../component/input_accout_info.dart';
import '../component/set_interest_list.dart';
import '../component/set_nickname.dart';
import '../component/validate_phone_num.dart';

class SignUpScreen extends StatefulWidget {

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {

  VoidCallback? didTapNextButton;
  String? selectedRole;
  int currentPageIndex = 0;

  final List<Widget> bodyWidgets = [
    const RoleButtonList(),
    const InputAccountInfo(),
    const ValidatePhoneNum(),
    const SetNickname(),
    const SetInterestList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const DefaultAppBarLayout(titleText: '회원가입',),
      body: renderBody(),
      bottomNavigationBar: PurpleFilledButton(
        title: '다음',
        // onPressed: bodyWidgets.elementAt(current_page_index).getNextAction()!,
        onPressed: () {
          setState(() {
            currentPageIndex += 1;
          });
        },
        height: 40,
      ),
    );
  }

  Widget renderBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getProgressBar(),
        getGuideTitle(SIGNUP_GUIDE_TITLE.elementAt(currentPageIndex)),
        bodyWidgets.elementAt(currentPageIndex),
      ],
    );
  }

  Widget getProgressBar() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 5,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: SIGNUP_GUIDE_TITLE.length - 1,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 1),
            width: MediaQuery.of(context).size.width / (SIGNUP_GUIDE_TITLE.length - 1),
            height: 1.5,
            color: (currentPageIndex >= index) ? PURPLE_COLOR : GRAY_1_COLOR,
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
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 18),
        child: Text(title, style: titleStyle,)
    );
  }

  /// event methods
  void setNextTapButtonAction(VoidCallback onTap){
    didTapNextButton = onTap;
  }
}
