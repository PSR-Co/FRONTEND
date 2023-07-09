import 'package:flutter/material.dart';
import 'package:psr/common/const/colors.dart';

import '../../common/layout/main_appbar_layout.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> with TickerProviderStateMixin {
  late final TabController controller;
  final TABS = [ "관심목록", "강사매칭", "라이브커머스교육", "방송가능상품소싱", "나머지" ];

  @override
  void initState() {
    super.initState();
    controller = TabController(
        length: TABS.length,
        vsync: this
    );
    controller.addListener(() {
      setState(() {});
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainAppBarLayout(widget: renderBody(), context: context,),
    );
  }

  Widget renderBody() {
    return Container(
      child: Column(
        children: [
          renderTabBar(),
          Expanded(
            child: TabBarView(
              controller: controller,
              children:
                  TABS.map((e) => Container(
                    // TODO: 각 카테고리별 화면 구현
                    child: Center(
                      child: Text(e),
                    ),
                  )).toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget renderTabBar() {
    return Container(
      height: 46,
      decoration: renderTabBarContainerDeco(),
      child: TabBar(
        controller: controller,
        isScrollable: true,
        indicatorColor: PURPLE_COLOR,
        indicatorWeight: 3.0,
        indicatorPadding: EdgeInsets.only(left: 10, right: 10),
        labelColor: PURPLE_COLOR,
        unselectedLabelColor: GRAY_1_COLOR,
        labelStyle: renderSelectedTextStyle(),
        unselectedLabelStyle: renderUnselectedTextStyle(),
        tabs: TABS.map((e) => Tab(child: Text(e),)).toList(),
      ),
    );
  }

  BoxDecoration renderTabBarContainerDeco() {
    return BoxDecoration(
        border: Border(
            bottom: BorderSide(
                color: GRAY_1_COLOR,
                width: 1.0
            )
        )
    );
  }

  TextStyle renderSelectedTextStyle() {
    return TextStyle(
      fontSize: 13.0,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle renderUnselectedTextStyle() {
    return TextStyle(
      fontSize: 13.0,
      fontWeight: FontWeight.w500,
    );
  }
}
