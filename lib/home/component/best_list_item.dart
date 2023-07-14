import 'package:flutter/cupertino.dart';
import 'package:psr/home/component/product_list_item.dart';
import 'package:psr/home/component/title_view.dart';

class BestListItem extends StatefulWidget {
  BestListItem({super.key});

  @override
  State<BestListItem> createState() => BestListItemState();
}

class BestListItemState extends State<BestListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 20, bottom: 3.0),
      child: Column(
        children: [
          TitleView(title: '인기게시글'),
          ProductListItem()
        ],
      ),
    );
  }
}
