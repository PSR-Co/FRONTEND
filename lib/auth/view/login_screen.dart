import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:psr/auth/component/account_input_text_field.dart';
import 'package:psr/auth/view/sign_up_screen.dart';
import 'package:psr/common/const/colors.dart';
import 'package:psr/presenter/auth/login_service.dart';

import '../../common/layout/purple_filled_button.dart';
import '../../common/view/root_tab.dart';
import '../../model/network/constants.dart';
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
    return SingleChildScrollView(
      child: SafeArea(
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
              isNeededForHidden: false,
              inputType: InputType.email,
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
  void didTapLoginButton() async {
   final result = await LoginService().login(idController.value.text, pwController.value.text);
    if (result) {
      checkPermission();
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => const RootTab()), (route) => false);

    } else {
      showCustomDialog(
          '로그인 실패',
          '아이디 혹은 비밀번호를 확인해주세요.',
          '확인',
          () { Navigator.pop(context); }
      );
    }
  }

  void didTapSignUpButton() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SignUpScreen()));
  }

  void didTapFindIDButton() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const FindIDScreen()));
  }

  void didTapFindPWButton() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const FindPWScreen()));
  }

  void setToken(String accessToken, String refreshToken) {
    storage.write(key: ACCESS_TOKEN_KEY, value: accessToken);
    storage.write(key: REFRESH_TOKEN_KEY, value: refreshToken);
  }

  /// Helper Methods
  void checkPermission() async {
    await Permission.notification.request();
    if (await Permission.notification.isPermanentlyDenied) {
      showDialogOfAppSetting();
    }
    print('알림 허용 여부 -> ${await Permission.notification.isGranted}');
  }

  void showDialogOfAppSetting() {
    showCustomDialog(
      '권한 허용 요청',
      '알림 허용을 변경하기 위해 설정창으로 이동할까요?',
      '설정 열기',
      openAppSettings,
    );
  }

  void showCustomDialog(
      String title, String content, String buttonTitle, VoidCallback onPressed,
      ) {
    showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: Center(
          child: Text(title, style: const TextStyle(fontSize: 16),),
        ),
        content: Text(content, style: const TextStyle(fontSize: 14), textAlign: TextAlign.center),
        actions: <Widget>[
          Center(
            child: TextButton(
              onPressed: onPressed,
              child: Text(buttonTitle),
            ),
          ),
        ],
      );
    });
  }
}
