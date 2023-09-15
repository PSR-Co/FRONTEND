import 'package:flutter/material.dart';

import '../../common/const/colors.dart';
import '../../common/layout/custom_title_text.dart';
import '../view/signup/input_accout_info_screen.dart';
import 'account_input_text_field.dart';

class InputAccountInfo extends StatefulWidget {

  final TextEditingController emailController;
  final TextEditingController pwController;
  final TextEditingController pwConfirmController;

  final bool? isAllInput;

  const InputAccountInfo({
    required this.emailController,
    required this.pwController,
    required this.pwConfirmController,
    this.isAllInput,
    Key? key
  }) : super(key: key);

  @override
  State<InputAccountInfo> createState() => _InputAccountInfoState();
}

class _InputAccountInfoState extends State<InputAccountInfo> {
  bool isValidEmail = true;
  bool isValidPW = true;
  bool isCorrect = true;

  List<TextEditingController> controllers = [];

  @override
  Widget build(BuildContext context) {
    return getCenterBody();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllers.add(widget.emailController);
    controllers.add(widget.pwController);
    controllers.add(widget.pwConfirmController);
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
        getWarningText(isValidEmail, '이메일 형식에 맞지 않습니다.'),
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

      controllers.forEach((element) {
        parent?.isAllInput = element.value.text.isNotEmpty;
      });

      // if (controller == widget.pwController) {
      //   isValidPW = validateInputPW(widget.pwController.value.text);
      // } else if (controller == widget.pwConfirmController) {
      //   isCorrect = (widget.pwController.value.text == widget.pwConfirmController.value.text);
      // } else if (controller == widget.emailController) {
      //   isValidEmail = isValidEmailFormat(widget.emailController.value.text);
      // }
      // parent?.isInputValid = isValidEmail && isValidPW && isCorrect;

      // 이메일 형식 검증, 비밀번호 형식 검증, 비밀번호 재입력 확인
      isValidPW = validateInputPW(widget.pwController.value.text);
      isCorrect = (widget.pwController.value.text == widget.pwConfirmController.value.text);
      isValidEmail = isValidEmailFormat(widget.emailController.value.text);

      parent?.isInputValid = isValidEmail && isValidPW && isCorrect;
    });


  }

  bool validateInputPW(String input) {
    RegExp regExp = RegExp(r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+=])[A-Za-z\d$@$!%*#?~^<>,.&+=]{8,15}$");
    if (input.isEmpty) { return false; }
    else if (!regExp.hasMatch(input)) { return false; }
    return true;
  }

  bool isValidEmailFormat(String emailInput) {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailInput);
  }
}
