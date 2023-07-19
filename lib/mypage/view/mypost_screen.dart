import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';

import '../../common/const/colors.dart';
import '../component/post_list_item.dart';

class MyPostScreen extends StatefulWidget {
  const MyPostScreen({super.key});

  @override
  State<MyPostScreen> createState() => _MyPostScreenState();
}

class _MyPostScreenState extends State<MyPostScreen> {
  // 제품 정보 텍스트 스타일 정의
  final brandNameTextStyle = TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR,);

  final productNameTextStyle = TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: GRAY_4_COLOR,);

  final priceTextStyle = TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.black,);
 
  List<MyPost> postList = [
    MyPost("asset/images/product_sample.png", "방송가능 아웃소싱", "폴로랄프로렌 목도리 Red Color", 79000),
    MyPost("asset/images/product_sample.png", "방송가능 아웃소싱", "폴로랄프로렌 목도리 Red Color", 79000),
    MyPost("asset/images/product_sample.png", "방송가능 아웃소싱", "폴로랄프로렌 목도리 Red Color", 79000),
    MyPost("asset/images/product_sample.png", "방송가능 아웃소싱", "폴로랄프로렌 목도리 Red Color", 79000),
    MyPost("asset/images/product_sample.png", "방송가능 아웃소싱", "폴로랄프로렌 목도리 Red Color", 79000),
    MyPost("asset/images/product_sample.png", "방송가능 아웃소싱", "폴로랄프로렌 목도리 Red Color", 79000),
    MyPost("asset/images/product_sample.png", "방송가능 아웃소싱", "폴로랄프로렌 목도리 Red Color", 79000),
    MyPost("asset/images/product_sample.png", "방송가능 아웃소싱", "폴로랄프로렌 목도리 Red Color", 79000),
    MyPost("asset/images/product_sample.png", "방송가능 아웃소싱", "폴로랄프로렌 목도리 Red Color", 79000),
    MyPost("asset/images/product_sample.png", "방송가능 아웃소싱", "폴로랄프로렌 목도리 Red Color", 79000)
  ];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              DefaultAppBarLayout(titleText: "내 게시글"),
              Expanded(child: postListView())
            ],
          ),
        ),
      ),
    );
  }

  Widget postListView(){
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: postList.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {},
            title: GestureDetector(
              child: postListItem(postList[index].productImgKey, postList[index].category, postList[index].name, postList[index].price),
            ),
            contentPadding: const EdgeInsets.symmetric(
                vertical: 5.0, horizontal: 17.0),
          );
        },
      ),
    );
  }

  Widget postListItem(String imgKey, String category, String name, int price) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        renderProductImage(imgKey),
        renderProductInfo(category, name, price)
      ],
    );
  }

  Widget renderProductImage(String imgKey) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          border: Border.all(
              width: 1.0,
              color: GRAY_0_COLOR
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Image.asset(imgKey, width: 90, height: 90,)
    );
  }

  Widget renderProductInfo(String category, String name, int price) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(category, style: brandNameTextStyle,),
        Text(name, style: productNameTextStyle,),
        Text(priceConverter(price), style: priceTextStyle,),
      ],
    );
  }

  priceConverter(int price) {
    String result = '${price ~/ 1000},000원';
    return result;
  }
}
