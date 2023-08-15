import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../model/data/shopping/shopping_main_model.dart';
import '../../shopping/component/category_list_item.dart';
import '../const/colors.dart';

class SearchDetailScreen extends StatefulWidget {
  const SearchDetailScreen({Key? key}) : super(key: key);

  @override
  State<SearchDetailScreen> createState() => _SearchDetailScreenState();
}

enum SORT_TYPE { newest, popularity }

class _SearchDetailScreenState extends State<SearchDetailScreen> {
  final _controller = TextEditingController();
  var _results = [];

  bool showSortItem = false;
  SORT_TYPE sortType = SORT_TYPE.newest;

  final nameList = [
    // dummy data
    "목도리1", "모자1", "제품3", "목도리2", "장갑1", "제품6", "모자2", "제품8", "장갑3", "제품10",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: renderAppBar(),
      body: renderResultListView(),
    );
  }

  /// rendering methods
  Widget renderResultListView() {
    _results = [];
    for (var element in nameList) {
      if (element.contains(_controller.text)) {
        _results.add(element);
      }
    }
    if (_controller.text.isNotEmpty) {
      return Column(
        children: [
          renderSortButton(),
          Stack(
            children: [
              renderProductList(),
              renderSortItem(),
            ],
          )
        ],
      );
    } else { return Container(); }
  }

  Widget renderSortButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 100,
          ),
          TextButton(
            onPressed: () { setState(() { showSortItem = !showSortItem; }); },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  getCurrentSortStr(),
                  style: const TextStyle(fontSize: 14, color: GRAY_3_COLOR, fontWeight: FontWeight.w500),
                ),
                Icon(
                  (showSortItem)
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: GRAY_3_COLOR,
                ),
              ],
            ),
          ),
          const SizedBox(width: 15,)
        ],
      ),
    );
  }

  Widget renderSortItem() {
    return (showSortItem)
    ? Positioned(
      right: 20,
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all( Radius.circular(5.0) ),
          border: Border.all(
            width: 1,
            color: PURPLE_COLOR,
          ),
        ),
        child: Column(
          children: [
            getSortButtonItem(SORT_TYPE.newest),
            getSortButtonItem(SORT_TYPE.popularity),
          ],
        ),
      ),
    )
    : const SizedBox(height: 0, width: 0,);
  }

  Widget getSortButtonItem(SORT_TYPE type) {
    const TextStyle selectStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: PURPLE_COLOR
    );

    const TextStyle unselectStyle = TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: GRAY_3_COLOR,
    );

    String title = "";
    switch (type) {
      case SORT_TYPE.newest:
        title = '최신순';
      case SORT_TYPE.popularity:
        title = '인기순';
    }

    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: const EdgeInsets.symmetric(vertical: 5),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: (){ didTapSortButton(type); },
      child: Text(title, style: (type == sortType) ? selectStyle : unselectStyle),
    );

  }

  Widget renderProductList() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: _results.length,
      itemBuilder: (BuildContext context, int index) {
        // TODO: 데이터 패치 후 카테고리 값 변경
        // return CategoryListItem(category: '관심목록', name: _results.elementAt(index),);
        return CategoryListItem(
          productId: 1, // TODO: GET 후 productId 전달
          category: '관심목록',
          data: Product(
            /// 임시 데이터
              productId: 0,
              imgUrl: 'imgKey',
              userId: 0,
              nickname: 'nickname',
              name: 'name',
              price: 0,
              isLike: false
          ),
        );
      },
    );
  }

  AppBar renderAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      leading: renderBackItem(),
      title: renderSearchField(),
      elevation: 0,
      leadingWidth: 40,
    );
  }

  Widget renderSearchField() {
    final outlineStyle = OutlineInputBorder(
        borderSide: const BorderSide(
          color: PURPLE_COLOR,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(22)
    );

    return Container(
      height: 44,
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      child: TextField(
        controller: _controller,
        onChanged: (text) {
          setState(() { _results.clear(); });
        },
        showCursor: false,
        decoration: InputDecoration(
          hintText: '검색어를 입력해주세요.',
          hintStyle: const TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 12.0,
              color: GRAY_1_COLOR
          ),
          contentPadding: const EdgeInsets.only(left: 18),
          border: outlineStyle,
          enabledBorder: outlineStyle,
          focusedBorder: outlineStyle,
          suffixIcon: _controller.text.isEmpty ?
          const Icon(Icons.search, color: PURPLE_COLOR,) :
          IconButton(
            onPressed: () {
              setState(() { _controller.clear(); });
            },
            icon: const Icon(CupertinoIcons.clear_thick_circled , color: GRAY_1_COLOR, size: 20,)
          ),
        ),
      ),
    );
  }

  Widget renderBackItem() {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: SvgPicture.asset("asset/icons/common/chevron.backward.svg", width: 10,),
        onPressed: didTapBackItem,
      ),
    );
  }

  /// event methods
  void didTapBackItem() { Navigator.of(context).pop(); }

  void didTapSortButton(SORT_TYPE type) {
    setState(() {
      sortType = type;
      showSortItem = !showSortItem;
    });
  }

  /// helper methods
  String getCurrentSortStr() {
    switch (sortType) {
      case SORT_TYPE.newest:
        return '최신순';
      case SORT_TYPE.popularity:
        return '인기순';
    }
  }
}
