import 'package:flutter/material.dart';
import 'package:psr/common/const/colors.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';

import '../component/seller_product_list_item.dart';

class SellerProfileScreen extends StatefulWidget {
  const SellerProfileScreen({Key? key}) : super(key: key);

  @override
  State<SellerProfileScreen> createState() => _SellerProfileScreenState();
}

class _SellerProfileScreenState extends State<SellerProfileScreen> {
  static const PROFILE_IMG_SIZE = 64.0;

  final int productCnt = 15;  // TODO: 패치 후 데이터 개수로 변경하기

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarLayout(titleText: '프로필',),
      body: renderBody(),
    );
  }

  /// rendering methods
  Widget renderBody() {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          renderSellerInfoView(),
          Container(height: 5, color: GRAY_0_COLOR.withOpacity(0.5),),
          renderProductList(),
        ],
      ),
    );
  }

  Widget renderSellerInfoView() {
    return Container(
      height: 110,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(PROFILE_IMG_SIZE/2),
              child: Image.asset('asset/images/profile_img_sample.jpg', fit: BoxFit.cover, width: PROFILE_IMG_SIZE,),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              renderSellerRole(),
              renderSellerName(),
            ],
          ),
        ],
      ),
    );
  }

  Widget renderSellerRole() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
      margin: EdgeInsets.only(top: 30, bottom: 8, left: 10),
      child: Text('사업자', style: TextStyle(
        color: PINK_COLOR,
        fontSize: 12,
        fontWeight: FontWeight.w700
      ),),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: PINK_COLOR.withOpacity(0.2),
      ),
    );
  }

  Widget renderSellerName() {
    final nameStyle = TextStyle(
      fontSize: 14,
      color: Colors.black,
      fontWeight: FontWeight.w500
    );

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Text('루시 앤플 셀러', style: nameStyle,)
    );
  }

  Widget renderProductList() {
    final titleStyle = TextStyle(
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
          padding: EdgeInsets.only(left: 15, top: 20, bottom: 15),
          child: Text('글 목록', style: titleStyle,),
        ),
        renderProductListView(),
      ],
    );
  }

  Widget renderProductListView() {
    return Container(
      height: 110.0 * (productCnt - 1),
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: productCnt,
          itemBuilder: (BuildContext context, int index) {
            return SellerProductListItem(
              imgKey: 'asset/images/product_sample.png',
              category: '방송가능 아웃소싱',
              name: '폴로랄프로렌 목도리 Red Color',
              price: 79000,
            );
          }
      ),
    );
  }
}
