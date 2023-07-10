import 'package:flutter/material.dart';

import '../../shopping/view/search_screen.dart';
import '../const/colors.dart';
import '../view/root_tab.dart';

/// 메인 로고와 검색창을 포함한 AppBar가 있는 화면 레이아웃 정의
class MainAppBarLayout extends StatefulWidget {
  final Widget widget;
  final BuildContext context;
  const MainAppBarLayout({required this.widget, required this.context, Key? key}) : super(key: key);

  @override
  State<MainAppBarLayout> createState() => _MainAppBarLayoutState();
}

class _MainAppBarLayoutState extends State<MainAppBarLayout> {
  Widget? appBar;
  String? inputSearchKeyword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      body: widget.widget,
    );
  }

  AppBar renderAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      leading: renderMainLogoButton(),
      title: renderSearchField(),
      elevation: 0,
      leadingWidth: 90,
    );
  }

  /// 메인 로고 아이콘 버튼 구현
  Widget renderMainLogoButton() {
    return Container(
      height: 44,
      width: 50,
      padding: EdgeInsets.only(left: 18, top: 3, bottom: 2),
      child: IconButton(
        // TODO: png -> svg로 변경 (화질 이슈)
        icon: Image.asset("asset/icons/common/main_logo.png"),
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => RootTab()),
                  (route) => false
          );
        },
      )
    );
  }

  /// 상단 검색창 구현
  Widget renderSearchField() {
    return Container(
      height: 44,
      padding: EdgeInsets.only(top: 3, bottom: 2),
      child: TextField(
        onTap: didTapSearchField(),
        cursorColor: PURPLE_COLOR,
        decoration: InputDecoration(
          hintText: '검색어를 입력해주세요.',
          hintStyle: TextStyle(
            fontWeight: FontWeight.w200,
            fontSize: 13.0,
            color: GRAY_2_COLOR
          ),
          contentPadding: EdgeInsets.only(left: 18),
          border: renderOutlineBorder(),
          enabledBorder: renderOutlineBorder(),
          focusedBorder: renderOutlineBorder(),
          suffixIcon: Icon(Icons.search, color: PURPLE_COLOR,),
        ),
      ),
    );
  }

  OutlineInputBorder renderOutlineBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(
          color: PURPLE_COLOR,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(22)
    );
  }

  /// 검색창 탭했을 경우 이벤트 정의
  VoidCallback didTapSearchField() {
    return () {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => SearchScreen()));
    };
  }

}
