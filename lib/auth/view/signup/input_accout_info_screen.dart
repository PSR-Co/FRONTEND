import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:psr/auth/component/input_account_info.dart';
import 'package:psr/auth/view/signup/input_user_info_screen.dart';
import 'package:psr/presenter/auth/signup_service.dart';

import '../../../common/const/constants.dart';
import '../../../common/layout/default_appbar_layout.dart';
import '../../../common/layout/purple_filled_button.dart';
import '../../component/custom_progress_bar.dart';
import '../../component/guide_title.dart';

class InputAccountInfoScreen extends StatefulWidget {
  const InputAccountInfoScreen({Key? key}) : super(key: key);

  @override
  State<InputAccountInfoScreen> createState() => InputAccountInfoScreenState();
}

class InputAccountInfoScreenState extends State<InputAccountInfoScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  final TextEditingController pwConfirmController = TextEditingController();

  bool isInputValid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const DefaultAppBarLayout(titleText: '회원가입',),
      body: renderBody(),
      bottomNavigationBar: PurpleFilledButton(
        title: '다음',
        onPressed: didTapNextButton,
        height: 40,
      ),
    );
  }

  Widget renderBody() {
    return GestureDetector(
      onTap: () { FocusScope.of(context).unfocus(); },
      child: ListView(
        children: [
          const CustomProgressBar(currentPage: 2),
          GuideTitleText(title: SIGNUP_GUIDE_TITLE.elementAt(3),),
          const SizedBox(height: 30,),
          InputAccountInfo(
              emailController: emailController,
              pwController: pwController,
              pwConfirmController: pwConfirmController
          )
        ],
      ),
    );
  }


  /// event methods
  void didTapNextButton() {
    if(isInputValid) {
      SignupService().setAccountInfo(emailController.value.text, pwController.value.text);
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const InputUserInfoScreen()));
    }
    else { Fluttertoast.showToast(msg: '입력 정보를 확인해주세요!'); }
  }
}
