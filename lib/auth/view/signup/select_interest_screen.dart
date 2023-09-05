import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:psr/auth/view/signup/set_profile_screen.dart';
import 'package:psr/common/const/colors.dart';
import 'package:psr/model/network/api_manager.dart';
import 'package:psr/presenter/auth/signup_service.dart';
import 'package:psr/presenter/auth/user_service.dart';

import '../../../common/const/constants.dart';
import '../../../common/layout/default_appbar_layout.dart';
import '../../../common/layout/purple_filled_button.dart';
import '../../component/custom_progress_bar.dart';
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
      bottomNavigationBar: getBottomButton(),
    );
  }

  Widget getBottomButton() {
    return FutureBuilder<dynamic> (
        future: isLoginUser(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return  PurpleFilledButton(title: snapshot.data ?'완료':'다음', onPressed: didTapNextButton, height: 40,);
        }
    );
  }

  Widget getProgressBar() {
    return FutureBuilder<dynamic> (
        future: isLoginUser(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return snapshot.data
            ? const SizedBox(height: 0, width: 0,)
            : const CustomProgressBar(currentPage: 4);
        }
    );
  }

  Widget renderBody() {
    return ListView(
      children: [
        getProgressBar(),
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


  /// helper methods
  Future<bool> isLoginUser() { return APIManager().checkToken(); }


  /// event methods
  Future<void> didTapNextButton() async {
    if(selectedList.isNotEmpty) {

      if (await APIManager().checkToken()) {
        if (await UserService().requestEditInterestList(selectedList)) {
          Navigator.of(context).pop();
        } else {
          Fluttertoast.showToast(msg: "네트워크 오류가 발생하였습니다.");
        }

      } else {
        SignupService().setInterestList(selectedList);
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SetProfileScreen()));
      }


    }
    else { Fluttertoast.showToast(msg: '한 개 이상의 관심 주제를 선택해주세요!'); }
  }

  void didTapCategoryItem(String selected) {
    setState(() {
      selectedList.contains(selected)
          ? selectedList.remove(selected)
          : selectedList.add(selected);
    });
  }
}
