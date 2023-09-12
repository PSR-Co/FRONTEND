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
  bool isSendingValidCode = false;

  @override
  Widget build(BuildContext context) {
    return getCenterBody();
  }

  Widget getCenterBody() {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (widget.isTopName ?? true)
                ? getInputView('이름', widget.nameController, '이름을 입력해주세요.', false, InputType.text)
                : getInputView('아이디', widget.nameController, '아이디를 입력해주세요.', false, InputType.email),

            getPhoneNumInputView('전화번호 인증', widget.phoneNumController, '휴대폰 번호를 입력해주세요.', false),
            getInputView('인증번호', widget.validCodeController, '휴대폰으로 전송된 인증번호를 입력해주세요.', false, InputType.phone),
          ],
        ),
        (isSendingValidCode)
            ? Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3.5),
                child: const Center(child: CircularProgressIndicator())
              )
            : const SizedBox(height: 0,)
      ]
    );
  }

  Widget getInputView(
      String title,
      TextEditingController controller,
      String hintText,
      bool isNeededForHidden,
      InputType inputType,
      ) {

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
          child: renderValidInputViewWithPhoneWidget(),
          // PurpleOutlinedTextFieldWithButton(
          //   maxLine: 1,
          //   hintText: '휴대폰 번호를 입력해주세요.',
          //   controller: widget.phoneNumController,
          //   buttonTitle: '인증요청',
          //   onPressed: didTapSendCodeButton,
          //   inputType: TextInputType.phone
          // ),
        ),
        const SizedBox(height: 22,)
      ],
    );
  }

  Widget renderValidInputViewWithPhoneWidget() {
    int currentTextLength = 0;

    final defaultStyle = OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: PURPLE_COLOR.withOpacity(0.5),
          width: 1.0,
        )
    );

    return Row(
      children: [
        Container(
            margin: const EdgeInsets.only(top: 5, bottom: 5, right: 8),
            width: MediaQuery.of(context).size.width - 130,
            height: 45,
            child: TextFormField(
              controller: widget.phoneNumController,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
              onChanged: (value) {
                setState(() {
                  currentTextLength = value.length;
                });
              },
              scrollPhysics: const NeverScrollableScrollPhysics(),
              keyboardType: TextInputType.phone,
              showCursor: false,
              maxLines: 1,
              decoration: InputDecoration(
                hintText: '휴대폰 번호를 입력해주세요.',
                hintStyle: const TextStyle(
                    fontSize: 14,
                    color: GRAY_1_COLOR
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                enabledBorder: defaultStyle,
                border: defaultStyle,
                focusedBorder: defaultStyle,
              ),
            )
        ),
        Expanded(
          child: SizedBox(
            height: 45,
            child: TextButton(
                onPressed: (isSendingValidCode) ? null : didTapSendCodeButton,
                style: TextButton.styleFrom(
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    foregroundColor: PURPLE_COLOR,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(
                          color: PURPLE_COLOR,
                        )
                    ),
                    elevation: 0.5
                ),
                child: const Text('인증요청')
            ),
          ),
        ),
      ],
    );

  }

  /// event methods
  Future<void> didTapSendCodeButton() async {
    if (widget.nameController.value.text.isEmpty ||
        widget.phoneNumController.value.text.isEmpty) {
      Fluttertoast.showToast(
          msg: '이름과 전화번호를 모두 입력해주세요!',
          gravity: ToastGravity.CENTER
      );
      return;
    }
    setState(() {
      isSendingValidCode = true;
    });
    Future<bool> result = SignupService().requestValidationCode(widget.phoneNumController.value.text);
    Fluttertoast.showToast(
        msg: await result ? "인증번호를 발송했습니다!" : "인증번호 요청을 실패하였습니다.",
        gravity: ToastGravity.CENTER
    );

    setState(() {
      isSendingValidCode = false;
      isInputValid = !isInputValid;
    });
  }
}
