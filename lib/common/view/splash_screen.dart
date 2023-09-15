import 'package:flutter/material.dart';
import 'package:psr/common/view/root_tab.dart';
import 'package:psr/auth/view/login_screen.dart';

import '../../model/network/api_manager.dart';
import '../../model/network/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addObserver(this);
    checkToken();
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance!.removeObserver(this);
  }

  void checkToken() async {
    // storage.deleteAll(); // 로그인 화면으로 돌아갈 때 주석 해제

    /// Access / Refresh Token 저장 여부 확인 (있으면 홈 화면, 없으면 로그인 화면으로 전환)
    if (await APIManager().checkToken()) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => RootTab(selectedRootTab: null, selectedIndex: null,)
          ), (route) => false);

    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => LoginScreen()),
              (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.asset('asset/icons/splash/splash_logo.png', ),
      );
  }
}
