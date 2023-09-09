import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../common/const/colors.dart';
import '../view/product_detail_screen.dart';

class SellerProductListItem extends StatefulWidget {
  final int productId;

  final String imgUrl;
  final String category;
  final String name;
  final int price;

  const SellerProductListItem({
    required this.productId,
    required this.imgUrl,
    required this.category,
    required this.name,
    required this.price,
    Key? key
  }) : super(key: key);

  @override
  State<SellerProductListItem> createState() => _SellerProductListItemState();
}

class _SellerProductListItemState extends State<SellerProductListItem> {
  final cateogoryTextStyle = const TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: GRAY_4_COLOR,
  );

  final nameTextStyle = const TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    color: GRAY_4_COLOR,
  );

  final priceTextStyle = const TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: didTapItem,
      child: IntrinsicHeight(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child: Row(
            children: [
              renderProductImage(),
              const SizedBox(width: 10,),
              renderProductInfo(),
            ],
          ),
        ),
      ),
    );
  }

  /// rendering methods
  Widget renderProductImage() {
    return Container(
        width: 90,
        height: 90,
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          border: Border.all(
              width: 1.0,
              color: GRAY_0_COLOR
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Image.network(widget.imgUrl, fit: BoxFit.cover,)
    );
  }

  Widget renderProductInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.category, style: cateogoryTextStyle,),
          const SizedBox(height: 5,),
          Text(widget.name, style: nameTextStyle,),
          Text('${getTrimmedPrice()}원', style: priceTextStyle,),
        ],
      ),
    );
  }

  /// helper methods
  String getTrimmedPrice() {
    return NumberFormat.currency(locale: 'ko_KR', symbol: '').format(widget.price);
  }

  /// event methods
  void didTapItem() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => ProductDetailScreen(category: widget.category, productId: widget.productId,), settings: const RouteSettings(name: '/productDetail')));
  }
}
