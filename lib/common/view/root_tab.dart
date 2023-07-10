import 'package:flutter/material.dart';
import 'package:psr/common/const/colors.dart';
import 'package:psr/common/const/tabbar_items.dart';

import '../../chat/view/chat_screen.dart';
import '../../home/view/home_screen.dart';
import '../../mypage/view/mypage_screen.dart';
import '../../shopping/view/shopping_screen.dart';

class RootTab extends StatefulWidget {
  const RootTab({Key? key}) : super(key: key);

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with SingleTickerProviderStateMixin {
  late TabController controller;
  int index = 0;
  
  @override
  void initState() {
    super.initState();
    controller = TabController(length: TABBAR_ICONS.length, vsync: this);
    controller.addListener(tabListener);
  }

  @override
  void dispose() {
    controller.removeListener(tabListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: renderTabBarView(),
      bottomNavigationBar: renderBottomNavBar(),
    );
  }

  void tabListener() {
    setState(() {
      index = controller.index;
    });
  }

  /// 화면 중앙 UI 구현 메소드 ///
  Widget renderTabBarView() {
    return TabBarView(
      physics: NeverScrollableScrollPhysics(),
      controller: controller,
      children: [
        HomeScreen(),
        ShoppingScreen(),
        ChatScreen(),
        MypageScreen(),
      ],
    );
  }

  /// 하단 탭바 구현 메소드 ///
  Container renderBottomNavBar() {
    return Container(
      color: Colors.white,
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: PURPLE_COLOR,
        unselectedItemColor: GRAY_2_COLOR,

        selectedLabelStyle: renderLabelStyle(),
        unselectedLabelStyle: renderLabelStyle(),
        type: BottomNavigationBarType.fixed,

        onTap: (index){
          controller.animateTo(index);
        },
        currentIndex: index,
        items: TABBAR_ICONS,
      ),
    );
  }

  TextStyle renderLabelStyle() {
    return TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500
    );
  }
}
