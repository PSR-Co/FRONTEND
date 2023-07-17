import 'package:flutter/material.dart';
import 'package:psr/auth/component/account_input_text_field.dart';

import '../../common/const/colors.dart';
import '../../common/layout/custom_title_text.dart';

class InputAccountInfo extends StatefulWidget {
  const InputAccountInfo({Key? key}) : super(key: key);

  @override
  State<InputAccountInfo> createState() => _InputAccountInfoState();
}

class _InputAccountInfoState extends State<InputAccountInfo> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  final TextEditingController pwConfirmController = TextEditingController();

  bool isValidPW = true;

  @override
  Widget build(BuildContext context) {
    return renderBody();
  }

  Widget renderBody() {
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

        getInputView(
            '비밀번호',
            pwController,
            '비밀번호를 입력해주세요.',
            true
        ),
        // Container(
        //   margin: const EdgeInsets.only(left: 20),
        //   child: const Text('영문,숫자,특수문자만 입력해주세요. (8자이상 15자이내)', style: TextStyle(
        //     fontSize: 11,
        //     color: Colors.red,
        //   ),),
        // ),
        // const SizedBox(height: 22,),

        getInputView(
          '비밀번호 확인',
          pwConfirmController,
          '비밀번호를 다시 입력해주세요.',
          true
        ),

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
        const SizedBox(height: 22,)
      ],
    );
  }
}
