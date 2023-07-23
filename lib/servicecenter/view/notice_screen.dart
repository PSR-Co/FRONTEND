import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
              child: Text('잘못 송금한 경우 아래 내용을 확인해주세요.\n\n'
                  '1. 돈을 송금받은 수취인에게 당근마켓 채팅방을 통해 직접 연락을 부탁드려요.\n\n'
                  '■ 수취인이 당근페이에 가입하지 않은 경우 아래의 방법으로 반환을 요청해 주세요.\n'
                  '- 채팅 > 반환할 사용자의 채팅방 진입 > 송금 받은 메시지의 ${'되돌려 주기'} 버튼 선택 > 한 번 더 확인되는 ${'되돌려 주기'} 선택\n'
                  '■ 수취인이 당근페이에 가입한 경우 아래의 방법으로 반환을 요청해 주세요.\n'
                  '- 채팅 > 반환할 사용자의 채팅방 진입 > 좌측 하단의 '+' 버튼 선택 > ${'송금'} 선택\n'
                  '※ 한 번 송금하면 회수할 수 없으니 금액을 잘 확인해 주세요.\n\n'
                  '2. 연락이 불가하거나 해결이 되지 않을 경우, 당근페이 고객센터 문의를 접수해주세요.\n\n'
                  '3. 고객센터에서 송금받은 수취인에게 알림 발송/연락 등 반환 동의를 구하기 위해 노력할게요.'),
            ),
          ),
      ).toList()
    );
    // return Container(
    //   width: MediaQuery
    //       .of(context)
    //       .size
    //       .width,
    //   child: ListView.separated(
    //     scrollDirection: Axis.vertical,
    //     itemCount: noticeList.length,
    //     shrinkWrap: true,
    //     itemBuilder: (BuildContext context, int index) {
    //       return ListTile(
    //         onTap: (){},
    //         title: Container(
    //           margin: EdgeInsets.symmetric(horizontal: 17.0),
    //           width: MediaQuery.of(context).size.width,
    //           alignment: Alignment.centerLeft,
    //           height: 96.0,
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //             children: [
    //               Container(
    //                   width: MediaQuery.of(context).size.width,
    //                   child: Text(noticeList[index].date, style: noticeDateTextStyle,)),
    //               Container(
    //                   width: MediaQuery.of(context).size.width,
    //                   child: Text(noticeList[index].title, style: noticeTitleTextStyle,)),
    //             ],
    //           ),
    //         ),
    //         contentPadding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 0.0),
    //       );
    //     }, separatorBuilder: (BuildContext context, int index) {return const Divider(thickness: 1.0, color: GRAY_0_COLOR);},
    //   ),
    // );
  }


}
