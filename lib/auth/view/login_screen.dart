import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: renderBody(),
    );
  }

  Widget renderBody() {
    const logoTitleStyle = TextStyle(
      fontSize: 13,
      color: Colors.black,
      fontWeight: FontWeight.w500
    );

    const welcomeStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: GRAY_4_COLOR,
    );

    const optionStyle = TextStyle(
      fontSize: 12,
      color: GRAY_2_COLOR,
      fontWeight: FontWeight.w500
    );

    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 로고, 이름 row
            Container(
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
            ),

            // 웰컴 텍스트
            const Text('PSR에 오신 것을\n환영합니다!', style: welcomeStyle),

            // id, pw 입력창
            Container(
              padding: EdgeInsets.symmetric(vertical: 35),
              child: Column(
                children: [
                  getCustomTextField(idController, '아이디 또는 이메일 주소', false),
                  SizedBox(height: 8,),
                  getCustomTextField(pwController, '비밀번호', true)
                ],
              ),
            ),

            // 로그인 버튼
            PurpleFilledButton(
              title: '로그인', onPressed: didTapLoginButton,
              isBottomButton: false,
              width: MediaQuery.of(context).size.width,
              height: 44,
              borderRadius: 22,
            ),

            // 회원가입 가이딩 row
            Container(
              height: 20,
              margin: const EdgeInsets.only(top: 15, bottom: 3),
              child: Row(
                children: [
                  const SizedBox(width: 5,),
                  const Text('아직 회원이 아니신가요?', style: optionStyle),
                  TextButton(
                      onPressed: didTapSignUpButton,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero
                      ),
                      child: Text('회원가입', style: optionStyle.copyWith(decoration: TextDecoration.underline),)
                  )
                ],
              ),
            ),

            // 아이디 찾기, 비번 재설정 버튼 row
            Container(
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
                      child: const Text('아이디 찾기', style: optionStyle,)
                    // child: ,
                  ),
                  const SizedBox(width: 30,),
                  TextButton(
                      onPressed: didTapFindPWButton,
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.zero
                      ),
                      child: const Text('비밀번호 재설정', style: optionStyle,)
                    // child: getCustomTextField(pwController, '비밀번호'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getCustomTextField(TextEditingController controller, String hintText, bool isPW) {

    final defaultStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Colors.transparent
      )
    );

    return Container(
      decoration: BoxDecoration(
        color: GRAY_1_COLOR.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12)
      ),
      width: MediaQuery.of(context).size.width - 40,
      height: 50,
      child: TextFormField(
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
        controller: controller,
        scrollPhysics: const NeverScrollableScrollPhysics(),
        showCursor: false,
        maxLines: 1,
        obscureText: isPW && isPasswordVisible,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
              fontSize: 14,
              color: GRAY_1_COLOR
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          enabledBorder: defaultStyle,
          border: defaultStyle,
          focusedBorder: defaultStyle,
          suffixIcon: isPW ?
          IconButton(
            icon: isPasswordVisible ? Icon(CupertinoIcons.eye_fill, color: GRAY_1_COLOR,) : Icon(CupertinoIcons.eye_slash_fill, color: GRAY_1_COLOR,) ,
            onPressed: (){
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
          },) : null
        ),
      ),
    );
  }

  void didTapLoginButton() {
    /// 테스트 토큰이 발급되기 전까지 임시로 홈 화면 연결해둠
    Navigator.of(context).pushAndRemoveUntil( MaterialPageRoute(builder: (_) => const RootTab()), (route) => false);
  }

  void didTapSignUpButton() {
    print('didTapJoinButton');
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SignUpScreen()));
  }

  void didTapFindIDButton() {
    print('didTapFindPWButton');
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const FindIDScreen()));
  }

  void didTapFindPWButton() {
    print('didTapFindPWButton');
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const FindPWScreen()));
  }
}
