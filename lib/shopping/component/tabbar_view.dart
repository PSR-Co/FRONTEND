import 'package:flutter/material.dart';
import 'package:psr/shopping/component/popular_list_item.dart';

import 'category_list_item.dart';

class ShoppingTabBarView extends StatefulWidget {
  final String categoryName;

  const ShoppingTabBarView({
    required this.categoryName,
    Key? key
  }) : super(key: key);

  @override
  State<ShoppingTabBarView> createState() => _ShoppingTabBarViewState();
}

class _ShoppingTabBarViewState extends State<ShoppingTabBarView> {
  final titleStyle = TextStyle(
    color: Colors.black,
    fontSize: 18.0,
    fontWeight: FontWeight.w500
  );

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        // TODO: api 호출
        print('refresh tabBar view');
      },
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          renderTitle('📌 인기목록'),
          renderPopularListView(),
          SizedBox(height: 5.0),
          renderTitle(widget.categoryName),
          renderCategoryListView(),
        ],
      ),
    );
  }

  /// 각 리스트뷰의 타이틀 반환
  Widget renderTitle(String titleStr) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      padding: EdgeInsets.only(left: 12.0, right: 8.0, top: 18.0, bottom: 12.0),
      color: Colors.white,
      child: Text(titleStr, style: titleStyle),
    );
  }

  /// 인기목록 아이템 리스트 컴포넌트 반환
  Widget renderPopularListView() {
    return Container(
      padding: EdgeInsets.only(left: 10.0),
      color: Colors.white,
      height: 265,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          // TODO: api연결 후 수정
          PopularListItem(category: widget.categoryName,),
          PopularListItem(category: widget.categoryName,),
          PopularListItem(category: widget.categoryName,),
          PopularListItem(category: widget.categoryName,),
          PopularListItem(category: widget.categoryName,),
        ],
      ),
    );
  }

  /// 카테고리별 아이템 리스트 컴포넌트 반환
  Widget renderCategoryListView() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          // TODO: api연결 후 수정
          CategoryListItem(),
          CategoryListItem(),
          CategoryListItem(),
          CategoryListItem(),
          CategoryListItem(),
          CategoryListItem(),
        ],
      ),
    );
  }

}
