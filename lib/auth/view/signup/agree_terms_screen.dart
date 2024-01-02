import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:psr/auth/view/signup/select_role_screen.dart';
import 'package:psr/common/const/colors.dart';
import 'package:psr/common/view/web_view_screen.dart';

import '../../../common/const/constants.dart';
import '../../../common/layout/default_appbar_layout.dart';
import '../../../common/layout/purple_filled_button.dart';
import '../sign_up_screen.dart';
import '../../component/custom_progress_bar.dart';
import '../../component/guide_title.dart';

class AgreeToTermsScreen extends StatefulWidget {
  const AgreeToTermsScreen({Key? key}) : super(key: key);

  @override
  State<AgreeToTermsScreen> createState() => _AgreeToTermsScreenState();
}

class _AgreeToTermsScreenState extends State<AgreeToTermsScreen> {

  SignUpScreenState? parentWidget;
  // bool isAgree = false;
  
  final List<List<String>> terms = [
    ['개인정보 수집 동의', 'https://broadleaf-mist-919.notion.site/2fce6ce9df73438d9573a81358b8d8fe?pvs=4', ],
    ['이용약관 동의', 'https://broadleaf-mist-919.notion.site/50dcd0ab5b644a14b51231d3cdee634b?pvs=4',]
  ];

  List<bool> isAgree = [
    false, false
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const DefaultAppBarLayout(titleText: '개인정보 수집 동의',),
      body: renderBody(),
      bottomNavigationBar: PurpleFilledButton(
        title: '다음',
        // onPressed: (isAgree) ? didTapNextButton : null,
        onPressed: didTapNextButton,
        height: 40,
      ),
    );
  }

  Widget renderBody() {
    return ListView(
      children: [
        const CustomProgressBar(currentPage: 0),
        GuideTitleText(title: SIGNUP_GUIDE_TITLE.elementAt(0),),
        getCenterBody(),
      ],
    );
  }

  Widget getCenterBody() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60.0 * terms.length,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: ListView(
        children: terms.map((e) => getTermButton(terms.indexOf(e))).toList(),
      ),
    );
  }

  // Widget getTermButton(String title, String url) {
  Widget getTermButton(int index) {
    String title = terms[index][0];
    String url = terms[index][1];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: GRAY_1_COLOR.withOpacity(0.3),
            blurRadius: 3.0,
            spreadRadius: 1.0,
          ),
        ]
      ),
      child: ElevatedButton(
          onPressed: (){ didTapTermButton(title, url); },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Colors.white),
            )
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [


                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: IconButton(
                    onPressed: (){ setState(() { isAgree[index] = !isAgree[index]; }); },
                    icon: isAgree[index]
                        ? getAgreeButton()
                        : const Icon(Icons.check_circle_sharp, color: GRAY_0_COLOR,size: 30,),
                    padding: EdgeInsets.zero,
                  ),
                ),


                Text(title, style: const TextStyle(fontSize: 16, color: GRAY_3_COLOR),),
                Expanded(child: Container()),
                Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: const Icon(Icons.arrow_forward_ios, color: GRAY_4_COLOR, size: 18,)
                )
              ],
            ),
          )
      ),
    );
  }

  Widget getAgreeButton() {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(12.5)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
      ),
      child: const Icon(Icons.check, color: PURPLE_COLOR),
    );
  }

  /// Helper Methods
  bool isAllAgree() {
    bool result = false;
    for (var element in isAgree) { result = element; }
    return result;
  }

  /// Event Methods
  void didTapTermButton(String title, String url) {
    setState(() {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => WebViewScreen(appbarTitle: title, url: url)));
    });
  }

  void didTapNextButton() {
    setState(() {
      if (isAllAgree()) {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SelectRoleScreen()));
      } else {
        Fluttertoast.showToast(msg: '필수 약관에 동의해주세요!');
      }
    });
  }
}
