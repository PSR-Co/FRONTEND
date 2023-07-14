import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:psr/common/const/colors.dart';
import 'package:psr/common/layout/main_appbar_layout.dart';
import 'package:psr/home/component/best_list_item.dart';
import 'package:psr/home/component/favorite_package_list.dart';
import 'package:psr/home/component/notice_list_content.dart';
import 'package:psr/home/component/outlined_btn.dart';
import 'package:psr/home/component/card_slider.dart';
import 'package:psr/home/component/recent_list_item.dart';
import 'package:psr/home/component/title_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ///package 부분 임시 데이터
  List<PackageCard> favPackageList = [
    PackageCard('패키지', '새싹 등급   ', '👨🏻‍🏫', '한 줄 소개글을 작성해주세요', PURPLE_COLOR_20),
    PackageCard('패키지', '교육 컨설팅  ', '📚', '한 줄 소개글을 작성해주세요', SKY_COLOR_20),
    PackageCard('패키지', '라이브 커머스', '👨🏻‍🏫', '한 줄 소개글을 작성해주세요', PINK_COLOR_20)];
  List<PackageBtn> favPackageBtn = [
    PackageBtn('강사매칭', ''),
    PackageBtn('라이브커머스', '교육'),
    PackageBtn('방송가능', '상품소싱')];

  ///card slider 임시 개수
  final indexes = List.generate(3, (index) => index);

  final controller = SliderController();


  final TextStyle normalTextStyle = const TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  final TextStyle packageTextStyle = const TextStyle(fontSize: 11.0, fontWeight: FontWeight.w500, color: GRAY_2_COLOR);
  final TextStyle packageNameTextStyle = const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700, color: GRAY_4_COLOR);
  final TextStyle packageIntroductionTextStyle = const TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400, color: GRAY_4_COLOR);
  final TextStyle packageBtnTextStyle = const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: GRAY_3_COLOR);
  final TextStyle btnGroupTextStyle = const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: PURPLE_COLOR);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MainAppBarLayout(
          widget: renderBody(),
          context: context,
        ));
  }

  Widget renderBody() {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(padding: const EdgeInsets.only(top: 10.0), child: renderFavPackageHeader()),
            Padding(padding: const EdgeInsets.only(bottom: 10.0), child: renderFavPackageList()),
            Padding(padding: const EdgeInsets.symmetric(vertical: 10.0), child: renderFavPackageFooter()),
            Padding(padding: const EdgeInsets.symmetric(vertical: 10.0), child: RecentListItem()),
            Padding(padding: const EdgeInsets.symmetric(vertical: 10.0), child: BestListItem()),
            Padding(padding: const EdgeInsets.symmetric(vertical: 10.0), child: NoticeListContent()),
            Padding(padding: const EdgeInsets.symmetric(vertical: 10.0), child: renderBtnGroup()),
          ],
        ),
      ),
    );
  }


  Widget renderFavPackageHeader() {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(left: 17),
        child: TitleView(title: '관심있는 패키지를 골라보세요',)
    );
  }

  Widget renderFavPackageList() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: WidgetSlider(
        controller: controller,
        itemCount: indexes.length,
        itemBuilder: (context, index, activeIndex) {
          return GestureDetector(
            onTap: () {},
            child:
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
              decoration: const BoxDecoration(
                  color: Colors.white, // background color
                  boxShadow: [
                    BoxShadow(color: SHADOW_COLOR,
                      spreadRadius: 0,
                      blurRadius: 5,
                      offset: Offset(0, 4),),
                  ],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: favPackageList[index].cardColor, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text(favPackageList[index].package, style: packageTextStyle,),
                            Text(favPackageList[index].packageName, style: packageNameTextStyle,)
                            ],
                          ),
                          Text(favPackageList[index].emogi, style: TextStyle(fontSize: 40.0),),
                        ],
                      ),
                    ),
                    Text(favPackageList[index].introduction, style: packageIntroductionTextStyle,)
                  ]
                )
              ),
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
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedBtnComponent(borderColor : SHADOW_COLOR, borderWidth : 2, radius : 10, width: 120, height : 70,
                  child :Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              favPackageBtn[0].title1, style: packageBtnTextStyle,)),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios, size: 15.0,
                              color: GRAY_3_COLOR),),
                      ],
                  )
              ),
              OutlinedBtnComponent(borderColor : SHADOW_COLOR, borderWidth : 2, radius : 10, width: 120, height : 70,
                  child :Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(padding: const EdgeInsets.only(left: 14.0),
                            child: Text(
                              favPackageBtn[1].title1, style: packageBtnTextStyle,)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              favPackageBtn[1].title2, style: packageBtnTextStyle,),
                            IconButton(
                              onPressed: () {},
                              padding: EdgeInsets.only(top: 2.0), // 패딩 설정
                              constraints: const BoxConstraints(),
                              icon: const Icon(Icons.arrow_forward_ios, size: 15.0,
                                color: GRAY_3_COLOR,),
                            )
                          ],
                        ),
                     ],
                  )
              ),
              OutlinedBtnComponent(borderColor : SHADOW_COLOR, borderWidth : 2, radius : 10, width: 120, height : 70,
                  child :Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(padding: const EdgeInsets.only(left: 14.0), child: Text(favPackageBtn[2].title1, style: packageBtnTextStyle,)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(padding: const EdgeInsets.only(left: 6.0), child: Text(favPackageBtn[2].title2, style: packageBtnTextStyle,)),
                            IconButton(
                              onPressed: () {},
                              padding: const EdgeInsets.only(top: 2.0,), // 패딩 설정
                              constraints: const BoxConstraints(),
                              icon: const Icon(Icons.arrow_forward_ios, size: 15.0, color: GRAY_3_COLOR,),)
                          ],
                        ),
                      ],
                    )
              )
            ]
        )
    );
  }

  Widget renderBtnGroup() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          OutlinedBtnComponent(borderColor : PURPLE_COLOR , borderWidth : 1, radius : 24, width : 170, height : 60, child: buttonContent('자주 묻는 질문')),
          OutlinedBtnComponent(borderColor : PURPLE_COLOR , borderWidth : 1, radius : 24, width : 170, height : 60, child : buttonContent('문의하기'))
        ],
      ),
    );
  }

  Widget buttonContent(String content) {
    return Padding(padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 7.0),
      child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(padding: const EdgeInsets.only(left: 6.0), child: Text(content, style: btnGroupTextStyle,)),
              IconButton(
                onPressed: () {},
                padding: const EdgeInsets.only(top: 2.0,), // 패딩 설정
                constraints: const BoxConstraints(),
                icon: const Icon(Icons.arrow_forward_ios, size: 15.0, color: PURPLE_COLOR),)
            ],
      ),
    );
  }
}