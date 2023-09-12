import 'package:flutter/cupertino.dart';
import 'package:psr/common/layout/detail_bar_layout.dart';
import 'package:psr/common/view/root_tab.dart';
import 'package:psr/home/component/product_list_item.dart';
import 'package:psr/shopping/view/shopping_screen.dart';

import '../../model/data/home/home_model.dart';

class RecentListItem extends StatefulWidget {
  List<RecentProduct> recentProductList;

  RecentListItem({required this.recentProductList, Key? key}) : super(key: key);

  @override
  State<RecentListItem> createState() => RecentListItemState();
}

class RecentListItemState extends State<RecentListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 20),
      child: Column(
        children: [
          DetailBar(
            title: '따끈따끈한 최신글 둘러보기',
            moveTo: const RootTab(selectedIndex: null, selectedRootTab: 1,),
          ),
          ProductListItem(
            productList: widget.recentProductList,
          )
        ],
      ),
    );
  }
}
