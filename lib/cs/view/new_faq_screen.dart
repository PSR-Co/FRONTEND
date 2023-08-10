import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psr/common/const/constants.dart';
import 'package:psr/common/view/body_tab.dart';
import 'package:psr/cs/component/faq_list.dart';
import 'package:psr/cs/component/faq_tabbar_widget.dart';
import 'package:psr/model/data/cs/faq_model.dart';
import 'package:psr/presenter/cs/cs_service.dart';
import 'package:toggle_list/toggle_list.dart';

import '../../common/const/colors.dart';
import '../../common/layout/default_appbar_layout.dart';

class NewFAQScreen extends StatefulWidget {
  const NewFAQScreen({super.key});

  @override
  State<NewFAQScreen> createState() => _NewFAQScreenState();
}

class _NewFAQScreenState extends State<NewFAQScreen> with TickerProviderStateMixin{
  final TextStyle faqCategoryTextStyle = const TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500, color: GRAY_2_COLOR);
  final TextStyle faqTitleTextStyle = const TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  final TextStyle faqContentTextStyle = const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: GRAY_4_COLOR);
  final TextStyle unTabbedTextStyle = const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: GRAY_1_COLOR);
  final TextStyle tabbedTextStyle = const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700, color: PURPLE_COLOR);

  late final TabController tabController;

  int index = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
        length: FAQ_LIST_TAP.length,
        vsync: this
    );
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          bottom: false,
          child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                elevation: 0.0,
                title: const DefaultAppBarLayout(titleText: "자주 묻는 질문"),
                bottom: PreferredSize(
                    preferredSize: Size(MediaQuery.of(context).size.width, 55.0),
                    child: renderTabBar(titleList: FAQ_LIST_TAP)),
              ),
              body: tabBarView())),
    );
  }

  Widget renderTabBar({required List<String> titleList}){
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: GRAY_1_COLOR, width: 1.0))),
      child: TabBar(
        controller: tabController,
        // isScrollable: true,
        indicatorColor: PURPLE_COLOR,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorWeight: 3.0,
        indicatorPadding: EdgeInsets.only(left: 9, right: 9),
        labelColor: PURPLE_COLOR,
        labelStyle: tabbedTextStyle,
        dividerColor: GRAY_1_COLOR,
        unselectedLabelColor: GRAY_1_COLOR,
        unselectedLabelStyle: unTabbedTextStyle,
        tabs: titleList.map((e) =>
            Tab(child: Text(e, textAlign: TextAlign.center),)).toList(),
      ),
    );
  }

  void tabListener() {
    setState(() {index = tabController.index;});
  }

  Widget tabBarView(){
    return TabBarView(
      controller: tabController,
      children: FAQ_LIST_TAP.map((e) => FAQTabBarWidget(type: e)).toList(),
    );
  }
}
