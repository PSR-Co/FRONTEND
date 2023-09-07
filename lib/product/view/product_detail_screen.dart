import 'package:flutter/material.dart';
import 'package:psr/common/const/colors.dart';
import 'package:psr/model/data/shopping/product_model.dart';
import 'package:psr/model/data/review/review_preview_model.dart';
import 'package:psr/product/component/product_img_page_view_widget.dart';

import '../../presenter/shopping/shopping_service.dart';
import '../component/bottom_navigation_widget.dart';
import '../component/product_detail_appbar.dart';
import '../component/product_detail_widget.dart';
import '../component/product_info_widget.dart';
import '../component/review_list_widget.dart';
import '../component/seller_info_widget.dart';

class ProductDetailScreen extends StatefulWidget {
  final String? category;
  final int productId;

  const ProductDetailScreen({
    this.category,
    required this.productId,
    Key? key
  }) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> with WidgetsBindingObserver {

  bool isLoading = true;

  bool isFolded = true;
  bool isMyProduct = false;

  ProductResponseModel? data;
  ReviewPreviewResponseModel? reviewData;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance!.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: fetchData(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('상품 정보를 불러오지 못하였습니다.'),
          );
        } else {
          bool isEmptyData = (snapshot.hasError || data == null || reviewData == null);
          return Scaffold(
            appBar: ProductDetailAppBar(
            category: data?.data.category ?? "상품 상세",
            isMyProduct: isMyProduct,
            productId: widget.productId,
            productData: data?.data
          ),
            body: (isLoading)
                ? const Center(child: CircularProgressIndicator(color: PURPLE_COLOR,),)
                : renderBody(),
            bottomNavigationBar: (isEmptyData)
                ? null
                : BottomNavigationWidget(
              numOfLike: data!.data.numOfLikes,
              productId: widget.productId,
              productImgUrl: (data!.data.imgList.isNotEmpty) ? data!.data.imgList[0] : null,
              productName: data!.data.name,
              isLiked: data!.data.isLike,
            ),
          );
        }

      }
    );
  }

  /// rendering methods
  Widget renderBody() {
    // if (!isEmptyData) {
      Product product = data!.data;
      ReviewPreviewInfo reviewInfo = reviewData!.data;
      return Container(
        color: Colors.white,
        child: ListView(
          children: [
            ProductImgPageViewWidget(imgKeyList: product.imgList, context: context),
            const SizedBox(height: 25,),
            SellerInfoWidget(sellerName: product.nickname, sellerId: product.userId,),
            ProductInfoWidget(
              productId: widget.productId,
              productName: product.name,
              price: product.price,
              avgOfRating: reviewInfo.avgOfRating ?? 0.0,
              reviewCnt: reviewInfo.numOfReviews,
            ),
            ProductDetailWidget(description: product.description,),
            ReviewListWidget(
              productId: widget.productId,
              reviewList: reviewInfo.reviewList,
            ),
          ],
        ),
      );
    // } else {
      return const Center(
        // child: Text('상품 정보를 불러오지 못하였습니다.'),
        child: CircularProgressIndicator(color: PURPLE_COLOR,),
      );
    // }
  }

  Future<bool> fetchData() async {
    await getProductData();
    await getReviewData();
    isLoading = false;
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
    reviewData = ReviewPreviewResponseModel.fromJson(result);
    return (reviewData != null);
  }
}