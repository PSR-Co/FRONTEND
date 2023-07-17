import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psr/common/const/constants.dart';

import '../../common/const/colors.dart';
import '../../home/component/card_slider.dart';
import '../component/order_list_item.dart';

class OrderListTab extends StatefulWidget {
  OrderListTab({Key? key}): super(key: key);

  @override
  State<OrderListTab> createState() => _OrderListTabState();
}

class _OrderListTabState extends State<OrderListTab> with SingleTickerProviderStateMixin{
  final TextStyle unTabbedTextStyle = const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: GRAY_1_COLOR);
  final TextStyle tabbedTextStyle = const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700, color: PURPLE_COLOR);
  final TextStyle orderTextStyle = const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: GRAY_4_COLOR);
  final TextStyle orderProductTextStyle = const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  final TextStyle orderDateTextStyle = const TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400, color: GRAY_2_COLOR);

  final controller = SliderController();

  late TabController tabController;

  int index = 0;

  //요청받은 상품 리스트
  List<SellProduct> sellProductList = [
    SellProduct("asset/images/profile_img_sample.jpg", "누구게", "asset/images/product_sample.png","요청 상품명", "요청일"),
    SellProduct("asset/images/profile_img_sample.jpg", "누구게", "asset/images/product_sample.png","요청 상품명", "요청일"),
    SellProduct("asset/images/profile_img_sample.jpg", "누구게", "asset/images/product_sample.png","요청 상품명", "요청일"),
  ];

  //요청한 상품 리스트
  List<OrderProduct> orderProductList = [
    OrderProduct("asset/images/profile_img_sample.jpg", "누구게", "asset/images/product_sample.png","요청 상품명", "요청일"),
    OrderProduct("asset/images/profile_img_sample.jpg", "누구게", "asset/images/product_sample.png","요청 상품명", "요청일"),
    OrderProduct("asset/images/profile_img_sample.jpg", "누구게", "asset/images/product_sample.png","요청 상품명", "요청일"),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(
        length: 2,
        vsync: this
    );
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top:1.0, bottom: 15.0),
        child: Column(
          children: [
            renderTabBar(),
            Container(
              height: 350.0,
              // margin: EdgeInsets.only(bottom: 20.0),
                child: TabBarView(
              controller: tabController,
              children: [tabBarView()],
            ))
          ],
        ),
      ),
    );
  }

  Widget renderTabBar(){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 55,
      // margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
      decoration: tabBarDecoration(),
      child: Column(
        children: [
          TabBar(
            controller: tabController,
            isScrollable: true,
            indicatorColor: PURPLE_COLOR,
            indicatorWeight: 3.0,
            indicatorPadding: EdgeInsets.only(left: 10, right: 10),
            labelColor: PURPLE_COLOR,
            labelStyle: tabbedTextStyle,
            unselectedLabelColor: GRAY_1_COLOR,
            unselectedLabelStyle: unTabbedTextStyle,
            tabs: ORDER_LIST_TAB.map((e) => Tab(child: Text(e, textAlign: TextAlign.center,),)).toList(),
          ),
        ],
      ),
    );
  }

  BoxDecoration tabBarDecoration() {
    return BoxDecoration(
        color: Colors.white,
        border: Border(
            bottom: BorderSide(
                color: GRAY_1_COLOR,
                width: 1.0
            )
        )
    );
  }

  void tabListener() {
    setState(() {index = tabController.index;});
  }

  Widget tabBarView(){
    return TabBarView(
      physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: [
          SellProductCardSlider(),
          OrderProductCardSlider()
        ]);
  }

  Widget SellProductCardSlider(){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: WidgetSlider(
        controller: controller,
        itemCount: sellProductList.length,
        infiniteScroll: false,
        proximity: 0.53,
        sizeDistinction: 0.4,
        fixedSize: 260.0,
        itemBuilder: (context, index, activeIndex) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 0.0),
              decoration: const BoxDecoration(
                  color: Colors.white, // background color
                  boxShadow: [
                    BoxShadow(color: LIGHT_SHADOW_COLOR,
                      spreadRadius: 0,
                      blurRadius: 4,
                    ),
                  ],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Container(
                  padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
                  decoration: BoxDecoration(color: Colors.white, shape: BoxShape.rectangle, borderRadius: const BorderRadius.all(Radius.circular(20))),
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipOval(child: Image.asset(sellProductList[index].ordererImg, width: 35.0, height: 35.0, ),),
                              Container(margin:EdgeInsets.only(left: 8.0),child: Text("${sellProductList[index].ordererName}님의 요청", style: orderTextStyle,))
                            ],
                          ),
                          Container(
                              width: 165.0,
                              height: 165.0,
                              margin: EdgeInsets.only(top: 15.0, bottom: 10.0),
                              decoration: BoxDecoration(border: Border.all(color: GRAY_0_COLOR, width: 1.0, style: BorderStyle.solid)),
                              child: ClipRect(child: Image.asset(sellProductList[index].productImg, width: 165.0, height: 165.0, ),)),
                          Text(sellProductList[index].productName, style: orderProductTextStyle,),
                          Text(sellProductList[index].orderDate, style: orderDateTextStyle,)
                        ]
                    ),
                  )
              ),
            ),
          );
        },
      ),
    );
  }


  Widget OrderProductCardSlider(){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: WidgetSlider(
        controller: controller,
        itemCount: orderProductList.length,
        infiniteScroll: false,
        proximity: 0.53,
        sizeDistinction: 0.4,
        fixedSize: 260.0,
        itemBuilder: (context, index, activeIndex) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 0.0),
              decoration: const BoxDecoration(
                  color: Colors.white, // background color
                  boxShadow: [
                    BoxShadow(color: LIGHT_SHADOW_COLOR,
                      spreadRadius: 0,
                      blurRadius: 4,
                    ),
                  ],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Container(
                  padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
                  decoration: BoxDecoration(color: Colors.white, shape: BoxShape.rectangle, borderRadius: const BorderRadius.all(Radius.circular(20))),
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipOval(child: Image.asset(orderProductList[index].sellerImg, width: 35.0, height: 35.0, ),),
                              Container(margin:EdgeInsets.only(left: 8.0),child: Text("${orderProductList[index].sellerName}님의 요청", style: orderTextStyle,))
                            ],
                          ),
                          Container(
                            width: 165.0,
                              height: 165.0,
                              margin: EdgeInsets.only(top: 15.0, bottom: 10.0),
                              decoration: BoxDecoration(border: Border.all(color: GRAY_0_COLOR, width: 1.0, style: BorderStyle.solid)),
                              child: ClipRect(child: Image.asset(orderProductList[index].productImg, width: 165.0, height: 165.0, ),)),
                          Text(orderProductList[index].productName, style: orderProductTextStyle,),
                          Text(orderProductList[index].orderDate, style: orderDateTextStyle,)
                        ]
                    ),
                  )
              ),
            ),
          );
        },
      ),
    );
  }



}
