import 'package:flutter/material.dart';
import 'package:psr/common/const/colors.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';
import 'package:psr/presenter/shopping/shopping_service.dart';

import '../../model/data/shopping/user_product_model.dart';
import '../component/seller_product_list_item.dart';

class SellerProfileScreen extends StatefulWidget {
  final int userId;

  const SellerProfileScreen({
    required this.userId,
    Key? key
  }) : super(key: key);

  @override
  State<SellerProfileScreen> createState() => _SellerProfileScreenState();
}

class _SellerProfileScreenState extends State<SellerProfileScreen> {
  static const PROFILE_IMG_SIZE = 64.0;

  // final int productCnt = 15;  // TODO: 패치 후 데이터 개수로 변경하기

  UserProductResponse? data;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: fetchData(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (!snapshot.hasError && data != null) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: const DefaultAppBarLayout(titleText: '프로필',),
            body: renderBody(data!.data),
          );
        } else {
          return const Scaffold(
            backgroundColor: Colors.white,
            appBar: DefaultAppBarLayout(titleText: '프로필',),
            body: Center(
              child: Text('판매자 상품 정보를 불러오지 못하였습니다.', style: TextStyle(fontSize: 14),),
            )
          );
        }
      }
    );
  }

  /// rendering methods
  Widget renderBody(UserProductInfo userInfo) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          renderSellerInfoView(userInfo),
          Container(height: 5, color: GRAY_0_COLOR.withOpacity(0.5),),
          renderProductList(userInfo.productList),
        ],
      ),
    );
  }

  Widget renderSellerInfoView(UserProductInfo userInfo) {
    return Container(
      height: 110,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, right: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(PROFILE_IMG_SIZE/2),
              child:
              (userInfo.imgUrl == null)
              ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(PROFILE_IMG_SIZE/2),
                  color: Colors.grey.withOpacity(0.2)
                ),
                child: Icon(Icons.person, size: PROFILE_IMG_SIZE, color: Colors.grey.withOpacity(0.6),),
              )
              : Image.network(
                  userInfo.imgUrl!,
                  fit: BoxFit.cover,
                  width: PROFILE_IMG_SIZE, height: PROFILE_IMG_SIZE,
                )
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              renderSellerRole(userInfo.type),
              renderSellerName(userInfo.nickname),
            ],
          ),
        ],
      ),
    );
  }

  Widget renderSellerRole(String role) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
      margin: const EdgeInsets.only(top: 30, bottom: 8, left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: PINK_COLOR.withOpacity(0.2),
      ),
      child: Text(role, style: const TextStyle(
        color: PINK_COLOR,
        fontSize: 12,
        fontWeight: FontWeight.w700
      ),),
    );
  }

  Widget renderSellerName(String sellerName) {
    const nameStyle = TextStyle(
      fontSize: 14,
      color: Colors.black,
      fontWeight: FontWeight.w500
    );

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(sellerName, style: nameStyle,)
    );
  }

  Widget renderProductList(UserProductList productList) {
    const titleStyle = TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          padding: const EdgeInsets.only(left: 15, top: 20, bottom: 15),
          child: const Text('글 목록', style: titleStyle,),
        ),
        renderProductListView(productList.content),
      ],
    );
  }

  Widget renderProductListView(List<UserProduct> productList) {
    return SizedBox(
      height: 110.0 * (productList.length - 1) + 10,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: productList.length,
          itemBuilder: (BuildContext context, int index) {
            return SellerProductListItem(
              productId: productList[index].productId,
              imgUrl: productList[index].imgUrl,
              category: productList[index].category,
              name: productList[index].name,
              price: productList[index].price,
            );
          }
      ),
    );
  }

  Future<bool> fetchData() async {
    final result = await ShoppingService().getUserProductsData('${widget.userId}');
    data = UserProductResponse.fromJson(result);
    return (data != null);
  }
}
