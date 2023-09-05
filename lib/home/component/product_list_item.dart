import 'package:flutter/cupertino.dart';

import '../../common/const/colors.dart';

class ProductListItem extends StatefulWidget {
  List<dynamic> productList;

  ProductListItem({required this.productList, Key? key}) : super(key: key);

  @override
  State<ProductListItem> createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  ///임시 데이터
  List<String> productImg = [
    'product_sample.png',
    'product_sample.png',
    'product_sample.png',
    'product_sample.png',
    'product_sample.png',
  ];

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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.only(right: 8.0, top: 5.0, bottom: 8.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: GRAY_0_COLOR
                    ),
                    borderRadius: BorderRadius.circular(12.0)),

                  child: Image.asset(
                    'asset/images/${productImg[index]}',
                    width: 135.0,
                    height: 135.0,
                  )),
              SizedBox(
                width: 135.0,
                child: Text(
                  widget.productList[index].name,
                  style: productNameTextStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
