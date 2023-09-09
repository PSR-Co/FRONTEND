import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:psr/auth/component/custom_progress_bar.dart';
import 'package:psr/auth/view/signup/input_accout_info_screen.dart';
import 'package:psr/auth/view/signup/input_business_info_screen.dart';
import 'package:psr/presenter/auth/signup_service.dart';

import '../../../common/const/colors.dart';
import '../../../common/const/constants.dart';
import '../../../common/layout/default_appbar_layout.dart';
import '../../../common/layout/purple_filled_button.dart';
import '../../component/guide_title.dart';

class SelectRoleScreen extends StatefulWidget {

  const SelectRoleScreen({Key? key}) : super(key: key);

  @override
  State<SelectRoleScreen> createState() => _SelectRoleScreenState();
}

class _SelectRoleScreenState extends State<SelectRoleScreen> {
  final roleList = [ '일반회원', '사업자', '쇼호스트', '관리자' ];
  String? selectedRole;
  bool isBusiness = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const DefaultAppBarLayout(titleText: '회원가입',),
      body: renderBody(),
      bottomNavigationBar: PurpleFilledButton(
        title: '다음',
        // onPressed: (selectedRole != null) ? didTapNextButton : null,
        onPressed: didTapNextButton,
        height: 40,
      ),
    );
  }

  Widget renderBody() {
    return ListView(
      children: [
        const CustomProgressBar(currentPage: 1),
        GuideTitleText(title: SIGNUP_GUIDE_TITLE.elementAt(1),),
        const SizedBox(height: 30,),
        getCenterBody(),
      ],
    );
  }

  Widget getCenterBody() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 232,
      child: ListView.builder(
        itemCount: roleList.length,
        itemBuilder: (BuildContext context, int index) {
          return getRoleButton(roleList.elementAt(index), index);
        },
      ),
    );
  }

  Widget getRoleButton(String role, int index) {
    TextStyle roleStyle = TextStyle(
      color: GRAY_3_COLOR.withOpacity(0.8),
      fontSize: 15,
    );

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
      height: 44,
      child: ElevatedButton(
        onPressed: () { didTapRoleButton(index); },
        style: ElevatedButton.styleFrom(
            backgroundColor: (role == selectedRole) ? Colors.white : GRAY_0_COLOR,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: (role == selectedRole)
                  ? const BorderSide(color: PURPLE_COLOR, width: 1,)
                  : const BorderSide(color: Colors.transparent, width: 1),
            )
        ),
        child: Text(role, style: roleStyle,),
      ),
    );
  }

  /// event methods
  void didTapRoleButton(int index) {
    setState(() {
      if (selectedRole ==  roleList.elementAt(index)) { selectedRole = null; }
      else {
        selectedRole = roleList.elementAt(index);
        if (selectedRole == '사업자') { isBusiness = true; }
        else { isBusiness = false; }
      }
    });
  }

  void didTapNextButton() {
    setState(() {
      if (selectedRole != null) {
        SignupService().setRole((selectedRole! == "일반회원") ? "일반" : selectedRole!);
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) =>
            isBusiness ? const InputBusinessInfo() : const InputAccountInfoScreen())
        );
      } else {
        Fluttertoast.showToast(msg: '회원 종류를 선택해주세요!');
      }
    });
  }
}
