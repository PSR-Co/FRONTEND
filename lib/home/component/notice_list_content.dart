import 'package:flutter/material.dart';
import 'package:psr/common/layout/detail_bar_layout.dart';
import 'package:psr/cs/view/notice_screen.dart';
import 'package:psr/model/data/cs/home_notice_model.g.dart';
import 'package:psr/presenter/cs/cs_service.dart';

import '../../common/const/colors.dart';

class NoticeListContent extends StatefulWidget {
  NoticeListContent({super.key});

  @override
  State<NoticeListContent> createState() => NoticeListContentState();
}

class NoticeListContentState extends State<NoticeListContent> {

  final TextStyle noticeContentTextStyle = const TextStyle(
      fontSize: 12.0, fontWeight: FontWeight.w400, color: GRAY_4_COLOR);

  Future<dynamic> fetchData() async {
    return await CSService().getHomeNoticeData();
  }

  HomeNoticeModel? data;
  List<HomeNotice> noticeList = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('에러가 있습니다'),
            );
          } else if (snapshot.hasData) {
            data = HomeNoticeModel.fromJson(snapshot.data);
            noticeList = data!.data.noticeLists;
            if (data?.code != 200) {
              return const Center(
                child: Text('공지사항을 불러올 수 없습니다.'),
              );
            }
          }
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 15, bottom: 3.0),
            child: Column(
              children: [
                DetailBar(
                  title: '공지사항',
                  moveTo: const NoticeScreen(),
                ),
                renderContentList(noticeList)
              ],
            ),
          );
        });
  }

  Widget renderContentList(List<HomeNotice> noticeList) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 170.0,
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: noticeList.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {},
            title: Container(
              alignment: Alignment.centerLeft,
              height: 40.0,
              child: Text(
                noticeList[index].title,
                style: noticeContentTextStyle,
              ),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 1.0, horizontal: 0.0),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(thickness: 1.0, color: GRAY_0_COLOR);
        },
      ),
    );
  }
}
