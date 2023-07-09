import 'package:flutter/material.dart';
import 'package:psr/common/view/root_tab.dart';
import 'package:psr/auth/view/login_screen.dart';

import '../../auth/view/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    checkToken();
  }

  void checkToken() {
    // TODO: Access / Refresh Token 저장 여부 확인 (있으면 홈 화면, 없으면 로그인 화면으로 전환)
    if (false) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => LoginScreen()
          ), (route) => false);
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => RootTab()
          ), (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Splash Screen"),
      ),
    );
  }
}
