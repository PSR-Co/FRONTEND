import 'package:flutter/material.dart';
import 'package:psr/shopping/component/product_img_page_view_widget.dart';

import '../component/bottom_navigation_widget.dart';
import '../component/product_detail_appbar.dart';
import '../component/product_detail_widget.dart';
import '../component/product_info_widget.dart';
import '../component/review_list_widget.dart';
import '../component/seller_info_widget.dart';

class ProductDetailScreen extends StatefulWidget {
  final String category;

  const ProductDetailScreen({required this.category, Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {

  bool isFolded = true;
  final isMyProduct = false;

  final String sellerName = "루시 앤플 셀러";
  final String name = "폴로랄프로렌 목도리";
  final double avgOfRating = 5.0;
  final int reviewCnt = 12;
  final int price = 79000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProductDetailAppBar(
        category: widget.category, isMyProduct: isMyProduct,
      ),
      body: renderBody(),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }

  /// rendering methods
  Widget renderBody() {

    final List<String> imgKeyList = [
      "asset/images/product_sample.png",
      "asset/images/product_sample.png",
      "asset/images/product_sample.png",
      "asset/images/product_sample.png",
      "asset/images/product_sample.png",
    ];
    
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          ProductImgPageViewWidget(imgKeyList: imgKeyList, context: context),
          SizedBox(height: 25,),
          SellerInfoWidget(sellerName: sellerName,),
          ProductInfoWidget(
            productName: name,
            price: price,
            avgOfRating: avgOfRating,
            reviewCnt: reviewCnt,
          ),
          ProductDetailWidget(),
          ReviewListWidget(),
        ],
      ),
    );
  }

}