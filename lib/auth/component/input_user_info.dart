import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:psr/presenter/auth/signup_service.dart';

import '../../common/const/colors.dart';
import '../../common/layout/custom_title_text.dart';
import '../../common/layout/purple_outlined_textfield_with_button.dart';
import 'account_input_text_field.dart';

class InputUserInfo extends StatefulWidget {

  final bool? isTopName;

  final TextEditingController nameController;
  final TextEditingController phoneNumController;
  final TextEditingController validCodeController;

  const InputUserInfo({
    this.isTopName,
    required this.nameController,
    required this.phoneNumController,
    required this.validCodeController,
    Key? key
  }) : super(key: key);

  @override
  State<InputUserInfo> createState() => _InputUserInfoState();
}

class _InputUserInfoState extends State<InputUserInfo> {

  bool isInputValid = false;

  @override
  Widget build(BuildContext context) {
    return getCenterBody();
  }

  Widget getCenterBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (widget.isTopName ?? true)
            ? getInputView('이름', widget.nameController, '이름을 입력해주세요.', false, InputType.text)
            : getInputView('아이디', widget.nameController, '아이디를 입력해주세요.', false, InputType.email),

        getPhoneNumInputView('전화번호 인증', widget.phoneNumController, '휴대폰 번호를 입력해주세요.', false),
        getInputView('인증번호', widget.validCodeController, '휴대폰으로 전송된 인증번호를 입력해주세요.', false, InputType.phone),
      ],
    );
  }

  Widget getInputView(
      String title,
      TextEditingController controller,
      String hintText,
      bool isNeededForHidden,
      InputType inputType,
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
            inputType: inputType,
          ),
        ),
        const SizedBox(height: 22,)
      ],
    );
  }

  Widget getPhoneNumInputView(
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
          child:
          PurpleOutlinedTextFieldWithButton(
            maxLine: 1,
            hintText: '휴대폰 번호를 입력해주세요.',
            controller: widget.phoneNumController,
            buttonTitle: '인증요청',
            onPressed: didTapSendCodeButton,
            inputType: TextInputType.phone
          ),
        ),
        const SizedBox(height: 22,)
      ],
    );
  }

  /// event methods
  Future<void> didTapSendCodeButton() async {
    Future<bool> result = SignupService().requestValidationCode(widget.phoneNumController.value.text);
    Fluttertoast.showToast(msg: await result ? "인증번호를 발송했습니다!" : "인증번호 요청을 실패하였습니다.");

    setState(() {
      isInputValid = !isInputValid;
    });
  }
}
