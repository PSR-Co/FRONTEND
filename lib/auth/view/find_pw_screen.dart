import 'package:flutter/material.dart';
import 'package:psr/auth/component/input_user_info.dart';

import '../../common/layout/default_appbar_layout.dart';
import '../../common/layout/purple_filled_button.dart';
import '../component/complete_reset_pw.dart';
import '../component/reset_password.dart';
import 'login_screen.dart';

class FindPWScreen extends StatefulWidget {
  const FindPWScreen({Key? key}) : super(key: key);

  @override
  State<FindPWScreen> createState() => _FindPWScreenState();
}

class _FindPWScreenState extends State<FindPWScreen> {
  bool isInfoInputted = false;
  bool isReset = false;

  final TextEditingController idController = TextEditingController();
  final TextEditingController phoneNumController = TextEditingController();
  final TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBarLayout(titleText: '비밀번호 재설정', isBackItemHidden: isReset,),
      body: renderBody(),
      bottomNavigationBar: PurpleFilledButton(
        title: (isReset) ? '로그인' : '다음',
        onPressed: didTapNextButton,
        height: 40,
      ),
    );
  }

  Widget renderBody() {
    if (isInfoInputted && isReset) {
      return const CompleteResetPW();
    } else if (isInfoInputted && !isReset) {
      return const ResetPassword();
    } else {
      return Column(
        children: [
          const SizedBox(height: 40,),
          InputUserInfo(
            isTopName: false,
            nameController: idController,
            phoneNumController: phoneNumController,
            validCodeController: codeController,
          )
        ],
      );
    }
  }

  /// event methods
  void didTapNextButton() {
    setState(() {
      if (isInfoInputted && isReset) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (_) => const LoginScreen()
            ), (route) => false
        );
      } else if (isInfoInputted && !isReset) {
        isReset = !isReset;
      } else {
        isInfoInputted = !isInfoInputted;
      }
    });
  }
}
