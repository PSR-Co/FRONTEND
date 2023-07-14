import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psr/home/component/product_list_item.dart';
import 'package:psr/home/component/title_view.dart';

import '../../common/const/colors.dart';

class NoticeListContent extends StatefulWidget {
  NoticeListContent({super.key});

  @override
  State<NoticeListContent> createState() => NoticeListContentState();
}

class NoticeListContentState extends State<NoticeListContent> {
  List<String> noticeContent = [
    '[23년 구정 공휴일] 컨설팅 및 요청 관련 문의사항 답변 기한 연장 안내 (1/20~1/24)',
    '[23년 구정 공휴일] 컨설팅 및 요청 관련 문의사항 답변 기한 연장 안내 (1/20~1/24)',
    '[23년 구정 공휴일] 컨설팅 및 요청 관련 문의사항 답변 기한 연장 안내 (1/20~1/24)',
    '[23년 구정 공휴일] 컨설팅 및 요청 관련 문의사항 답변 기한 연장 안내 (1/20~1/24)',
    '[23년 구정 공휴일] 컨설팅 및 요청 관련 문의사항 답변 기한 연장 안내 (1/20~1/24)',
  ];

  final TextStyle noticeContentTextStyle = const TextStyle(
      fontSize: 12.0, fontWeight: FontWeight.w400, color: GRAY_4_COLOR);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 15, bottom: 3.0),
      child: Column(
        children: [
          TitleView(title: '공지사항'),
          renderContentList()
        ],
      ),
    );
  }

  Widget renderContentList() {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: 170.0,
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: noticeContent.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: (){},
            title: Container(
              alignment: Alignment.topLeft, height: 40.0,
              child: Text(noticeContent[index], style: noticeContentTextStyle,),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 0.0),
          );
        }, separatorBuilder: (BuildContext context, int index) {return const Divider(thickness: 1.0, color: GRAY_0_COLOR);},
      ),
    );
  }
}
