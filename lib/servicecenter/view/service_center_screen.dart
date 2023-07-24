import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';
import 'package:psr/common/layout/detail_bar_layout.dart';
import 'package:psr/common/layout/division.dart';
import 'package:psr/common/layout/large_detail_bar_layout.dart';
import 'package:psr/common/view/body_tab.dart';
import 'package:psr/servicecenter/view/detail_inquiry_screen.dart';
import 'package:psr/servicecenter/view/faq_screen.dart';
import 'package:psr/servicecenter/view/inquiry_screen.dart';
import 'package:psr/servicecenter/view/notice_screen.dart';

import '../../common/const/colors.dart';
import '../../common/const/constants.dart';
import 'admin_detail_inquiry_screen.dart';

class ServiceCenterScreen extends StatefulWidget {
  const ServiceCenterScreen({super.key});

  @override
  State<ServiceCenterScreen> createState() => _ServiceCenterScreenState();
}

class _ServiceCenterScreenState extends State<ServiceCenterScreen> {
  final TextStyle inquiryTextStyle = const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  final TextStyle inquiryContentTextStyle = const TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);

  List<String> inquiryTitleList = [
    '질문은 질문이에요?',
    '질문은 질문이에요?',
    '질문은 질문이에요?',
    '질문은 질문이에요?',
    '질문은 질문이에요?',
    '질문은 질문이에요?',
    '질문은 질문이에요?',
    '질문은 질문이에요?',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBarLayout(titleText: '고객센터', isBackItemHidden: false,),
      body: renderMainView(),
    );
  }

  Widget renderMainView(){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(17.0, 5.0, 0.0, 5.0),
            child: DetailBar(title: "공지사항", moveTo: NoticeScreen(), ),),
          Padding(
              padding: const EdgeInsets.fromLTRB(17.0, 5.0, 0.0, 5.0),
            child: DetailBar(title: "자주 묻는 질문", moveTo: FAQScreen(),)),
          Padding(
              padding: const EdgeInsets.fromLTRB(17.0, 5.0, 0.0, 5.0),
              child: DetailBar(title: "문의하기", moveTo: InquiryScreen(),)),
          Division(),
          Expanded(
            child:
              BodyTab(
                    titleList: MY_INQUIRY_LIST_TAB,
                    tabTitle: Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.centerLeft,
                        child: Text("내 문의내역", style: inquiryTextStyle,)),
                    tabBarViewChild: [inquiryList(), inquiryList()]),

          ),
        ],
      ),
    );
  }

  Widget myInquiryTitle({required String title}) {
    return Row(
        children: [Text(title, style: inquiryTextStyle,), Expanded(child: Spacer())
    ]
    );
  }


  Widget inquiryList(){
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: inquiryTitleList.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailInquiryScreen()));
              Navigator.push(context, MaterialPageRoute(builder: (context)=> AdminDetailInquiryScreen()));
            },
            title: Container(
              alignment: Alignment.centerLeft, height: 40.0,
              child: Text(inquiryTitleList[index], style: inquiryContentTextStyle,),
            ),
            contentPadding: const EdgeInsets.symmetric(
                vertical: 5.0, horizontal: 17.0),
          );
        },
      ),
    );
  }
}
