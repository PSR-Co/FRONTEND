import 'package:flutter/material.dart';
import 'package:psr/common/const/colors.dart';
import 'package:psr/presenter/shopping/shopping_service.dart';
import 'package:psr/shopping/component/popular_list_item.dart';


import '../../model/data/shopping/shopping_main_model.dart';
import 'category_list_item.dart';

class ShoppingTabBarWidget extends StatefulWidget {
  final String categoryName;

  const ShoppingTabBarWidget({
    required this.categoryName,
    Key? key
  }) : super(key: key);

  @override
  State<ShoppingTabBarWidget> createState() => _ShoppingTabBarWidgetState();
}

class _ShoppingTabBarWidgetState extends State<ShoppingTabBarWidget> {

  bool isLoading = true;

  ShoppingMainResponse? data;
  List<PopularProduct> popularList = [];
  List<Product> productList = [];

  Future<dynamic> fetchData() async {
    dynamic data = await ShoppingService().getShoppingMainData(widget.categoryName);
    isLoading = false;
    return data;
  }

  final titleStyle = const TextStyle(
    color: Colors.black,
    fontSize: 18.0,
    fontWeight: FontWeight.w500
  );

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        fetchData();
      },
      child: FutureBuilder<dynamic> (
          future: fetchData(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('상품 정보를 불러오지 못 하였습니다.'),
              );
            }
            else {
              if (isLoading) {
                return const Center(child: CircularProgressIndicator(color: PURPLE_COLOR,),);
              }
              data = ShoppingMainResponse.fromJson(snapshot.data);
              popularList = data!.data.popularList;
              productList = data!.data.productList.content;

              if (data?.code != 200 || popularList.isEmpty && productList.isEmpty) {
                return const Center(
                  child: Text('불러올 상품 정보가 없습니다.'),
                );
              }

            }
            return ListView(
              scrollDirection: Axis.vertical,
              children: [
                renderTitle('📌 인기목록'),
                renderPopularListView(popularList),
                const SizedBox(height: 5.0),
                renderTitle(widget.categoryName),
                renderCategoryListView(productList),
              ],
            );
          }
      )
    );
  }

  /// 각 리스트뷰의 타이틀 반환
  Widget renderTitle(String titleStr) {
    if (titleStr.contains('\n')) {
      titleStr = titleStr.replaceAll('\n', ' ');
    }
    return Container(
      padding: const EdgeInsets.only(left: 18.0, right: 8.0, top: 18.0, bottom: 12.0),
      color: Colors.white,
      child: Text(titleStr, style: titleStyle),
    );
  }

  /// 인기목록 아이템 리스트 컴포넌트 반환
  Widget renderPopularListView(List<PopularProduct> data) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0),
      color: Colors.white,
      height: MediaQuery.of(context).size.width / 2 + 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return PopularListItem(
            category: widget.categoryName,
            productId: data[index].productId,
            data: data[index],
            index: index,
          );
        },
      ),
    );
  }

  /// 카테고리별 아이템 리스트 컴포넌트 반환
  Widget renderCategoryListView(List<Product> data) {
    return Container(
      height: 100.0 * data.length,
      color: Colors.white,
      child:
      ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return CategoryListItem(
            category: widget.categoryName,
            productId: data[index].productId,
            data: data[index],
          );
        },
      ),
    );
  }

}
