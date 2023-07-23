import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';
import 'package:psr/myinfo/component/complete_btn.dart';

import '../../auth/view/signup/select_interest_screen.dart';
import '../../common/const/colors.dart';

class ChangeInterestScreen extends StatefulWidget {
  const ChangeInterestScreen({super.key});

  @override
  State<ChangeInterestScreen> createState() => _ChangeInterestScreenState();
}

class _ChangeInterestScreenState extends State<ChangeInterestScreen> {
  final TextStyle titleTextStyle = const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, color: GRAY_4_COLOR);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            DefaultAppBarLayout(titleText: "관심목록 변경"),
            titleView(),
            SelectInterestScreen(),
            Expanded(child: Container(width: MediaQuery.of(context).size.width,)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17.0),
              child: CompleteBtn(btnTitle: '완료',),
            )
          ],
        ),
      ),
    );
  }

  Widget titleView(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 40.0, horizontal: 17.0),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("관심있는 주제를", style: titleTextStyle,),
          Text("선택해주세요", style: titleTextStyle,)
        ],
      ),
    );
  }
}
