import 'package:flutter/material.dart';
import 'package:psr/auth/component/account_input_text_field.dart';
import 'package:psr/auth/view/sign_up_screen.dart';
import 'package:psr/common/const/colors.dart';

import '../../common/layout/purple_filled_button.dart';
import '../../common/view/root_tab.dart';
import 'find_id_screen.dart';
import 'find_pw_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController idController = TextEditingController();
  final TextEditingController pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: renderBody(),
    );
  }

  Widget renderBody() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getMainLogoView(),
            getWelcomeText(),

            getAccountInputView(),
            getLoginButton(),

            getAccountOptionView(),
          ],
        ),
      ),
    );
  }


  Widget getMainLogoView() {
    const logoTitleStyle = TextStyle(
        fontSize: 13,
        color: Colors.black,
        fontWeight: FontWeight.w500
    );

    return Container(
      padding: EdgeInsets.only(top: 70, bottom: 45),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
              width: 70,
              child: Image.asset('asset/icons/common/main_icon.png',)
          ),
          const SizedBox(width: 10,),
          const Text('PSR CONNECT\n종합 온라인 매칭', style: logoTitleStyle,)
        ],
      ),
    );
  }

  Widget getWelcomeText() {
    const welcomeStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: GRAY_4_COLOR,
    );

    return const Text('PSR에 오신 것을\n환영합니다!', style: welcomeStyle);
  }

  Widget getAccountInputView() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 35),
      child: Column(
        children: [
          AccountInputTextField(
              controller: idController,
              hintText: '아이디 또는 이메일 주소',
              isNeededForHidden: false
          ),

          const SizedBox(height: 8,),

          AccountInputTextField(
              controller: pwController,
              hintText: '비밀번호',
              isNeededForHidden: true
          ),
        ],
      ),
    );
  }

  Widget getLoginButton() {
    return PurpleFilledButton(
      title: '로그인', onPressed: didTapLoginButton,
      isBottomButton: false,
      width: MediaQuery.of(context).size.width,
      height: 44,
      borderRadius: 22,
    );
  }

  Widget getAccountOptionView() {
    const optionStyle = TextStyle(
        fontSize: 12,
        color: GRAY_2_COLOR,
        fontWeight: FontWeight.w500
    );

    return Column(
      children: [
        getSignUpRow(optionStyle),
        getFindView(optionStyle),
      ],
    );
  }

  Widget getSignUpRow(TextStyle style) {
    return Container(
      height: 20,
      margin: const EdgeInsets.only(top: 15, bottom: 3),
      child: Row(
        children: [
          const SizedBox(width: 5,),
          Text('아직 회원이 아니신가요?', style: style),
          TextButton(
              onPressed: didTapSignUpButton,
              style: TextButton.styleFrom(
                  padding: EdgeInsets.zero
              ),
              child: Text('회원가입', style: style.copyWith(decoration: TextDecoration.underline),)
          )
        ],
      ),
    );
  }

  Widget getFindView(TextStyle style) {
    return Container(
      height: 20,
      margin: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 2,),
          TextButton(
              onPressed: didTapFindIDButton,
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              child: Text('아이디 찾기', style: style,)
            // child: ,
          ),
          const SizedBox(width: 30,),
          TextButton(
              onPressed: didTapFindPWButton,
              style: TextButton.styleFrom(
                  padding: EdgeInsets.zero
              ),
              child: Text('비밀번호 재설정', style: style,)
          )
        ],
      ),
    );
  }




  /// event methods
  void didTapLoginButton() {
    // 테스트 토큰이 발급되기 전까지 임시로 홈 화면 연결해둠
    Navigator.of(context).pushAndRemoveUntil( MaterialPageRoute(builder: (_) => const RootTab()), (route) => false);
  }

  void didTapSignUpButton() {
    print('didTapJoinButton');
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SignUpScreen()));
  }

  void didTapFindIDButton() {
    print('didTapFindIDButton');
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const FindIDScreen()));
  }

  void didTapFindPWButton() {
    print('didTapFindPWButton');
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const FindPWScreen()));
  }
}
