import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:psr/common/const/constants.dart';
import 'package:psr/cs/component/faq_tabbar_widget.dart';

import '../../common/const/colors.dart';
import '../../common/layout/default_appbar_layout.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> with TickerProviderStateMixin {
  final TextStyle faqCategoryTextStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w500, color: GRAY_2_COLOR);
  final TextStyle faqTitleTextStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  final TextStyle faqContentTextStyle = const TextStyle(
      fontSize: 12.0, fontWeight: FontWeight.w400, color: GRAY_4_COLOR);
  final TextStyle unTabbedTextStyle = const TextStyle(
      fontSize: 15.0, fontWeight: FontWeight.w500, color: GRAY_1_COLOR);
  final TextStyle tabbedTextStyle = const TextStyle(
      fontSize: 15.0, fontWeight: FontWeight.w700, color: PURPLE_COLOR);
  final titleStyle = const TextStyle(color: Colors.black, fontSize: 17);
  late final TabController tabController;

  int index = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: FAQ_LIST_TAP.length, vsync: this);
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
                leading: renderLeftItem(),
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                elevation: 0.0,
                title: Text("자주 묻는 질문", style: titleStyle,),
                bottom: PreferredSize(
                    preferredSize:
                        Size(MediaQuery.of(context).size.width, 55.0),
                    child: renderTabBar(titleList: FAQ_LIST_TAP)),
              ),
              body: tabBarView())),
    );
  }

  Widget renderTabBar({required List<String> titleList}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: GRAY_1_COLOR, width: 1.0))),
      child: TabBar(
        controller: tabController,
        // isScrollable: true,
        indicatorColor: PURPLE_COLOR,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorWeight: 3.0,
        indicatorPadding: const EdgeInsets.only(left: 9, right: 9),
        labelColor: PURPLE_COLOR,
        labelStyle: tabbedTextStyle,
        dividerColor: GRAY_1_COLOR,
        unselectedLabelColor: GRAY_1_COLOR,
        unselectedLabelStyle: unTabbedTextStyle,
        tabs: titleList
            .map((e) => Tab(
                  child: Text(e, textAlign: TextAlign.center),
                ))
            .toList(),
      ),
    );
  }

  void tabListener() {
    setState(() {
      index = tabController.index;
    });
  }

  Widget tabBarView() {
    return TabBarView(
      controller: tabController,
      children: FAQ_LIST_TAP.map((e) => FAQTabBarWidget(type: e)).toList(),
    );
  }

  Widget renderLeftItem() {
    return IconButton(
      icon: SvgPicture.asset("asset/icons/common/chevron.backward.svg"),
      onPressed: didTapBackItem,
    );
  }

  void didTapBackItem() { Navigator.of(context).pop(); }
}
