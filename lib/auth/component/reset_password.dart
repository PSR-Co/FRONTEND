import 'package:flutter/material.dart';
import 'package:psr/common/layout/custom_title_text.dart';

import '../../common/const/colors.dart';
import 'account_input_text_field.dart';

class ResetPassword extends StatefulWidget {
  final TextEditingController pwController;
  final TextEditingController pwValidController;

  const ResetPassword({
    required this.pwController,
    required this.pwValidController,
    Key? key
  }) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  // bool isValidPW = true;
  bool isCorrect = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { FocusScope.of(context).unfocus(); },
      child: ListView(
        children: [
          const SizedBox(height: 50,),
          getPwInputView('비밀번호', '비밀번호를 입력해주세요.', widget.pwController),
          getWarningText(false, '영문,숫자,특수문자만 입력해주세요. (8자이상 15자이내)'),

          const SizedBox(height: 22,),
          getPwInputView('비밀번호 확인', '비밀번호를 다시 입력해주세요.', widget.pwValidController),
          getWarningText(isCorrect, '비밀번호가 일치하지 않습니다'),
        ],
      ),
    );
  }

  Widget getPwInputView(String title, String hintText, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitleText(title: title),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: AccountInputTextField(
            controller: controller,
            hintText: hintText,
            isNeededForHidden: true,
            backgroundColor: Colors.white,
            borderColor: PURPLE_COLOR.withOpacity(0.5),
            onChange: onChange,
          ),
        ),
        // const SizedBox(height: 22,)
      ],
    );
  }

  Widget getWarningText(bool isValid, String warningText) {
    if (!isValid) {
      return Container(
        margin: const EdgeInsets.only(left: 30),
        child: Text(warningText, style: const TextStyle(fontSize: 11, color: Colors.red,),),
      );
    } else {
      return const SizedBox(width: 0, height: 0,);
    }
  }

  void onChange() {
    setState(() {
      // isValidPW = validateInputPW(widget.pwController.value.text);
      isCorrect = widget.pwController.value.text == widget.pwValidController.value.text;
    });
  }

  bool validateInputPW(String input) {
    RegExp regExp = RegExp(r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+=])[A-Za-z\d$@$!%*#?~^<>,.&+=]{8,15}$");
    if (input.isEmpty) { return false; }
    else if (!regExp.hasMatch(input)) { return false; }
    return true;
  }
}
