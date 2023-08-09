import 'package:flutter/cupertino.dart';
import 'package:psr/home/component/product_list_item.dart';
import 'package:psr/common/layout/detail_bar_layout.dart';
import 'package:psr/cs/view/notice_screen.dart';
import 'package:psr/shopping/view/shopping_screen.dart';

class RecentListItem extends StatefulWidget {
  RecentListItem({super.key});

  @override
  State<RecentListItem> createState() => RecentListItemState();
}

///위젯 임시 연결
class RecentListItemState extends State<RecentListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 20),
      child: Column(
        children: [
          DetailBar(title:'따끈따끈한 최신글 둘러보기', moveTo: ShoppingScreen(),),
          ProductListItem()
        ],
      ),
    );
  }
}
