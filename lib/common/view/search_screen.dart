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

class _SearchDetailScreenState extends State<SearchDetailScreen> {
  final _controller = TextEditingController();
  var _results = [];

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

  Widget? renderResultListView() {
    for (var element in nameList) {
      if (element.contains(_controller.text)) {
        _results.add(element);
      }
    }
    if (_controller.text.length > 0) {
      return ListView.builder(
        itemCount: _results.length,
        itemBuilder: (BuildContext context, int index) {
          // TODO: 데이터 패치 후 카테고리 값 변경
          // return CategoryListItem(category: '관심목록', name: _results.elementAt(index),);
          return CategoryListItem(category: '관심목록', data: Product(
            /// 임시 데이터
              productId: 0,
              imgUrl: 'imgKey',
              userId: 0,
              nickname: 'nickname',
              name: 'name',
              price: 0,
              isLike: false),
          );
        },
      );
    } else { return Container(); }

  }

  /// rendering methods
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
      padding: EdgeInsets.only(top: 4, bottom: 4),
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
          contentPadding: EdgeInsets.only(left: 18),
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
      margin: EdgeInsets.only(left: 20),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: SvgPicture.asset("asset/icons/common/chevron.backward.svg", width: 10,),
        onPressed: didTapBackItem,
      ),
    );
  }

  /// event methods
  void didTapBackItem() { Navigator.of(context).pop(); }
}
