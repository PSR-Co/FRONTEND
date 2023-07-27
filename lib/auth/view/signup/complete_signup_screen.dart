import 'package:flutter/material.dart';
import 'package:psr/auth/component/complete_widget.dart';
import 'package:psr/auth/view/login_screen.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';
import 'package:psr/common/layout/purple_filled_button.dart';

class CompleteSignupScreen extends StatelessWidget {
  const CompleteSignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const DefaultAppBarLayout(
        titleText: '회원가입 완료',
        rightItems: null,
        isBackItemHidden: true,
      ),
      body: renderBody(),
      bottomNavigationBar: PurpleFilledButton(
        title: '로그인',
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => const LoginScreen()), (route) => false
          );
        },
      ),
    );
  }

  Widget renderBody() {
    return const CompleteWidget(mainText: '회원가입이\n완료되었습니다.');
  }
}
