import 'package:flutter/material.dart';
import 'package:psr/common/const/colors.dart';

import '../../common/layout/main_appbar_layout.dart';
import '../component/tabbar_view.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> with TickerProviderStateMixin {
  late final TabController controller;
  final TABS = [ "관심목록", "강사매칭", "라이브커머스\n교육", "방송가능\n상품소싱", "쇼호스트\n구현", "스마트스토어\n런칭", "퍼스널브랜딩", "SNS 마케팅", "홍보물 디자인" ];

  final TextStyle selectedTextStyle = TextStyle(
    fontSize: 13.0,
    fontWeight: FontWeight.w700,
  );

  final TextStyle unSelectedTextStyle = TextStyle(
    fontSize: 13.0,
    fontWeight: FontWeight.w500,
  );

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
      floatingActionButton: renderFloatingActionButton(),
    );
  }
  
  Widget renderFloatingActionButton() {
    return Container(
      width: 48.0,
      height: 48.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: GRAY_2_COLOR.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 4,
          ),
        ],
      ),
      child: FloatingActionButton(
        onPressed: didTapAddProductButton(),
        backgroundColor: Colors.white,
        elevation: 0,
        highlightElevation: 0,
        focusElevation: 0,
        child: Icon(Icons.add,color: GRAY_2_COLOR, size: 32.0,),
      ),
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
                  TABS.map((e) => ShoppingTabBarView(categoryName: e)).toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget renderTabBar() {
    return Container(
      height: 56,
      decoration: renderTabBarContainerDeco(),
      child: TabBar(
        controller: controller,
        isScrollable: true,
        indicatorColor: PURPLE_COLOR,
        indicatorWeight: 3.0,
        indicatorPadding: EdgeInsets.only(left: 10, right: 10),
        labelColor: PURPLE_COLOR,
        unselectedLabelColor: GRAY_1_COLOR,
        labelStyle: selectedTextStyle,
        unselectedLabelStyle: unSelectedTextStyle,
        tabs: TABS.map((e) => Tab(child: Text(e, textAlign: TextAlign.center,),)).toList(),
      ),
    );
  }

  BoxDecoration renderTabBarContainerDeco() {
    return BoxDecoration(
      color: Colors.white,
      border: Border(
          bottom: BorderSide(
              color: GRAY_1_COLOR,
              width: 1.0
          )
      )
    );
  }


  /// 이벤트 메소드 정의
  VoidCallback didTapAddProductButton() {
    return () {
      // TODO: 글 작성 화면으로 전환
      print('didTapAddProductButton');
    };
  }

}
