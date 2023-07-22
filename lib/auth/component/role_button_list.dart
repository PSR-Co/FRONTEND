import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../common/const/colors.dart';
import '../view/sign_up_screen.dart';

class RoleButtonList extends StatefulWidget {

  const RoleButtonList({Key? key}) : super(key: key);

  @override
  State<RoleButtonList> createState() => _RoleButtonListState();
}

class _RoleButtonListState extends State<RoleButtonList> {
  final roleList = [ '일반회원', '사업자', '쇼호스트', '관리자' ];
  String? selectedRole;

  SignUpScreenState? parentWidget;

  @override
  Widget build(BuildContext context) {
    parentWidget = context.findAncestorStateOfType<SignUpScreenState>();

    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 232,
      child: ListView.builder(
        itemCount: roleList.length,
        itemBuilder: (BuildContext context, int index) {
          return getRoleButton(roleList.elementAt(index), index, parentWidget!);
        },
      ),
    );
  }

  Widget getRoleButton(String role, int index, SignUpScreenState parentWidget) {
    TextStyle roleStyle = TextStyle(
      color: GRAY_3_COLOR.withOpacity(0.8),
      fontSize: 15,
    );

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
      height: 44,
      child: ElevatedButton(
        onPressed: () { didTapRoleButton(index, parentWidget); },
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
  void didTapNextButton(){
    if (selectedRole == null) {
      Fluttertoast.showToast(msg: '회원 종류를 선택해주세요!',);
    } else {
      // TODO: 이메일, 비번 입력 화면으로 전환
      setState(() {
        // current_page_index += 1;
        parentWidget!.currentPageIndex += 1;
      });
    }
  }

  void didTapRoleButton(int index, SignUpScreenState parentWidget) {
    setState(() {

      if (selectedRole ==  roleList.elementAt(index)) {
        selectedRole = null;
        parentWidget.selectedRole = null;

      } else {
        selectedRole = roleList.elementAt(index);
        parentWidget.selectedRole = selectedRole;

        if (selectedRole == '사업자') {
          parentWidget.isBusiness = true;
        }
      }
      print('parentWidget.selectedRole --> ${parentWidget.selectedRole}');
    });
  }

  VoidCallback getNextAction() {
    return didTapNextButton;
  }
}
