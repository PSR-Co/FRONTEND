import 'package:flutter/material.dart';
import 'package:psr/auth/view/signup/select_interest_screen.dart';
import 'package:psr/common/const/colors.dart';
import 'package:psr/common/layout/detail_bar_layout.dart';
import 'package:psr/common/layout/main_appbar_layout.dart';
import 'package:psr/cs/view/faq_screen.dart';
import 'package:psr/home/component/best_list_item.dart';
import 'package:psr/home/component/card_slider.dart';
import 'package:psr/home/component/fav_package_footer_item.dart';
import 'package:psr/home/component/notice_list_content.dart';
import 'package:psr/home/component/outlined_btn.dart';
import 'package:psr/home/component/recent_list_item.dart';
import 'package:psr/presenter/home/home_service.dart';

import '../../cs/view/service_center_screen.dart';
import '../../model/data/home/home_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeModel? data;
  List<MainTop> mainTopProductList = [];
  List<RecentProduct> recentProductList = [];
  List<PopularProduct> popularProductList = [];

  Future<dynamic> fetchData() async {
    return await HomeService().getHomeData();
  }

  List<Color> mainTopCardColor = [PURPLE_COLOR_20, SKY_COLOR_20, PINK_COLOR_20];
  List<String> mainTopCardEmogi = ['👨🏻‍🏫', '📚', '👨🏻‍🏫'];

  List<PackageBtn> favPackageBtn = [
    PackageBtn('강사매칭', ''),
    PackageBtn('라이브커머스', '교육'),
    PackageBtn('방송가능', '상품소싱')
  ];

  ///card slider 임시 개수
  final indexes = List.generate(3, (index) => index);

  final controller = SliderController();

  final TextStyle normalTextStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  final TextStyle packageTextStyle = const TextStyle(
      fontSize: 11.0, fontWeight: FontWeight.w500, color: GRAY_2_COLOR);
  final TextStyle packageNameTextStyle = const TextStyle(
      fontSize: 16.0, fontWeight: FontWeight.w700, color: GRAY_4_COLOR);
  final TextStyle packageIntroductionTextStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w400, color: GRAY_4_COLOR);
  final TextStyle packageBtnTextStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w500, color: GRAY_3_COLOR);
  final TextStyle btnGroupTextStyle = const TextStyle(
      fontSize: 15.0, fontWeight: FontWeight.w500, color: PURPLE_COLOR);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MainAppBarLayout(
      widget: renderBody(),
      context: context,
    ));
  }

  Widget renderBody() {
    return FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('홈: ${snapshot.error.toString()}');
            return const Center(
              child: Text('홈 : 에러가 있습니다'),
            );
          }
          if (snapshot.hasData) {
            data = HomeModel.fromJson(snapshot.data);
            mainTopProductList = data!.data.mainTopProductList;
            recentProductList = data!.data.recentProductList;
            popularProductList = data!.data.popularProductList;

            if (data?.code != 200 ||
                mainTopProductList.isEmpty ||
                recentProductList.isEmpty ||
                popularProductList.isEmpty) {
              return const Center(
                child: Text('상품이 없습니다.'),
              );
            }
          } else {
            return const Center(
              child: Text('상품을 불러오는데 실패하였습니다.'),
            );
          }
          return SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: renderFavPackageHeader()),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: renderFavPackageList(mainTopProductList)),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: renderFavPackageFooter()),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: RecentListItem(
                        recentProductList: recentProductList,
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: BestListItem(
                        popularProductList: popularProductList,
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: NoticeListContent()),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: renderBtnGroup()),
                ],
              ),
            ),
          );
        });
  }

  Widget renderFavPackageHeader() {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(left: 17),
        child: DetailBar(
          title: '관심있는 패키지를 골라보세요',
          moveTo: const SelectInterestScreen(),
        ));
  }

  Widget renderFavPackageList(List<MainTop> mainTopProductList) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: WidgetSlider(
        controller: controller,
        itemCount: indexes.length,
        itemBuilder: (context, index, activeIndex) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
              decoration: const BoxDecoration(
                  color: Colors.white, // background color
                  boxShadow: [
                    BoxShadow(
                      color: SHADOW_COLOR,
                      spreadRadius: 0,
                      blurRadius: 5,
                      offset: Offset(0, 4),
                    ),
                  ],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                      color: mainTopCardColor[index],
                      shape: BoxShape.rectangle,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width: 100,
                                      child: Text(
                                        mainTopProductList[index].category,
                                        style: packageTextStyle,
                                      )),
                                  SizedBox(
                                      width: 100,
                                      child: Text(
                                        mainTopProductList[index].name,
                                        style: packageNameTextStyle,
                                      ))
                                ],
                              ),
                              Text(
                                mainTopCardEmogi[index],
                                style: const TextStyle(fontSize: 40.0),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              mainTopProductList[index].description,
                              style: packageIntroductionTextStyle,
                            ))
                      ])),
            ),
          );
        },
        infiniteScroll: false,
        proximity: 0.48,
        sizeDistinction: 0.4,
        fixedSize: 130.0,
      ),
    );
  }

  Widget renderFavPackageFooter() {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 80.0,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          OutlinedBtnComponent(
              borderColor: SHADOW_COLOR,
              borderWidth: 2,
              radius: 10,
              width: MediaQuery.of(context).size.width / 3.5,
              height: 70,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: SizedBox(
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        favPackageBtn[0].title1,
                        style: packageBtnTextStyle,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_ios,
                            size: 15.0, color: GRAY_3_COLOR),
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                      ),
                    ],
                  ),
                ),
              )),
          OutlinedBtnComponent(
              borderColor: SHADOW_COLOR,
              borderWidth: 2,
              radius: 10,
              width: MediaQuery.of(context).size.width / 3.5,
              height: 70,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                        child: Text(
                      favPackageBtn[1].title1,
                      style: packageBtnTextStyle,
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          favPackageBtn[1].title2,
                          style: packageBtnTextStyle,
                        ),
                        IconButton(
                          onPressed: () {},
                          padding: EdgeInsets.zero, // 패딩 설정
                          constraints: const BoxConstraints(),
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            size: 15.0,
                            color: GRAY_3_COLOR,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )),
          OutlinedBtnComponent(
              borderColor: SHADOW_COLOR,
              borderWidth: 2,
              radius: 10,
              width: MediaQuery.of(context).size.width / 3.5,
              height: 70,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      child: Text(
                        favPackageBtn[2].title1,
                        style: packageBtnTextStyle,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          favPackageBtn[2].title2,
                          style: packageBtnTextStyle,
                        ),
                        IconButton(
                          onPressed: () {},
                          padding: const EdgeInsets.only(
                            top: 2.0,
                          ), // 패딩 설정
                          constraints: const BoxConstraints(),
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            size: 15.0,
                            color: GRAY_3_COLOR,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ))
        ]));
  }

  Widget renderBtnGroup() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          OutlinedBtnComponent(
              borderColor: PURPLE_COLOR,
              borderWidth: 1,
              radius: 24,
              width: 170,
              height: 60,
              child: buttonContent('자주 묻는 질문', const FAQScreen())),
          OutlinedBtnComponent(
              borderColor: PURPLE_COLOR,
              borderWidth: 1,
              radius: 24,
              width: 170,
              height: 60,
              child: buttonContent('문의하기', const ServiceCenterScreen()))
        ],
      ),
    );
  }

  Widget buttonContent(String content, Widget moveTo) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: Text(
                content,
                style: btnGroupTextStyle,
              )),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => moveTo));
            },
            padding: const EdgeInsets.only(
              top: 2.0,
            ), // 패딩 설정
            constraints: const BoxConstraints(),
            icon: const Icon(Icons.arrow_forward_ios,
                size: 15.0, color: PURPLE_COLOR),
          )
        ],
      ),
    );
  }
}
