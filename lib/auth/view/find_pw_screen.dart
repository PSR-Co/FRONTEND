import 'package:flutter/material.dart';

import '../../common/layout/default_appbar_layout.dart';

class FindPWScreen extends StatefulWidget {
  const FindPWScreen({Key? key}) : super(key: key);

  @override
  State<FindPWScreen> createState() => _FindPWScreenState();
}

class _FindPWScreenState extends State<FindPWScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBarLayout(titleText: '비밀번호 재설정',),
    );
  }
}
