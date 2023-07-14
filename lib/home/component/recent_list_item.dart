import 'package:flutter/cupertino.dart';
import 'package:psr/home/component/product_list_item.dart';
import 'package:psr/home/component/title_view.dart';

class RecentListItem extends StatefulWidget {
  RecentListItem({super.key});

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
          TitleView(title:'따끈따끈한 최신글 둘러보기'),
          ProductListItem()
        ],
      ),
    );
  }
}
