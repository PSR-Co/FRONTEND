import 'package:flutter/material.dart';
import 'package:psr/model/data/shopping/product_model.dart';
import 'package:psr/model/data/shopping/review_model.dart';
import 'package:psr/product/component/product_img_page_view_widget.dart';

import '../../presenter/shopping/shopping_service.dart';
import '../component/bottom_navigation_widget.dart';
import '../component/product_detail_appbar.dart';
import '../component/product_detail_widget.dart';
import '../component/product_info_widget.dart';
import '../component/review_list_widget.dart';
import '../component/seller_info_widget.dart';

class ProductDetailScreen extends StatefulWidget {
  final String category;
  final int productId;

  const ProductDetailScreen({
    required this.category,
    required this.productId,
    Key? key
  }) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {

  bool isFolded = true;
  bool isMyProduct = false;

  ProductResponseModel? data;
  ReviewResponseModel? reviewData;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: fetchData(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        bool isEmptyData = (snapshot.hasError || data == null || reviewData == null);
        return Scaffold(
          appBar: ProductDetailAppBar(
            category: widget.category, isMyProduct: isMyProduct,
          ),
          body: renderBody(isEmptyData),
          bottomNavigationBar: BottomNavigationWidget(numOfLike: isEmptyData ? 0 : data!.data.numOfLikes,),
        );
      }
    );
  }

  /// rendering methods
  Widget renderBody(bool isEmptyData) {
    if (!isEmptyData) {
      Product product = data!.data;
      ReviewInfo reviewInfo = reviewData!.data;
      return Container(
        color: Colors.white,
        child: ListView(
          children: [
            ProductImgPageViewWidget(imgKeyList: product.imgList, context: context),
            const SizedBox(height: 25,),
            SellerInfoWidget(sellerName: product.nickname,),
            ProductInfoWidget(
              productName: product.name,
              price: product.price,
              avgOfRating: reviewInfo.avgOfRating ?? 0.0,
              reviewCnt: reviewInfo.numOfReviews,
            ),
            ProductDetailWidget(description: product.description,),
            ReviewListWidget(reviewList: reviewInfo.reviewList,),
          ],
        ),
      );
    } else {
      return const Center(
        child: Text('상품 정보를 불러오지 못하였습니다.'),
      );
    }
  }

  Future<bool> fetchData() async {
    await getProductData();
    await getReviewData();
    return (data != null && reviewData != null);
  }

  Future<bool> getProductData() async {
    final result = await ShoppingService().getProductData('${widget.productId}');
    data = ProductResponseModel.fromJson(result);
    isMyProduct = data?.data.isOwner ?? false;
    return (data != null);
  }

  Future<bool> getReviewData() async {
    final result = await ShoppingService().getReviewData('${widget.productId}');
    reviewData = ReviewResponseModel.fromJson(result);
    return (reviewData != null);
  }
}