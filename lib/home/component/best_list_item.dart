import 'package:flutter/cupertino.dart';
import 'package:psr/common/layout/detail_bar_layout.dart';
import 'package:psr/common/view/root_tab.dart';
import 'package:psr/home/component/product_list_item.dart';
import 'package:psr/shopping/view/shopping_screen.dart';

import '../../model/data/home/home_model.dart';

class BestListItem extends StatefulWidget {
  List<PopularProduct> popularProductList;

  BestListItem({required this.popularProductList, Key? key}) : super(key: key);

  @override
  State<BestListItem> createState() => BestListItemState();
}

class BestListItemState extends State<BestListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 20, bottom: 3.0),
      child: Column(
        children: [
          DetailBar(
            title: '인기게시글',
            moveTo: const RootTab(selectedIndex: null, selectedRootTab: 1,),
          ),
          ProductListItem(
            productList: widget.popularProductList,
          )
        ],
      ),
    );
  }
}
