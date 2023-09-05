import 'package:flutter/material.dart';

import '../../common/const/colors.dart';
import '../../common/layout/custom_title_text.dart';
import '../view/signup/input_accout_info_screen.dart';
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
  bool isValidPW = true;
  bool isCorrect = true;


  @override
  Widget build(BuildContext context) {
    return getCenterBody();
  }

  /// rendering methods
  Widget getCenterBody() {
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

        getWarningText(isValidPW, '영문,숫자,특수문자만 입력해주세요. (8자이상 15자이내)'),
        const SizedBox(height: 22,),

        getInputView(
            '비밀번호 확인',
            widget.pwConfirmController,
            '비밀번호를 다시 입력해주세요.',
            true
        ),
        getWarningText(isCorrect, '비밀번호가 일치하지 않습니다'),
        const SizedBox(height: 22,)
      ],
    );
  }

  Widget getWarningText(bool isValid, String warningText) {
    if (!isValid) {
      return Container(
        margin: const EdgeInsets.only(left: 20),
        child: Text(warningText, style: const TextStyle(fontSize: 11, color: Colors.red,),),
      );
    } else {
      return const SizedBox(width: 0, height: 0,);
    }
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
            onChange: () { onChange(controller); },
          ),
        ),
        // const SizedBox(height: 22,)
      ],
    );
  }

  /// helper methods
  void onChange(TextEditingController controller) {
    setState(() {
      InputAccountInfoScreenState? parent = context.findAncestorStateOfType<InputAccountInfoScreenState>();

      if (controller == widget.pwController) {
        isValidPW = validateInputPW(widget.pwController.value.text);
      } else if (controller == widget.pwConfirmController) {
        isCorrect = (widget.pwController.value.text == widget.pwConfirmController.value.text);
        parent?.isInputValid = isCorrect;
      }
    });
  }

  bool validateInputPW(String input) {
    RegExp regExp = RegExp(r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+=])[A-Za-z\d$@$!%*#?~^<>,.&+=]{8,15}$");
    if (input.isEmpty) { return false; }
    else if (!regExp.hasMatch(input)) { return false; }
    return true;
  }
}
