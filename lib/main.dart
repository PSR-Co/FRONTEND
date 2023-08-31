import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:psr/common/view/root_tab.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'common/view/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 시뮬레이터 오른쪽 상단에 'debug' 배너 삭제
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ko', 'KR'),
      ],
      theme: ThemeData(
        primaryColor: Colors.white,
        fontFamily: 'NotoSans',
      ),
      home: const Scaffold(
        // body: RootTab(),
        body: SplashScreen(),
      )
    );
  }
}
