import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psr/common/const/constants.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';
import 'package:psr/servicecenter/component/notice_list.dart';
import 'package:toggle_list/toggle_list.dart';

import '../../common/const/colors.dart';

class NoticeScreen extends StatefulWidget {
  const NoticeScreen({super.key});

  @override
  State<NoticeScreen> createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  final TextStyle noticeDateTextStyle = const TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400, color: GRAY_2_COLOR);
  final TextStyle noticeTitleTextStyle = const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: GRAY_4_COLOR);
  final TextStyle noticeContentTextStyle = const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: GRAY_4_COLOR);


  List<Notice> noticeList = [
    Notice([], '[23년 구정 공휴일] 컨설팅 및 요청 관련 문의사항 답변 기한 연장 안내 (1/20~1/24)', "2023-06-12"),
    Notice([], '[23년 구정 공휴일] 컨설팅 및 요청 관련 문의사항 답변 기한 연장 안내 (1/20~1/24)', "2023-06-12"),
    Notice([], '[23년 구정 공휴일] 컨설팅 및 요청 관련 문의사항 답변 기한 연장 안내 (1/20~1/24)', "2023-06-12"),
    Notice([], '[23년 구정 공휴일] 컨설팅 및 요청 관련 문의사항 답변 기한 연장 안내 (1/20~1/24)', "2023-06-12"),
    Notice([], '[23년 구정 공휴일] 컨설팅 및 요청 관련 문의사항 답변 기한 연장 안내 (1/20~1/24)', "2023-06-12"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            DefaultAppBarLayout(titleText: "공지사항"),
            Expanded(child: mainNoticeView())
          ]
        ),
      ),
    );
  }

  Widget mainNoticeView(){
    return ToggleList(
      innerPadding: EdgeInsets.zero,
        divider: Container(width:MediaQuery.of(context).size.width , height:1, color: GRAY_0_COLOR,),
        toggleAnimationDuration: Duration(milliseconds: 10),
        trailing: Text(""),
        children: noticeList.map((e) =>
          ToggleListItem(
            title: Container(
                margin: EdgeInsets.symmetric(horizontal: 17.0),
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                height: 100.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top: 5.0),
                        child: Text(e.date, style: noticeDateTextStyle,)),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(bottom: 5.0),
                        child: Text(e.title, style: noticeTitleTextStyle,)),
                  ],
                ),
            ),
            content: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 17.0, vertical: 30.0),
              alignment: Alignment.centerLeft,
              color: PURPLE_COLOR_10,
              child: Text(CONTENT),
            ),
          ),
      ).toList()
    );
  }
}