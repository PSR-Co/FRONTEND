import 'package:flutter/material.dart';
import 'package:psr/common/const/colors.dart';
import 'package:psr/product/view/add_product_screen.dart';

import '../../common/const/constants.dart';
import '../../common/layout/main_appbar_layout.dart';
import '../component/tabbar_widget.dart';

class ShoppingScreen extends StatefulWidget {
  final int? selectedIndex;
  const ShoppingScreen({required this.selectedIndex, Key? key}) : super(key: key);

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> with TickerProviderStateMixin {
  late final TabController controller;

  final TextStyle selectedTextStyle = const TextStyle(
    fontSize: 13.0,
    fontWeight: FontWeight.w700,
  );

  final TextStyle unSelectedTextStyle = const TextStyle(
    fontSize: 13.0,
    fontWeight: FontWeight.w500,
  );

  @override
  void initState() {
    super.initState();
    controller = TabController(
        length: CATEGORY.length,
        vsync: this
    );
    controller.addListener(() {
      setState(() {});
    });
    setShoppingTab(widget.selectedIndex ?? controller.index);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainAppBarLayout(widget: renderBody(), context: context,),
      floatingActionButton: renderFloatingActionButton(),
    );
  }
  
  Widget renderFloatingActionButton() {
    FocusScope.of(context).unfocus();
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
        child: const Icon(Icons.add,color: PURPLE_COLOR, size: 32.0,),
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
                CATEGORY.map((e) => ShoppingTabBarWidget(categoryName: e)).toList(),
              ),
            )
          ],
        )
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
        indicatorPadding: const EdgeInsets.only(left: 10, right: 10),
        labelColor: PURPLE_COLOR,
        labelStyle: selectedTextStyle,
        unselectedLabelColor: GRAY_1_COLOR,
        unselectedLabelStyle: unSelectedTextStyle,
        tabs: CATEGORY_FOR_TAB.map((e) => Tab(child: Text(e, textAlign: TextAlign.center,),)).toList(),
      ),
    );
  }

  BoxDecoration renderTabBarContainerDeco() {
    return const BoxDecoration(
      color: Colors.white,
      border: Border(
          bottom: BorderSide(
              color: GRAY_1_COLOR,
              width: 1.0
          )
      )
    );
  }


  /// event methods
  VoidCallback didTapAddProductButton() {
    return () {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddProductScreen()));
    };
  }

  ///홈 -> 상품 bottomnavigation 이동 시 해당 상품과 일치하는 상단 탭 세팅
  void setShoppingTab(int selectedIndex) {
    setState(() {
      controller.index = selectedIndex;
    });
  }
}
