import 'package:flutter/material.dart';
import 'package:psr/auth/component/role_button_list.dart';
import 'package:psr/common/const/colors.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';
import 'package:psr/common/layout/purple_filled_button.dart';

import '../../common/const/constants.dart';

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
    RoleButtonList(),
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
        onPressed: didTapNextButton ?? () {},
        height: 40,
      ),
    );
  }

  Widget renderBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // TODO: add custom progress bar
        getGuideTitle(SIGNUP_GUIDE_TITLE.elementAt(currentPageIndex)),
        bodyWidgets.elementAt(currentPageIndex),
      ],
    );
  }

  Widget getGuideTitle(String title) {
    const titleStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: GRAY_4_COLOR,
    );
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: Text(title, style: titleStyle,)
    );
  }

  /// event methods
  void setNextTapButtonAction(VoidCallback onTap){
    didTapNextButton = onTap;
  }
}
