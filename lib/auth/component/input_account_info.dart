import 'package:flutter/material.dart';

import '../../common/const/colors.dart';
import '../../common/layout/custom_title_text.dart';
import 'account_input_text_field.dart';

class InputAccountInfo extends StatefulWidget {

  final TextEditingController emailController;
  final TextEditingController pwController;
  final TextEditingController pwConfirmController;

  const InputAccountInfo({
    required this.emailController,
    required this.pwController,
    required this.pwConfirmController,
    Key? key
  }) : super(key: key);

  @override
  State<InputAccountInfo> createState() => _InputAccountInfoState();
}

class _InputAccountInfoState extends State<InputAccountInfo> {
  @override
  Widget build(BuildContext context) {
    return getCenterBody();
  }

  Widget getCenterBody() {
    bool isVisible = false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getInputView(
            '이메일',
            widget.emailController,
            '이메일을 입력해주세요.',
            false
        ),
        const SizedBox(height: 22,),

        getInputView(
            '비밀번호',
            widget.pwController,
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
            widget.pwConfirmController,
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
}
