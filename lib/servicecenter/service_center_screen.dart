import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';
import 'package:psr/common/layout/detail_bar_layout.dart';
import 'package:psr/common/layout/division.dart';
import 'package:psr/common/layout/large_detail_bar_layout.dart';
import 'package:psr/common/view/body_tab.dart';

import '../common/const/colors.dart';
import '../common/const/constants.dart';

class ServiceCenterScreen extends StatefulWidget {
  const ServiceCenterScreen({super.key});

  @override
  State<ServiceCenterScreen> createState() => _ServiceCenterScreenState();
}

class _ServiceCenterScreenState extends State<ServiceCenterScreen> {
  final TextStyle inquiryTextStyle = const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  final TextStyle inquiryContentTextStyle = const TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);

  List<String> inquiryContent = [
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
            child: DetailBar(title: "공지사항"),),
          Padding(
              padding: const EdgeInsets.fromLTRB(17.0, 5.0, 0.0, 5.0),
            child: DetailBar(title: "자주 묻는 질문")),
          Padding(
              padding: const EdgeInsets.fromLTRB(17.0, 5.0, 0.0, 5.0),
              child: DetailBar(title: "문의하기")),
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
        itemCount: inquiryContent.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {},
            title: Container(
              alignment: Alignment.centerLeft, height: 40.0,
              child: Text(inquiryContent[index], style: inquiryContentTextStyle,),
            ),
            contentPadding: const EdgeInsets.symmetric(
                vertical: 5.0, horizontal: 17.0),
          );
        },
      ),
    );
  }
}
