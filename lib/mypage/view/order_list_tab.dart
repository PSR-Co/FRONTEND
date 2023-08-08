import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psr/common/const/constants.dart';
import 'package:psr/common/layout/large_detail_bar_layout.dart';
import 'package:psr/common/view/body_tab.dart';
import 'package:psr/mypage/view/orderlist_screen.dart';
import 'package:psr/mypage/view/seller_detail_order_screen.dart';

import '../../common/const/colors.dart';
import '../../home/component/card_slider.dart';
import '../component/mypage.dart';
import '../component/order_list_item.dart';

class OrderListTab extends StatefulWidget {
  MyPage myPageData;

  OrderListTab({required this.myPageData, Key? key}) : super(key: key);

  @override
  State<OrderListTab> createState() => _OrderListTabState();
}

class _OrderListTabState extends State<OrderListTab>
    with SingleTickerProviderStateMixin {
  final TextStyle orderTextStyle = const TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.w400, color: GRAY_4_COLOR);
  final TextStyle orderProductTextStyle = const TextStyle(
      fontSize: 15.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  final TextStyle orderDateTextStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w400, color: GRAY_2_COLOR);

  final controller = SliderController();

  //요청받은 상품 리스트
  // List<OrderProduct> sellProductList = [
  //   OrderProduct("asset/images/profile_img_sample.jpg", "누구게", "asset/images/product_sample.png","요청 상품명", "요청일"),
  //   OrderProduct("asset/images/profile_img_sample.jpg", "누구게", "asset/images/product_sample.png","요청 상품명", "요청일"),
  //   OrderProduct("asset/images/profile_img_sample.jpg", "누구게", "asset/images/product_sample.png","요청 상품명", "요청일"),
  // ];

  //요청한 상품 리스트
  // List<OrderProduct> orderProductList = [
  //   OrderProduct("asset/images/profile_img_sample.jpg", "누구게", "asset/images/product_sample.png","요청 상품명", "요청일"),
  //   OrderProduct("asset/images/profile_img_sample.jpg", "누구게", "asset/images/product_sample.png","요청 상품명", "요청일"),
  //   OrderProduct("asset/images/profile_img_sample.jpg", "누구게", "asset/images/product_sample.png","요청 상품명", "요청일"),
  // ];

  @override
  Widget build(BuildContext context) {
    List<SellProduct> sellProductList = widget.myPageData.sellList;
    List<OrderProduct> orderProductList = widget.myPageData.orderList;

    return BodyTab(
      tabTitle: LargeDetailBar(
          title: "요청목록",
          moveTo: OrderListScreen(
              sellProductList: sellProductList,
              orderProductList: orderProductList)),
      tabBarViewChild: [
        sellProductCardSlider(productList: sellProductList),
        orderProductCardSlider(productList: orderProductList)
      ],
      titleList: ORDER_LIST_TAB,
    );
  }

  Widget sellProductCardSlider({required List<SellProduct> productList}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: WidgetSlider(
        controller: controller,
        itemCount: productList.length,
        infiniteScroll: false,
        proximity: 0.53,
        sizeDistinction: 0.4,
        itemBuilder: (context, index, activeIndex) {
          return cardContent(
              productList[index].ordererName,
              productList[index].productImgKey,
              productList[index].productName,
              productList[index].orderDate);
        },
      ),
    );
  }

  Widget orderProductCardSlider({required List<OrderProduct> productList}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: WidgetSlider(
        controller: controller,
        itemCount: productList.length,
        infiniteScroll: false,
        proximity: 0.53,
        sizeDistinction: 0.4,
        itemBuilder: (context, index, activeIndex) {
          return cardContent(
              productList[index].sellerName,
              productList[index].productImgKey,
              productList[index].productName,
              productList[index].orderDate);
        },
      ),
    );
  }

  Widget cardContent(String ordererName, String productImg, String productName, String orderDate) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => (SellerDetailOrderSccreen(
                      selectedValue: '',
                      orderDate: orderDate,
                      productName: productName,
                      btnOption1: '요청승인',
                      btnOption2: '요청거절',
                    ))));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 0.0),
        decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: LIGHT_SHADOW_COLOR,
                spreadRadius: 0,
                blurRadius: 4,
              ),
            ],
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "$ordererName님의 요청",
                          style: orderTextStyle,
                        )),
                    Container(
                        width: 170.0,
                        height: 170.0,
                        margin: const EdgeInsets.only(top: 15.0, bottom: 10.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: GRAY_0_COLOR,
                                width: 1.0,
                                style: BorderStyle.solid)),
                        child: ClipRect(
                          child: Image.asset(
                            productImg,
                            width: 165.0,
                            height: 165.0,
                          ),
                        )),
                    Text(
                      productName,
                      style: orderProductTextStyle,
                    ),
                    Text(
                      orderDate,
                      style: orderDateTextStyle,
                    )
                  ]),
            )),
      ),
    );
  }
}
