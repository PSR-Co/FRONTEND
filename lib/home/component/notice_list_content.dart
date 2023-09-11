import 'package:flutter/material.dart';
import 'package:psr/common/layout/circular_progress_indicator.dart';
import 'package:psr/common/layout/detail_bar_layout.dart';
import 'package:psr/cs/view/notice_screen.dart';
import 'package:psr/presenter/cs/cs_service.dart';
import 'package:toggle_list/toggle_list.dart';

import '../../common/const/colors.dart';
import '../../cs/view/detail_notice_screen.dart';
import '../../model/data/cs/home_notice_model.dart';

class NoticeListContent extends StatefulWidget {
  NoticeListContent({super.key});

  @override
  State<NoticeListContent> createState() => NoticeListContentState();
}

class NoticeListContentState extends State<NoticeListContent> {
  final TextStyle noticeTitleTextStyle = const TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.w400, color: GRAY_4_COLOR);

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
            return const CircularProgress();
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
            margin: const EdgeInsets.only(bottom: 3.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: DetailBar(
                    title: '공지사항',
                    moveTo: const NoticeScreen(),
                  ),
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
      child: ToggleList(
        shrinkWrap: true,
        scrollPhysics: const NeverScrollableScrollPhysics(),
          innerPadding: EdgeInsets.zero,
          divider: Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: GRAY_0_COLOR,
          ),
          toggleAnimationDuration: const Duration(milliseconds: 10),
          trailing: const Text(""),
          children: noticeList
              .map((e) =>
              ToggleListItem(
                title: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 17.0, vertical: 30.0),
                  alignment: Alignment.centerLeft,
                  color: Colors.white,
                  child: Text(e.title, style: noticeTitleTextStyle),
                ),
                content: DetailNoticeScreen(noticeId: e.noticeId),
              )).toList()),
    );


    // return SizedBox(
    //   width: MediaQuery.of(context).size.width,
    //   height: 250.0,
    //   child: ListView.separated(
    //     scrollDirection: Axis.vertical,
    //     itemCount: noticeList.length,
    //     physics: NeverScrollableScrollPhysics(),
    //     itemBuilder: (BuildContext context, int index) {
    //       return ListTile(
    //         onTap: () {},
    //         title: Container(
    //           alignment: Alignment.centerLeft,
    //           height: 40.0,
    //           child: Text(
    //             noticeList[index].title,
    //             style: noticeContentTextStyle,
    //           ),
    //         ),
    //         contentPadding:
    //             const EdgeInsets.symmetric(vertical: 1.0, horizontal: 0.0),
    //       );
    //     },
    //     separatorBuilder: (BuildContext context, int index) {
    //       return const Divider(thickness: 1.0, color: GRAY_0_COLOR);
    //     },
    //   ),
    // );
  }
}
