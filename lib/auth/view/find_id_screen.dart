import 'package:flutter/material.dart';
import 'package:psr/auth/view/signup/input_user_info_screen.dart';
import 'package:psr/auth/view/login_screen.dart';

import '../../common/const/colors.dart';
import '../../common/layout/custom_title_text.dart';
import '../../common/layout/default_appbar_layout.dart';
import '../../common/layout/purple_filled_button.dart';
import '../../common/layout/purple_outlined_textfield_with_button.dart';
import '../component/account_input_text_field.dart';
import 'show_user_id_screen.dart';

class FindIDScreen extends StatefulWidget {
  const FindIDScreen({Key? key}) : super(key: key);

  @override
  State<FindIDScreen> createState() => _FindIDScreenState();
}

class _FindIDScreenState extends State<FindIDScreen> {
  bool isFounded = false;
  bool isInputValid = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumController = TextEditingController();
  final TextEditingController validCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const DefaultAppBarLayout(titleText: '아이디 찾기',),
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
    setState(() {
      if (isInputValid) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => const ShowUserIDScreen()), (route) => false
        );
      }
      // isFounded = !isFounded;
    });
  }

  void didTapSendCodeButton() {
    print('didTapSendCodeButton - 인증번호 요청');
    setState(() {
      isInputValid = !isInputValid;
    });
  }
}
