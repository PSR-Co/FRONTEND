import 'package:flutter/material.dart';

import '../../common/const/colors.dart';
import '../../product/view/product_detail_screen.dart';

class ProductListItem extends StatefulWidget {
  List<dynamic> productList;

  ProductListItem({required this.productList, Key? key}) : super(key: key);

  @override
  State<ProductListItem> createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  final TextStyle productNameTextStyle = const TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.w400, color: GRAY_5_COLOR);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 170.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.productList.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              tapProduct(widget.productList[index].id);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                renderImg(widget.productList[index].imgUrl),
                SizedBox(
                  width: 135.0,
                  child: Text(
                    widget.productList[index].name,
                    style: productNameTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget renderImg(String? imgUrl) {
    return Container(
        margin: const EdgeInsets.only(right: 8.0, top: 5.0, bottom: 8.0),
        width: 135,
        height: 135,
        decoration: BoxDecoration(
            border: Border.all(width: 1.0, color: GRAY_0_COLOR),
            borderRadius: BorderRadius.circular(12.0)),
        child: (imgUrl == null)
            ? const Icon(
                Icons.question_mark,
                color: PURPLE_COLOR,
                size: 50,
              )
            : Image.network(imgUrl));
  }

  void tapProduct(int productId) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => ProductDetailScreen(productId: productId),
        settings: const RouteSettings(name: '/productDetail')));
  }
}
