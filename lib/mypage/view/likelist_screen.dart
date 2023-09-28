import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:psr/common/layout/circular_progress_indicator.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';
import 'package:psr/model/data/mypage/like_model.dart';
import 'package:psr/presenter/mypage/mypage_service.dart';

import '../../common/const/colors.dart';
import '../../product/view/product_detail_screen.dart';

class LikeListScreen extends StatefulWidget {
  const LikeListScreen({super.key});

  @override
  State<LikeListScreen> createState() => _LikeListScreenState();
}

class _LikeListScreenState extends State<LikeListScreen> {
  // 제품 정보 텍스트 스타일 정의
  final brandNameTextStyle = const TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    color: GRAY_4_COLOR,
  );

  final productNameTextStyle = const TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    color: GRAY_4_COLOR,
  );

  final priceTextStyle = const TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  LikeModel? data;
  List<Like> content = [];
  bool isLike = true;

  Future<dynamic> fetchData() async {
    return await MyPageService().getLikes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const DefaultAppBarLayout(titleText: "찜"),
              Expanded(child: likeListView())
            ],
          ),
        ),
      ),
    );
  }

  Widget likeListView() {
    return FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            if (kDebugMode) {
              print('likes error: ${snapshot.error.toString()}');
            }
            return const Center(
              child: Text('찜 : 에러가 있습니다'),
            );
          } else if (snapshot.hasData) {
            data = LikeModel.fromJson(snapshot.data);
            if (data?.data.productList.content == null) {
              if (kDebugMode) {
                print('likes error: 찜한 게시글이 존재하지 않습니다.');
              }
              return const CircularProgress();
            }
            content = data!.data.productList.content;
          } else {
            return const CircularProgress();
          }
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding:  const EdgeInsets.symmetric(
                    vertical: 5.0, horizontal: 17.0),
              margin: const EdgeInsets.only(top: 15.0),
              child: content.isEmpty ? Center( child: Container(
                alignment: Alignment.center,
                  padding: const EdgeInsets.only(bottom: 15.0),
                  height: MediaQuery.of(context).size.height,
                  child: const Text('찜한 게시글이 존재하지 않습니다.',)),
          ) : Column(children: content.map((e) =>
                  GestureDetector(
                      child: likeListItem(
                          e.imgUrl,
                          e.category,
                          e.name,
                          e.price,
                          isLike),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => ProductDetailScreen(
                            productId: e.productId),
                        settings: const RouteSettings(name: '/productDetail')));

                  },),
              ).toList(),)
              ),
            );}
          );
  }

  ///추후 이미지 연결
  Widget likeListItem(
      String? imgKey, String category, String name, int price, bool isLike) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 90,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          renderProductImage(imgKey),
          renderProductInfo(category, name, price),
          Expanded(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 90.0,
                  alignment: Alignment.centerRight,
                  child: renderLikeButton(isLike)))
        ],
      ),
    );
  }

  Widget renderProductImage(String? imgKey) {
    return Container(
      width: 90,
      height: 90,
        margin: const EdgeInsets.fromLTRB(5.0,0,10.0,0),
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: GRAY_0_COLOR),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child:(imgKey == null)
        ? const Icon(
          Icons.question_mark,
          color: PURPLE_COLOR,
          size: 90,
        )
        : Image.network(imgKey),
    );
  }

  Widget renderProductInfo(String category, String name, int price) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: Text(
            category,
            style: brandNameTextStyle,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: Text(
            name,
            style: productNameTextStyle,
          ),
        ),
        Expanded(
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Text(
              priceConverter(price),
              style: priceTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  priceConverter(int price) {
    String result = '${price ~/ 1000},000원';
    return result;
  }

  Widget renderLikeButton(bool isLike) {
    Widget likeIcon;
    likeIcon = SvgPicture.asset(
      'asset/icons/common/favorite_border.fill.svg',
      width: 25,
      height: 25,
    );

    return IconButton(
        splashColor: Colors.transparent,
        // onPressed: didTapLikeButton(isLike),
        onPressed: () {},
        padding: const EdgeInsets.only(right: 0.0),
        constraints: const BoxConstraints(),
        icon: likeIcon);
  }

// didTapLikeButton(bool isLike) {
//   print('didTapLikeButton');
//   setState(() {
//     isLike = !isLike;
//   });
// }
//
// checkIsLike({required Widget widget, required bool isLike}) {
//   if(isLike) {return widget;}
// }
}
