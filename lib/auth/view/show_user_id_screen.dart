import 'package:flutter/material.dart';
import 'package:psr/common/const/colors.dart';
import 'package:psr/common/layout/custom_title_text.dart';
import 'package:psr/common/view/root_tab.dart';

import '../../common/layout/default_appbar_layout.dart';
import '../../common/layout/purple_filled_button.dart';

class ShowUserIDScreen extends StatefulWidget {
  const ShowUserIDScreen({Key? key}) : super(key: key);

  @override
  State<ShowUserIDScreen> createState() => _ShowUserIDScreenState();
}

class _ShowUserIDScreenState extends State<ShowUserIDScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const DefaultAppBarLayout(titleText: '아이디 찾기', isBackItemHidden: true,),
      body: renderBody(),
      bottomNavigationBar: PurpleFilledButton(
        title: '로그인',
        onPressed: didTapNextButton,
        height: 40,
      ),
    );
  }

  Widget renderBody() {
    return ListView(
      children: [
        const SizedBox(height: 50,),
        getCenterBody(),
      ],
    );
  }

  Widget getCenterBody() {
    return Column(
      children: [
        const SizedBox(height: 60,),
        const CustomTitleText(title: 'OOO님의 아이디입니다.'),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          padding: const EdgeInsets.symmetric(vertical: 50),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: PURPLE_COLOR,
                width: 1.0,
              )
          ),
          child: const Center(
              child: Column(
                children: [
                  Text('아이디:', style: TextStyle(fontSize: 16),),
                  Text('psr1234', style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w700),),
                ],
              )
          ),
        ),
      ],
    );
  }

  /// event methods
  void didTapNextButton() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const RootTab()), (route) => false
    );
  }
}