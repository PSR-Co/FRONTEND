import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:psr/common/const/colors.dart';
import 'package:psr/common/view/root_tab.dart';

import '../../../common/const/constants.dart';
import '../../../common/layout/default_appbar_layout.dart';
import '../../../common/layout/purple_filled_button.dart';
import '../../component/guide_title.dart';

class SelectInterestScreen extends StatefulWidget {
  const SelectInterestScreen({Key? key}) : super(key: key);

  @override
  State<SelectInterestScreen> createState() => _SelectInterestScreenState();
}

class _SelectInterestScreenState extends State<SelectInterestScreen> {

  List<String> selectedList = [];

  bool isItemSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const DefaultAppBarLayout(titleText: '관심 목록 선택',),
      body: renderBody(),
      bottomNavigationBar: PurpleFilledButton(
        title: '완료',
        onPressed: didTapNextButton,
        height: 40,
      ),
    );
  }

  Widget renderBody() {
    return ListView(
      children: [
        GuideTitleText(title: SIGNUP_GUIDE_TITLE.elementAt(6),),
        const SizedBox(height: 50,),
        getCenterBody(),
      ],
    );
  }

  Widget getCenterBody() {
    double containerSize = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: containerSize,
      height: containerSize,
      child: GridView.builder(
        itemCount: CATEGORY_LIST_FOR_SIGNUP.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1/1,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),

        itemBuilder: (BuildContext context, int index) {
          return getCategoryItem(CATEGORY_LIST_FOR_SIGNUP.elementAt(index));
        },

      ),
    );
  }


    Widget getCategoryItem(String title) {
    double itemSize = (MediaQuery.of(context).size.width - 30) / 3;

    return Container(
      margin: const EdgeInsets.all(5),
      color: Colors.transparent,
      width: itemSize,
      height: itemSize,
      child: ElevatedButton(
        onPressed: () { didTapCategoryItem(title); },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(
                width: 1,
                color: selectedList.contains(title)
                    ? PURPLE_COLOR : Colors.transparent,
              )
          ),
          backgroundColor: selectedList.contains(title)
              ? Colors.white : GRAY_0_COLOR,
        ),
        child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: selectedList.contains(title)
                    ? PURPLE_COLOR : GRAY_2_COLOR,
              ),
              textAlign: TextAlign.center,
            )
        ),
      ),
    );
  }


  /// event methods
  void didTapNextButton() {
    if(selectedList.isNotEmpty) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const RootTab()));
    } else {
      Fluttertoast.showToast(msg: '한 개 이상의 관심 주제를 선택해주세요!');
    }
  }

  void didTapCategoryItem(String selected) {
    setState(() {
      selectedList.contains(selected)
          ? selectedList.remove(selected)
          : selectedList.add(selected);

    });
  }
}
