import 'package:flutter/cupertino.dart';
import 'package:psr/home/component/product_list_item.dart';
import 'package:psr/common/layout/detail_bar_layout.dart';
import 'package:psr/shopping/view/shopping_screen.dart';

class BestListItem extends StatefulWidget {
  BestListItem({super.key});

  @override
  State<BestListItem> createState() => BestListItemState();
}

///위젯 임시 연결
class BestListItemState extends State<BestListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 20, bottom: 3.0),
      child: Column(
        children: [
          DetailBar(title: '인기게시글', moveTo: ShoppingScreen(),),
          ProductListItem()
        ],
      ),
    );
  }
}
