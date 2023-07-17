import 'package:flutter/material.dart';

import '../../common/layout/default_appbar_layout.dart';

class FindIDScreen extends StatefulWidget {
  const FindIDScreen({Key? key}) : super(key: key);

  @override
  State<FindIDScreen> createState() => _FindIDScreenState();
}

class _FindIDScreenState extends State<FindIDScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBarLayout(titleText: '아이디 찾기',),
    );
  }
}
