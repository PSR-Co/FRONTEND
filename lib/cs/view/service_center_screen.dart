import 'package:flutter/material.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';
import 'package:psr/common/layout/detail_bar_layout.dart';
import 'package:psr/common/layout/division.dart';
import 'package:psr/common/view/body_tab.dart';
import 'package:psr/cs/view/detail_inquiry_screen.dart';
import 'package:psr/cs/view/faq_screen.dart';
import 'package:psr/cs/view/inquiry_screen.dart';
import 'package:psr/cs/view/notice_screen.dart';
import 'package:psr/model/data/inquiry/inquiry_list_model.dart';
import 'package:psr/presenter/inquiry/inquiry_service.dart';

import '../../common/const/colors.dart';
import '../../common/const/constants.dart';
import '../../model/network/constants.dart';
import 'admin_detail_inquiry_screen.dart';

class ServiceCenterScreen extends StatefulWidget {
  const ServiceCenterScreen({super.key});

  @override
  State<ServiceCenterScreen> createState() => _ServiceCenterScreenState();
}

class _ServiceCenterScreenState extends State<ServiceCenterScreen> {
  final TextStyle inquiryTextStyle = const TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  final TextStyle inquiryContentTextStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  InquiryListModel? data;
  List<InquiryList> inquiries = [];

  Future<dynamic> fetchData(String status) async {
    return await InquiryService().getInquiryList({'status': status});
  }

  Future<dynamic> savedType() async {
    final savedType = await storage.read(key: USER_TYPE);
    print("savedType $savedType");
    return savedType;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const DefaultAppBarLayout(
        titleText: '고객센터',
        isBackItemHidden: false,
      ),
      body: renderMainView(),
    );
  }

  Widget renderMainView() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(17.0, 5.0, 0.0, 5.0),
            child: DetailBar(
              title: "공지사항",
              moveTo: const NoticeScreen(),
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(17.0, 5.0, 0.0, 5.0),
              child: DetailBar(
                title: "자주 묻는 질문",
                moveTo: const FAQScreen(),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(17.0, 5.0, 0.0, 5.0),
              child: DetailBar(
                title: "문의하기",
                moveTo: const InquiryScreen(),
              )),
          const Division(),
          Expanded(
            child: BodyTab(
                titleList: MY_INQUIRY_LIST_TAB,
                tabTitle: Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "내 문의내역",
                      style: inquiryTextStyle,
                    )),
                tabBarViewChild: [inquiryList('진행중'), inquiryList('완료')]),
          )
        ],
      ),
    );
  }

  Widget myInquiryTitle({required String title}) {
    return Row(children: [
      Text(
        title,
        style: inquiryTextStyle,
      ),
      const Expanded(child: Spacer())
    ]);
  }

  Widget inquiryList(String status) {
    return FutureBuilder(
        future: fetchData(status),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('문의 : 에러가 있습니다'),
            );
          } else if (snapshot.hasData) {
            data = InquiryListModel.fromJson(snapshot.data);
            if (data?.data.inquiries == null) {
              return const Center(
                child: Text('문의 내역이 없습니다.'),
              );
            } else {
              inquiries = data!.data.inquiries!;
            }
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text('문의 내역을 불러올 수 없습니다.'),
            );
          } else {
            return Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                child: const CircularProgressIndicator());
          }
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: inquiries.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailInquiryScreen()));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => savedType() == '관리자'
                              ? AdminDetailInquiryScreen(
                                  inquiryId: inquiries[index].inquiryId,
                                )
                              : DetailInquiryScreen(
                                  inquiryId: inquiries[index].inquiryId)));
                },
                title: Container(
                  alignment: Alignment.centerLeft,
                  height: 40.0,
                  child: Text(
                    inquiries[index].title,
                    style: inquiryContentTextStyle,
                  ),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 17.0),
                minVerticalPadding: 5.0,
              );
            },
          );
        });
  }
}
