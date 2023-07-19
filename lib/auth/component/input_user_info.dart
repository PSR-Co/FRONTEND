import 'package:flutter/material.dart';

import '../../common/const/colors.dart';
import '../../common/layout/custom_title_text.dart';
import '../../common/layout/purple_outlined_textfield_with_button.dart';
import 'account_input_text_field.dart';

class InputUserInfo extends StatefulWidget {
  const InputUserInfo({Key? key}) : super(key: key);

  @override
  State<InputUserInfo> createState() => _InputUserInfoState();
}

class _InputUserInfoState extends State<InputUserInfo> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumController = TextEditingController();
  final TextEditingController validCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return renderBody();
  }

  Widget renderBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getInputView('이름', nameController, '이름을 입력해주세요.', false),
        getPhoneNumInputView('전화번호 인증', phoneNumController, '휴대폰 번호를 입력해주세요.', false),
        getInputView('인증번호', validCodeController, '휴대폰으로 전송된 인증번호를 입력해주세요.', false),

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
              controller: phoneNumController,
              buttonTitle: '인증요청',
              onPressed: didTapSendCodeButton,
            ),
        ),
        const SizedBox(height: 22,)
      ],
    );
  }

  /// event methods
  void didTapSendCodeButton() {
    print('didTapSendCodeButton - 인증번호 요청');
  }
}
