import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:psr/common/const/colors.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';

import '../../model/data/inquiry/inquiry_detail_model.dart';
import '../../presenter/inquiry/inquiry_service.dart';
import '../component/inquiry_list.dart';

class DetailInquiryScreen extends StatefulWidget {
  final int inquiryId;

  DetailInquiryScreen({required this.inquiryId,Key? key}):super(key: key);

  @override
  State<DetailInquiryScreen> createState() => _DetailInquiryScreenState();
}

class _DetailInquiryScreenState extends State<DetailInquiryScreen> {
  final TextStyle titleTextStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  final TextStyle contentTextStyle = const TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: GRAY_4_COLOR,
      height: 1.1);
  final TextStyle answerTextStyle = const TextStyle(
      fontSize: 15.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  final TextStyle removeTextStyle = const TextStyle(
      fontSize: 15.0, fontWeight: FontWeight.w500, color: ERROR_COLOR);

  InquiryDetailModel? data;

  Future<dynamic> fetchData(int inquiryId) async {
    return await InquiryService().getDetailInquiry(inquiryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: FutureBuilder(
            future: fetchData(widget.inquiryId),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print('inquiry detail error: ${snapshot.error.toString()}');
                return const Center(
                  child: Text('문의 : 에러가 있습니다'),
                );
              } else if (snapshot.hasData) {
                data = InquiryDetailModel.fromJson(snapshot.data);
                if (data?.data == null) {
                  return const Center(
                    child: Text('해당 문의를 찾을 수 없습니다.'),
                  );
                }
              } else if (!snapshot.hasData) {
                return const Center(
                  child: Text('해당 문의 내역을 불러올 수 없습니다.'),
                );
              } else {
                return Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator());
              }
              return Column(children: [
                const DefaultAppBarLayout(
                  titleText: '문의하기',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17.0),
                  child:
                  inquiryContainer(data!.data!.title, data!.data!.content),
                ),
                Expanded(child: answerContainer(data?.data?.answer))
              ]);
            }),
      ),
    );
  }

  Widget inquiryContainer(String title, String content) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(top: 30.0, bottom: 20.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: titleTextStyle,
                )),
            Container(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                alignment: Alignment.centerLeft,
                child: Text(content, style: contentTextStyle))
          ],
        ));
  }

  Widget answerContainer(String? answer) {
    return Container(
        width: MediaQuery.of(context).size.width,
        color: PURPLE_COLOR_20,
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(top: 20.0, left: 17.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  '관리자 답변',
                  style: titleTextStyle,
                )),
            Row(
              children: [
                Container(
                    child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset("asset/icons/common/answer.svg"),
                      padding: EdgeInsets.only(left: 30.0, right: 6.0),
                      constraints: BoxConstraints(),
                    )),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: answer ?? '아직 답변이 완료되지 않은 문의입니다.',
                        hintStyle: contentTextStyle,
                        border: InputBorder.none),
                    style: contentTextStyle,
                    readOnly: true,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
