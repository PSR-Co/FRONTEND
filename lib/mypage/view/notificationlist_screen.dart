import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:psr/mypage/component/notification_list_item.dart';

import '../../common/const/colors.dart';
import '../../common/layout/default_appbar_layout.dart';

class NotificationListScreen extends StatefulWidget {
  const NotificationListScreen({super.key});

  @override
  State<NotificationListScreen> createState() => _NotificationListScreenState();
}

class _NotificationListScreenState extends State<NotificationListScreen> {
  //텍스트 스타일 정의
  final contentTextStyle = TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR,);

  final productNameTextStyle = TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: GRAY_4_COLOR,);

  final dateTextStyle = TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400, color: GRAY_2_COLOR,);

  List<NotiList> notiList1 = [NotiList("상품명1", "000님의 요청을 확인하세요!"),];
  List<NotiList> notiList2 = [NotiList("상품명2", "000님의 요청을 확인하세요!"), NotiList("상품명3", "000님의 요청을 확인하세요!"),];
  List<NotiList> notiList3 = [NotiList("상품명4", "000님의 요청을 확인하세요!"), NotiList("상품명5", "000님의 요청을 확인하세요!"), NotiList("상품명6", "000님의 요청을 확인하세요!"),];
  List<NotiList> notiList4 = [NotiList("상품명7", "000님의 요청을 확인하세요!"), NotiList("상품명8", "000님의 요청을 확인하세요!"), NotiList("상품명9", "000님의 요청을 확인하세요!"), NotiList("상품명10", "000님의 요청을 확인하세요!")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: DefaultAppBarLayout(titleText: "알림"),
              ),
              Expanded(child: notidicationListView())
            ],
          ),
        ),
      ),
    );
  }

  Widget notidicationListView(){
    List<Notifications> notificationList = [
      Notifications("2022-04-03", notiList1),
      Notifications("2022-04-04", notiList2),
      Notifications("2022-04-05", notiList3),
      Notifications("2023-04-06", notiList4)
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: notificationList.map((e) =>
            Container(
              // margin: EdgeInsets.only(top: 15.0),
              padding: EdgeInsets.only(bottom: 0.0),
              constraints: BoxConstraints(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(padding: EdgeInsets.only(left: 17.0) ,child: Text(e.date, style: dateTextStyle,)),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(), //스크롤 막기
                    itemCount: e.notiList.length, //해당 날짜의 알림 리스트 개수만큼
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        onTap: () {},
                        title: GestureDetector(
                            child: notificationListItem(e.notiList[index].productName, e.notiList[index].content)
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 17.0),
                      );
                    },
                  )
                ],
              ),
            )
        ).toList()
      )
    );
  }

  Widget notificationListItem(String productName, String content) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(onPressed: (){}, icon: SvgPicture.asset("asset/icons/common/clock.svg"),padding: EdgeInsets.only(left: 0.0, top: 0.0, right: 10.0),constraints: BoxConstraints(),),
          renderNotificationInfo(productName, content)
        ],
      ),
    );
  }

  Widget renderNotificationInfo(String productName, String content) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(bottom: 3.0) ,child: Text(productName, style: productNameTextStyle,)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0),
            child: Text(content, style: contentTextStyle,),
          ),
        ],
      ),
    );
  }

}
