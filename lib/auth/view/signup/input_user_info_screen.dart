import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:psr/auth/view/signup/set_profile_screen.dart';

import '../../../common/const/constants.dart';
import '../../../common/layout/default_appbar_layout.dart';
import '../../../common/layout/purple_filled_button.dart';
import '../../component/custom_progress_bar.dart';
import '../../component/guide_title.dart';
import '../../component/input_user_info.dart';

class InputUserInfoScreen extends StatefulWidget {
  const InputUserInfoScreen({Key? key}) : super(key: key);

  @override
  State<InputUserInfoScreen> createState() => _InputUserInfoScreenState();

}

class _InputUserInfoScreenState extends State<InputUserInfoScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumController = TextEditingController();
  final TextEditingController validCodeController = TextEditingController();

  bool isInputValid = true; // for test

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
    return ListView(
      children: [
        const CustomProgressBar(currentPage: 3),
        GuideTitleText(title: SIGNUP_GUIDE_TITLE.elementAt(4),),
        const SizedBox(height: 50,),
        InputUserInfo(
          nameController: nameController,
          phoneNumController: phoneNumController,
          validCodeController: validCodeController,
        ),
      ],
    );
  }


  /// event methods
  void didTapNextButton() {
    if (isInputValid) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SetProfile()));
    } else {
      Fluttertoast.showToast(msg: '입력된 개인정보를 확인해주세요!');
    }
  }
}
