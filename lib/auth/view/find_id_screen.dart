import 'package:flutter/material.dart';
import 'package:psr/auth/view/signup/input_user_info_screen.dart';
import 'package:psr/auth/view/login_screen.dart';

import '../../common/layout/default_appbar_layout.dart';
import '../../common/layout/purple_filled_button.dart';
import '../component/show_user_id.dart';

class FindIDScreen extends StatefulWidget {
  const FindIDScreen({Key? key}) : super(key: key);

  @override
  State<FindIDScreen> createState() => _FindIDScreenState();
}

class _FindIDScreenState extends State<FindIDScreen> {
  bool isFounded = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumController = TextEditingController();
  final TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const DefaultAppBarLayout(titleText: '아이디 찾기',),
      body: renderBody(),
      bottomNavigationBar: PurpleFilledButton(
        title: (isFounded) ? '로그인' : '다음',
        onPressed: didTapNextButton,
        height: 40,
      ),
    );
  }

  Widget renderBody() {
    return (isFounded)
        ? const ShowUserID()
        : const Column(
          children: [
            SizedBox(height: 40,),
            InputUserInfoScreen(),
          ],
        );
  }


  /// event methods
  void didTapNextButton() {
    setState(() {
      if (isFounded) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (_) => const LoginScreen()
            ), (route) => false
        );
      }
      isFounded = !isFounded;
    });
  }
}
