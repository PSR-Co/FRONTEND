import 'package:flutter/material.dart';
import 'package:psr/common/layout/custom_title_text.dart';

import '../../common/const/colors.dart';
import 'account_input_text_field.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  final TextEditingController pwController = TextEditingController();
  final TextEditingController pwValidController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 40,),
        getPwInputView('비밀번호', '비밀번호를 입력해주세요.', pwController),
        getPwInputView('비밀번호 확인', '비밀번호를 다시 입력해주세요.', pwValidController),
      ],
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
          ),
        ),
        const SizedBox(height: 22,)
      ],
    );
  }
}
