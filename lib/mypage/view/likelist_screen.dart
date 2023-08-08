import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';
import 'package:psr/mypage/component/like_list_item.dart';

import '../../common/const/colors.dart';
import '../../product/view/product_detail_screen.dart';

class LikeListScreen extends StatefulWidget {
  const LikeListScreen({super.key});

  @override
  State<LikeListScreen> createState() => _LikeListScreenState();
}

class _LikeListScreenState extends State<LikeListScreen> {

  @override
  void initState() {
    super.initState();
    bool isLiked = false;
  }
  // 제품 정보 텍스트 스타일 정의
  final brandNameTextStyle = TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR,);

  final productNameTextStyle = TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: GRAY_4_COLOR,);

  final priceTextStyle = TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.black,);

  List<Like> likeList = [
    Like("asset/images/product_sample.png", "루시 앤플 셀러", "폴로랄프로렌 목도리 Red Color", 79000, true),
    Like("asset/images/product_sample.png", "루시 앤플 셀러", "폴로랄프로렌 목도리 Red Color", 79000, true),
    Like("asset/images/product_sample.png", "루시 앤플 셀러", "폴로랄프로렌 목도리 Red Color", 79000, true),
    Like("asset/images/product_sample.png", "루시 앤플 셀러", "폴로랄프로렌 목도리 Red Color", 79000, true),
    Like("asset/images/product_sample.png", "루시 앤플 셀러", "폴로랄프로렌 목도리 Red Color", 79000, true),
    Like("asset/images/product_sample.png", "루시 앤플 셀러", "폴로랄프로렌 목도리 Red Color", 79000, true),
    Like("asset/images/product_sample.png", "루시 앤플 셀러", "폴로랄프로렌 목도리 Red Color", 79000, true),
    Like("asset/images/product_sample.png", "루시 앤플 셀러", "폴로랄프로렌 목도리 Red Color", 79000, true),
    Like("asset/images/product_sample.png", "루시 앤플 셀러", "폴로랄프로렌 목도리 Red Color", 79000, true),
    Like("asset/images/product_sample.png", "루시 앤플 셀러", "폴로랄프로렌 목도리 Red Color", 79000, true),
    Like("asset/images/product_sample.png", "취소", "폴로랄프로렌 목도리 Red Color", 79000, false),
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
              DefaultAppBarLayout(titleText: "찜"),
              Expanded(child: likeListView())
            ],
          ),
        ),
      ),
    );
  }

  Widget likeListView(){
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: likeList.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {},
            title: GestureDetector(
              child: likeListItem(likeList[index].productImgKey, likeList[index].nickname, likeList[index].name, likeList[index].price, likeList[index].isLike)
            ),
            contentPadding: const EdgeInsets.symmetric(
                vertical: 5.0, horizontal: 17.0),
          );
        },
      ),
    );
  }

  Widget likeListItem(String imgKey, String nickname, String name, int price, bool isLike) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          renderProductImage(imgKey),
          renderProductInfo(nickname, name, price),
          Expanded(child: Container(
              width: MediaQuery.of(context).size.width,
              height: 90.0,
              alignment: Alignment.centerRight,
              child: renderLikeButton(isLike)))
        ],
      ),
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
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(category, style: brandNameTextStyle,),
          Text(name, style: productNameTextStyle,),
          Text(priceConverter(price), style: priceTextStyle,),
        ],
      ),
    );
  }

  priceConverter(int price) {
    String result = '${price ~/ 1000},000원';
    return result;
  }

  Widget renderLikeButton(bool isLike) {
    Widget likeIcon;
    likeIcon = SvgPicture.asset('asset/icons/common/heart.svg', width: 25, height: 25,);

    return IconButton(
        onPressed: didTapLikeButton(isLike),
        padding: EdgeInsets.only(right: 0.0),
        constraints: BoxConstraints(),
        icon: likeIcon
    );
  }

  didTapLikeButton(bool isLike) {
    print('didTapLikeButton');
    // setState(() {
    //   isLike = !isLike;
    // });
  }

  // checkIsLike({required Widget widget, required bool isLike}) {
  //   if(isLike) {return widget;}
  // }
}
