import 'package:flutter/cupertino.dart';

import '../../common/const/colors.dart';

class ProductListItem extends StatefulWidget {
  const ProductListItem({super.key});

  @override
  State<ProductListItem> createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  ///
  List<String> productName = ['상품명', '상품명', '상품명', '상품명', '상품명',];

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
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 170.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productName.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(right: 8.0, top: 5.0, bottom: 8.0),
                  child: Image.asset('asset/images/${productImg[index]}', width: 135.0,
                    height: 135.0,)),
              Text(productName[index], style: productNameTextStyle,)
            ],
          );
        },

      ),
    );
  }
}
