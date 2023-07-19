import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:psr/common/view/root_tab.dart';

import 'common/view/splash_screen.dart';

void main() {
  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 시뮬레이터 오른쪽 상단에 'debug' 배너 삭제
      theme: ThemeData(
        primaryColor: Colors.white,
        fontFamily: 'NotoSans',
      ),
      home: const Scaffold(
        body: RootTab(),
        // body: SplashScreen(),
      )
    );
  }
}
