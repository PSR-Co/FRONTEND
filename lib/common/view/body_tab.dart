import 'package:flutter/material.dart';

import '../const/colors.dart';

class BodyTab extends StatefulWidget {
  List<String> titleList;
  List<Widget> tabBarViewChild;
  Widget tabTitle;

  BodyTab(
      {required this.titleList,
      required this.tabTitle,
      required this.tabBarViewChild,
      Key? key})
      : super(key: key);

  @override
  State<BodyTab> createState() => _BodyTabState();
}

class _BodyTabState extends State<BodyTab> with SingleTickerProviderStateMixin {
  late TabController tabController;

  int index = 0;

  final TextStyle unTabbedTextStyle = const TextStyle(
      fontSize: 15.0, fontWeight: FontWeight.w500, color: GRAY_1_COLOR);
  final TextStyle tabbedTextStyle = const TextStyle(
      fontSize: 15.0, fontWeight: FontWeight.w700, color: PURPLE_COLOR);

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: widget.titleList.length, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: widget.tabTitle,
        bottom: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 50.0),
            child: renderTabBar(titleList: widget.titleList)),
      ),
      body: tabBarView(),
    );
  }

  Widget renderTabBar({required List<String> titleList}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: GRAY_1_COLOR, width: 1.0))),
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
        children: widget.tabBarViewChild.map((e) => e).toList());
  }
}
