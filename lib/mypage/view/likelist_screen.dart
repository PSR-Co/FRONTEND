import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';
import 'package:psr/model/data/mypage/like_model.dart';
import 'package:psr/mypage/component/like_list_item.dart';
import 'package:psr/presenter/mypage/mypage_service.dart';

import '../../common/const/colors.dart';

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
          print('likes error: ${snapshot.error.toString()}');
          return const Center(
            child: Text('찜 : 에러가 있습니다'),
          );
        } else if (snapshot.hasData) {
          data = LikeModel.fromJson(snapshot.data);
          if (data?.data.productList.content == null) {
            return const Center(
              child: Text('찜한 게시글이 존재하지 않습니다.'),
            );
          }
          content = data!.data.productList.content;
        } else if (!snapshot.hasData) {
          return const Center(
            child: Text('찜한 게시글을 불러올 수 없습니다.'),
          );
        } else {
          return Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              child: const CircularProgressIndicator());
        }
        return Container(
          margin: const EdgeInsets.only(top: 15.0),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: content.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {},
                title: GestureDetector(
                    child: likeListItem(
                        content[index].imgUrl,
                        content[index].nickname,
                        content[index].name,
                        content[index].price,
                        isLike)),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 17.0),
              );
            },
          ),
        );
      }
    );
  }

  ///추후 이미지 연결
  Widget likeListItem(
      String? imgKey, String nickname, String name, int price, bool isLike) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          renderProductImage("asset/images/product_sample.png"),
          renderProductInfo(nickname, name, price),
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

  Widget renderProductImage(String imgKey) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: GRAY_0_COLOR),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Image.asset(
          imgKey,
          width: 90,
          height: 90,
        ));
  }

  Widget renderProductInfo(String category, String name, int price) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category,
          style: brandNameTextStyle,
        ),
        Text(
          name,
          style: productNameTextStyle,
        ),
        Text(
          priceConverter(price),
          style: priceTextStyle,
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
      'asset/icons/common/heart.svg',
      width: 25,
      height: 25,
    );

    return IconButton(
        // onPressed: didTapLikeButton(isLike),
        onPressed: (){},
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
