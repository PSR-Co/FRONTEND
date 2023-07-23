import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:psr/auth/component/account_input_text_field.dart';
import 'package:psr/auth/component/input_account_info.dart';
import 'package:psr/auth/view/signup/input_user_info_screen.dart';

import '../../../common/const/colors.dart';
import '../../../common/const/constants.dart';
import '../../../common/layout/custom_title_text.dart';
import '../../../common/layout/default_appbar_layout.dart';
import '../../../common/layout/purple_filled_button.dart';
import '../../component/custom_progress_bar.dart';
import '../../component/guide_title.dart';

class InputAccountInfoScreen extends StatefulWidget {
  const InputAccountInfoScreen({Key? key}) : super(key: key);

  @override
  State<InputAccountInfoScreen> createState() => _InputAccountInfoScreenState();
}

class _InputAccountInfoScreenState extends State<InputAccountInfoScreen> {
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
    return ListView(
      children: [
        const CustomProgressBar(currentPage: 2),
        GuideTitleText(title: SIGNUP_GUIDE_TITLE.elementAt(3),),
        const SizedBox(height: 30,),
        getCenterBody(),
      ],
    );
  }

  Widget getCenterBody() {
    bool isVisible = false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getInputView(
          '이메일',
          emailController,
          '이메일을 입력해주세요.',
          false
        ),
        const SizedBox(height: 22,),

        getInputView(
          '비밀번호',
          pwController,
          '비밀번호를 입력해주세요.',
          true
        ),
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: const Text('영문,숫자,특수문자만 입력해주세요. (8자이상 15자이내)', style: TextStyle(
            fontSize: 11,
            color: Colors.red,
          ),),
        ),
        const SizedBox(height: 22,),

        getInputView(
          '비밀번호 확인',
          pwConfirmController,
          '비밀번호를 다시 입력해주세요.',
          true
        ),
        const SizedBox(height: 22,)
      ],
    );
  }

  Widget getInputView(
      String title,
      TextEditingController controller,
      String hintText,
      bool isNeededForHidden,
      ) {

    List<Widget> widgets = [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitleText(title: title),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: AccountInputTextField(
            controller: controller,
            hintText: hintText,
            isNeededForHidden: isNeededForHidden,
            backgroundColor: Colors.white,
            borderColor: PURPLE_COLOR.withOpacity(0.5),
          ),
        ),
        // const SizedBox(height: 22,)
      ],
    );
  }


  /// event methods
  void didTapNextButton() {
    if(isInputValid) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const InputUserInfoScreen()));
    } else {
      Fluttertoast.showToast(msg: '입력 정보를 확인해주세요!');
    }
  }
}
