import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:psr/auth/view/signup/set_profile_screen.dart';
import 'package:psr/common/const/colors.dart';
import 'package:psr/model/network/api_manager.dart';
import 'package:psr/model/network/cutsom_interceptor.dart';
import 'package:psr/presenter/auth/signup_service.dart';
import 'package:psr/presenter/auth/user_service.dart';

import '../../../common/const/constants.dart';
import '../../../common/layout/default_appbar_layout.dart';
import '../../../common/layout/purple_filled_button.dart';
import '../../../model/data/auth/user_model.dart';
import '../../component/custom_progress_bar.dart';
import '../../component/guide_title.dart';

class SelectInterestScreen extends StatefulWidget {
  const SelectInterestScreen({Key? key}) : super(key: key);

  @override
  State<SelectInterestScreen> createState() => _SelectInterestScreenState();
}

class _SelectInterestScreenState extends State<SelectInterestScreen> {

  bool isFirstFetch = true;
  bool isLoading = false;
  bool isLoginUser = false;
  List<String> selectedList = [];
  List<String> originSelectedList = [];
  bool isItemSelected = false;
  EditInterestsResponse? interestList;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic> (
        future: fetchData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: const DefaultAppBarLayout(titleText: '관심 목록 선택',),
            body: renderBody(),
            bottomNavigationBar: PurpleFilledButton(title: isLoginUser ?'완료':'다음', onPressed: didTapNextButton, height: 40,),
          );
        }
    );
  }

  Widget renderBody() {
    return Stack(
      children: [
        ListView(
          children: [
            (isLoginUser)
                ? const SizedBox(height: 0, width: 0,)
                : const CustomProgressBar(currentPage: 4),
            GuideTitleText(title: SIGNUP_GUIDE_TITLE.elementAt(6),),
            const SizedBox(height: 50,),
            getCenterBody(),
          ],
        ),
        (isLoading)
            ? const CircularProgressIndicator(color: PURPLE_COLOR,)
            : const SizedBox(height: 0,)
      ]
    );
  }

  Widget getCenterBody() {
    double containerSize = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: containerSize,
      height: containerSize,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
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

  String getItemTitle(String title) {
    if (title.length > 6) { return title.replaceAll(' ', '\n'); }
    else { return title; }
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
            getItemTitle(title),
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
  Future<void> fetchData() async {
    if (isFirstFetch) {
      isLoginUser = await APIManager().checkToken();
      interestList = await UserService().getUserInterests();

      if (interestList != null) {
        if (interestList!.data.interestList.isNotEmpty) {
          for (var e in interestList!.data.interestList) {
            selectedList.add(getItemTitle(e.category));
          }
        }
      }
    }
    isFirstFetch = false;
  }


  /// event methods
  Future<void> didTapNextButton() async {
    for (var e in originSelectedList) { selectedList.add(e); }

    if(selectedList.isNotEmpty) {
      setState(() { isLoading = true; });
      if (await APIManager().checkToken()) {
        setState(() { isLoading = false; });
        if (await UserService().requestEditInterestList(selectedList)) {
          Navigator.of(context).pop();
        } else {
          Fluttertoast.showToast(
              msg: CustomInterceptor().errorMsg ?? "네트워크 오류가 발생하였습니다.",
              toastLength: Toast.LENGTH_LONG
          );
        }

      } else {
        setState(() { isLoading = false; });
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
