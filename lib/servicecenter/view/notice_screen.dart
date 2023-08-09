import 'package:flutter/material.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';
import 'package:psr/model/data/cs/notice_model.dart';
import 'package:psr/presenter/cs/cs_service.dart';
import 'package:psr/servicecenter/view/detail_notice_screen.dart';
import 'package:toggle_list/toggle_list.dart';

import '../../common/const/colors.dart';

class NoticeScreen extends StatefulWidget {
  const NoticeScreen({super.key});

  @override
  State<NoticeScreen> createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  final TextStyle noticeDateTextStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w400, color: GRAY_2_COLOR);
  final TextStyle noticeTitleTextStyle = const TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.w400, color: GRAY_4_COLOR);
  final TextStyle noticeContentTextStyle = const TextStyle(
      fontSize: 12.0, fontWeight: FontWeight.w400, color: GRAY_4_COLOR);

  NoticeModel? data;
  List<Notice> noticeList = [];

  Future<dynamic> fetchData() async {
    return await CSService().getNoticeMainData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(children: [
          const DefaultAppBarLayout(titleText: "공지사항"),
          Expanded(
              child: FutureBuilder<dynamic>(
                  future: fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      print(snapshot.error);
                      return const Center(
                        child: Text('에러가 있습니다'),
                      );
                    }
                    if (snapshot.hasData) {
                      data = NoticeModel.fromJson(json: snapshot.data);
                      noticeList = data!.data.noticeLists;

                      if (data?.code != 200 || noticeList.isEmpty) {
                        return const Center(
                          child: Text('공지사항이 없습니다.'),
                        );
                      }
                    } else {
                      return const Center(
                        child: Text('공지사항을 불러오는데 실패하였습니다.'),
                      );
                    }
                    return mainNoticeView(noticeList);
                  }))
        ]),
      ),
    );
  }

  Widget mainNoticeView(List<Notice> noticeList) {
    return ToggleList(
        innerPadding: EdgeInsets.zero,
        divider: Container(
          width: MediaQuery.of(context).size.width,
          height: 1,
          color: GRAY_0_COLOR,
        ),
        toggleAnimationDuration: const Duration(milliseconds: 10),
        trailing: const Text(""),
        children: noticeList
            .map(
              (e) => ToggleListItem(
                  title: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 17.0),
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.centerLeft,
                    height: 100.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              e.date,
                              style: noticeDateTextStyle,
                            )),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(bottom: 5.0),
                            child: Text(
                              e.title,
                              style: noticeTitleTextStyle,
                            )),
                      ],
                    ),
                  ),
                  content: DetailNoticeScreen(noticeId: e.noticeId)),
            )
            .toList());
  }
}
