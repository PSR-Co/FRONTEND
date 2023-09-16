import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:psr/common/layout/circular_progress_indicator.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';
import 'package:psr/model/data/mypage/myproduct_model.dart';
import 'package:psr/presenter/mypage/mypage_service.dart';

import '../../common/const/colors.dart';
import '../../product/view/product_detail_screen.dart';

class MyPostScreen extends StatefulWidget {
  const MyPostScreen({super.key});

  @override
  State<MyPostScreen> createState() => _MyPostScreenState();
}

class _MyPostScreenState extends State<MyPostScreen> {
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

  MyProductModel? data;
  List<MyProduct> content = [];

  Future<dynamic> fetchData() async {
    return await MyPageService().getMyProduct();
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
              const DefaultAppBarLayout(titleText: "내 게시글"),
              SingleChildScrollView(child: postListView())
            ],
          ),
        ),
      ),
    );
  }

  Widget postListView() {
    return FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            if (kDebugMode) {
              print('my product error: ${snapshot.error.toString()}');
            }
            return const CircularProgress();
          } else if (snapshot.hasData) {
            data = MyProductModel.fromJson(snapshot.data);
            if (data?.data.productList.content == null) {
              if (kDebugMode) {
                print('내 게시글이 존재하지 않습니다.');
              }
              return const CircularProgress();
            }
            content = data!.data.productList.content;
          } else if (!snapshot.hasData) {
            print('내 게시글을 불러올 수 없습니다.');
            return const CircularProgress();
          } else {
            return const CircularProgress();
          }
          return Container(
            margin: const EdgeInsets.only(top: 15.0),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: content.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {tapProduct(content[index].productId);},
                  title: GestureDetector(
                    child: postListItem(
                        content[index].imgUrl,
                        content[index].category,
                        content[index].name,
                        content[index].price),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 17.0),
                );
              },
            ),
          );
        });
  }

  ///추후 이미지 연결
  Widget postListItem(String? imgKey, String category, String name, int price) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        renderProductImage(),
        renderProductInfo(category, name, price)
      ],
    );
  }

  Widget renderProductImage() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: GRAY_0_COLOR),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Image.asset(
          "asset/images/product_sample.png",
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

  void tapProduct(int productId) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => ProductDetailScreen(productId: productId),
        settings: const RouteSettings(name: '/productDetail')));
  }
}
