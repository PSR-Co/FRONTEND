import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:psr/common/const/colors.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';

import '../component/inquiry_list.dart';

class DetailInquiryScreen extends StatefulWidget {
  DetailInquiryScreen({Key? key}):super(key: key);

  @override
  State<DetailInquiryScreen> createState() => _DetailInquiryScreenState();
}

class _DetailInquiryScreenState extends State<DetailInquiryScreen> {
  final TextStyle titleTextStyle = const TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  final TextStyle contentTextStyle = const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: GRAY_4_COLOR, height: 1.1);

  List<Inquiry> inquiryList = [
    Inquiry('질문은 질문이에요?', '문희는 문의가 하고 싶을 뿐인뎅,,'),
    Inquiry('질문은 질문이에요?', '문희는 문의가 하고 싶을 뿐인뎅,,'),
    Inquiry('질문은 질문이에요?', '문희는 문의가 하고 싶을 뿐인뎅,,'),
    Inquiry('질문은 질문이에요?', '문희는 문의가 하고 싶을 뿐인뎅,,'),
    Inquiry('질문은 질문이에요?', '문희는 문의가 하고 싶을 뿐인뎅,,'),
    Inquiry('질문은 질문이에요?', '문희는 문의가 하고 싶을 뿐인뎅,,'),
    Inquiry('질문은 질문이에요?', '문희는 문의가 하고 싶을 뿐인뎅,,'),
    Inquiry('질문은 질문이에요?', '문희는 문의가 하고 싶을 뿐인뎅,,'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            DefaultAppBarLayout(titleText: '문의하기'),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 17.0), child: inquiryContainer(),),
            Expanded(child: answerContainer())
          ]
        ),
      ),
    );
  }

  Widget inquiryContainer(){
    return Container(
      width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(padding: EdgeInsets.only(top: 30.0, bottom: 20.0) , alignment: Alignment.centerLeft,child: Text('질문은 질문이에요?', style: titleTextStyle,)),
            Container(padding: EdgeInsets.only(top: 20.0, bottom: 20.0) ,alignment: Alignment.centerLeft,child: Text('문희는 문의가 하고 싶을 뿐인뎅,,\n\n무니는 놀고 싶을 뿐인뎅,,', style: contentTextStyle))
          ],
        )
    );
  }

  Widget answerContainer(){
    return Container(
        width: MediaQuery.of(context).size.width,
        color: PURPLE_COLOR_20,
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(top: 20.0, left: 17.0) ,
                alignment: Alignment.centerLeft,
                child: Text('관리자 답변', style: titleTextStyle,)),
            Row(
              children: [
                Container(
                  child: IconButton(
                      onPressed: (){},
                      icon: SvgPicture.asset("asset/icons/common/answer.svg"),
                      padding: EdgeInsets.only(left: 30.0, right:6.0), constraints: BoxConstraints(),)
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '아직 답변이 완료되지 않은 문의입니다.',
                      hintStyle: contentTextStyle,
                      border: InputBorder.none
                    ),
                    style: contentTextStyle,
                    readOnly: true,
                  ),
                ),
              ],
            )
          ],
        )
    );
  }
}
