import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:psr/cs/view/service_center_screen.dart';
import 'package:psr/myinfo/view/myinfo_screen.dart';
import 'package:psr/mypage/view/likelist_screen.dart';
import 'package:psr/mypage/view/mypost_screen.dart';
import 'package:psr/mypage/view/notificationlist_screen.dart';
import 'package:psr/mypage/view/order_list_tab.dart';

import '../../common/const/colors.dart';
import '../../common/layout/division.dart';
import '../../model/data/myinfo/myinfo_model.dart';
import '../../presenter/myinfo/myinfo_service.dart';
import '../component/mypage.dart';

class MypageScreen extends StatefulWidget {
  const MypageScreen({Key? key}) : super(key: key);

  @override
  State<MypageScreen> createState() => _MypageScreenState();
}

class _MypageScreenState extends State<MypageScreen> {
  final TextStyle mypageTitleTextStyle = const TextStyle(
      fontSize: 16.0, fontWeight: FontWeight.w700, color: Colors.black);
  final TextStyle welcomeTextStyle = const TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.w700, color: GRAY_4_COLOR);
  final TextStyle userTypeTextStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w700, color: PINK_COLOR);
  final TextStyle categoryTextStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  final TextStyle listHeaderTextStyle = const TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);

  MyInfoModel? data;

  Future<dynamic> fetchData() async {
    return await MyInfoService().getMyInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder(
              future: fetchData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print("mypage: ${snapshot.error.toString()}");
                  return const Center(
                    child: Text('내 프로필 : 에러가 있습니다'),
                  );
                } else if (snapshot.hasData) {
                  data = MyInfoModel.fromJson(snapshot.data);
                } else if (!snapshot.hasData) {
                  return const Center(
                    child: Text('내 프로필을 불러올 수 없습니다.'),
                  );
                } else {
                  return Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator());
                }
                return Column(
                  children: [
                    myPageHeader(),
                    profile(data!.data!.nickname, data!.data!.type, data?.data?.imgUrl),
                    category(),
                    const Padding(
                      padding: EdgeInsets.only(top: 15.0),
                      child: Division(),
                    ),
                    const Expanded(
                        child: Padding(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: OrderListTab())),
                  ],
                );
              }
            )),
      ),
    );
  }

  Widget myPageHeader() {
    return SizedBox(
      child: Container(
        margin: const EdgeInsets.fromLTRB(17.0, 5.0, 17.0, 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "마이페이지",
              style: mypageTitleTextStyle,
            ),
            const Spacer(
              flex: 2,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotificationListScreen()));
              },
              icon: SvgPicture.asset("asset/icons/common/bell.svg"),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LikeListScreen()));
              },
              icon: SvgPicture.asset("asset/icons/common/filled_heart.svg"),
              padding: const EdgeInsets.only(right: 0.0),
              constraints: const BoxConstraints(),
            ),
          ],
        ),
      ),
    );
  }

  Widget profile(String nickname, String type, String? imgUrl) {
    return SizedBox(
      height: 120.0,
      child: Container(
        margin: const EdgeInsets.fromLTRB(17.0, 10.0, 0.0, 10.0),
        height: 70.0,
        child: Row(
          children: [
            ClipOval(
              child: Image.asset(
                imgUrl ?? "asset/images/default_profile.png",
                width: 70.0,
                height: 70.0,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
                    child: Text(
                      "$nickname님 안녕하세요!",
                      style: welcomeTextStyle,
                    ),
                  ),
                  Container(
                    width: 55.0,
                    height: 25.0,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: PINK_COLOR_20,
                        borderRadius: BorderRadius.all(Radius.circular(12.0))),
                    child: Text(
                      type,
                      style: userTypeTextStyle,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget category() {
    return Container(
      margin: const EdgeInsets.fromLTRB(17.0, 10.0, 17.0, 10.0),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            categoryItem("asset/icons/common/myinfo.svg", "내 정보"),
            categoryItem("asset/icons/common/service_center.svg", "고객센터"),
            categoryItem("asset/icons/common/mypost.svg", "내 게시글")
          ],
        ),
      ),
    );
  }

  Widget categoryItem(String imgName, String categoryName) {
    return SizedBox(
      child: Column(
        children: [
          Container(
            width: 55.0,
            height: 55.0,
            margin: const EdgeInsets.only(bottom: 5.0),
            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(color: LIGHT_SHADOW_COLOR, blurRadius: 4.0)
                ],
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.white),
            child: IconButton.outlined(
              onPressed: () {
                if (categoryName == "내 정보") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyInfoScreen()));
                } else if (categoryName == "고객센터") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ServiceCenterScreen()));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyPostScreen()));
                }
              },
              icon: SvgPicture.asset(imgName),
              style: const ButtonStyle(),
            ),
          ),
          Text(
            categoryName,
            style: categoryTextStyle,
          ),
        ],
      ),
    );
  }
}
