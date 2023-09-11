import 'package:flutter/cupertino.dart';
import 'package:psr/presenter/cs/cs_service.dart';

import '../../common/const/colors.dart';
import '../../model/data/cs/notice_model.dart';

class DetailNoticeScreen extends StatefulWidget {
  int noticeId;

  DetailNoticeScreen({required this.noticeId, Key? key}) : super(key: key);

  @override
  State<DetailNoticeScreen> createState() => _DetailNoticeScreenState();
}

class _DetailNoticeScreenState extends State<DetailNoticeScreen> {
  Future<dynamic> fetchData(int noticeId) async {
    return await CSService().getNoticeDetailData(noticeId);
  }

  DetailNoticeModel? data;

  @override
  Widget build(BuildContext context) {
    final TextStyle noticeContentTextStyle = const TextStyle(
        fontSize: 12.0, fontWeight: FontWeight.w400, color: GRAY_4_COLOR);

    return FutureBuilder(
        future: fetchData(widget.noticeId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return const Center(
              child: Text('에러가 있습니다'),
            );
          }
          if (snapshot.hasData) {
            data = DetailNoticeModel.fromJson(snapshot.data);

            if (data?.code != 200) {
              return const Center(
                child: Text('상세내용이 없습니다.'),
              );
            }
          } else if (data?.code == 404) {
            return const Center(
              child: Text('해당 공지사항을 찾을 수 없습니다.'),
            );
          } else {
            return const Center(
              child: Text('상세내용을 불러오는데 실패했습니다.'),
            );
          }
          return Container(
            width: MediaQuery.of(context).size.width,
            padding:
                const EdgeInsets.symmetric(horizontal: 17.0, vertical: 30.0),
            alignment: Alignment.centerLeft,
            color: PURPLE_COLOR_10,

            ///TO-DO : response에 content 추가되면 title -> content 로 수정하기
            child: Text(data!.data.title, style: noticeContentTextStyle),
          );
        });
  }
}
