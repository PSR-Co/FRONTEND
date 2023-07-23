import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:psr/auth/view/signup/set_profile_screen.dart';

import '../../../common/const/colors.dart';
import '../../../common/const/constants.dart';
import '../../../common/layout/custom_title_text.dart';
import '../../../common/layout/default_appbar_layout.dart';
import '../../../common/layout/purple_filled_button.dart';
import '../../../common/layout/purple_outlined_textfield_with_button.dart';
import '../../component/account_input_text_field.dart';
import '../../component/custom_progress_bar.dart';
import '../../component/guide_title.dart';

class InputUserInfoScreen extends StatefulWidget {
  const InputUserInfoScreen({Key? key}) : super(key: key);

  @override
  State<InputUserInfoScreen> createState() => _InputUserInfoScreenState();

}

class _InputUserInfoScreenState extends State<InputUserInfoScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumController = TextEditingController();
  final TextEditingController validCodeController = TextEditingController();

  bool isInputValid = false;

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
        getCenterBody(),
      ],
    );
  }

  Widget getCenterBody() {
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
  void didTapNextButton() {
    if (isInputValid) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SetProfile()));
    } else {
      Fluttertoast.showToast(msg: '입력된 개인정보를 확인해주세요!');
    }
  }

  void didTapSendCodeButton() {
    print('didTapSendCodeButton - 인증번호 요청');
    setState(() {
      isInputValid = !isInputValid;
    });
  }
}
