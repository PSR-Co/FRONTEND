import 'package:flutter/material.dart';
import 'package:psr/common/view/root_tab.dart';
import 'package:psr/auth/view/login_screen.dart';

import '../const/constants.dart';

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

  void checkToken() async {

    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    // TODO: Access / Refresh Token 저장 여부 확인 (있으면 홈 화면, 없으면 로그인 화면으로 전환)
    if (refreshToken == null && accessToken == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => LoginScreen()),
              (route) => false);

    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => RootTab()
          ), (route) => false);

    }

  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.asset('asset/icons/splash/splash_logo.png', ),
      );
  }
}
