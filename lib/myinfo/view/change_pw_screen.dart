import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';
import 'package:psr/myinfo/component/complete_btn.dart';

import '../../common/const/colors.dart';

class ChangePWScreen extends StatefulWidget {
  const ChangePWScreen({super.key});

  @override
  State<ChangePWScreen> createState() => _ChangePWScreenState();
}

class _ChangePWScreenState extends State<ChangePWScreen> {
  final TextStyle pwTitleTextStyle = const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  final TextStyle pwHintTextStyle = const TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400, color: GRAY_1_COLOR);
  final TextStyle newPWTextStyle = const TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400, color: GRAY_4_COLOR);
  final TextStyle completeBtnTextStyle = const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700, color: Colors.white);
  final TextStyle errorTextStyle = const TextStyle(fontSize: 11.0, fontWeight: FontWeight.w400, color: ERROR_COLOR);

  bool isHided1 = false;
  bool isHided2 = false;
  bool isHided3 = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  child: DefaultAppBarLayout(titleText: "비밀번호 변경")),
              Expanded(child: changePWView())
          ],
        ),
        ),
      ),
    );
  }

  Widget changePWView(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17.0),
      child: Column(
        children: [
          currentPW(),
          newPW(),
          checkNewPW(),
          Expanded(child: Container()),
          CompleteBtn(btnTitle: '완료',)
        ],
      ),
    );
  }

  Widget currentPW() {
    return changeViewForm("현재 비밀번호",
      TextField(
        obscureText: isHided1,
        decoration: InputDecoration(
            hintText: "현재 비밀번호를 입력해주세요.",
            hintStyle: pwHintTextStyle,
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: SizedBox(
                width: 20.0, height: 20.0,
                child: IconButton(
                    icon: isHided1 ? Icon(null) : SvgPicture.asset("asset/icons/common/eyes_off.svg"),
                    isSelected: false,
                    onPressed: updateHideState1),
              ),
            ),
            focusedBorder: TextFieldOutlineColor(),
            enabledBorder: TextFieldOutlineColor(),
            border: TextFieldOutlineColor(),
            contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0)
        ),
        style: newPWTextStyle,
      ),);
  }

  Widget newPW() {
    return Column(
      children: [
        changeViewForm("새 비밀번호",
          TextField(
            obscureText: isHided2,
            decoration: InputDecoration(
                hintText: "새 비밀번호를 입력해주세요.",
                hintStyle: pwHintTextStyle,
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: SizedBox(
                    width: 20.0, height: 20.0,
                    child: IconButton(
                        icon: isHided2 ? Icon(null) : SvgPicture.asset("asset/icons/common/eyes_off.svg"),
                        isSelected: false,
                        onPressed: updateHideState2),
                  ),
                ),
                focusedBorder: TextFieldOutlineColor(),
                enabledBorder: TextFieldOutlineColor(),
                border: TextFieldOutlineColor(),
                contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0)
            ),
            style: newPWTextStyle,
          ),
        ),
        Container(
            margin: EdgeInsets.symmetric(vertical: 5.0),
            padding: EdgeInsets.only(left: 10.0),
            alignment: Alignment.centerLeft,
            child: Text("영문, 숫자, 특수문자만 입력해주세요. (8자)", style: errorTextStyle,)
        ),
      ],
    );
  }

  Widget checkNewPW() {
    return changeViewForm("비밀번호 확인",
      TextField(
        obscureText: isHided3,
        decoration: InputDecoration(
            hintText: "비밀번호를 다시 입력해주세요.",
            hintStyle: pwHintTextStyle,
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: SizedBox(
                width: 20.0, height: 20.0,
                child: IconButton(
                    icon: isHided3 ? Icon(null) : SvgPicture.asset("asset/icons/common/eyes_off.svg"),
                    isSelected: false,
                    onPressed: updateHideState3),
              ),
            ),
            focusedBorder: TextFieldOutlineColor(),
            enabledBorder: TextFieldOutlineColor(),
            border: TextFieldOutlineColor(),
            contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0)
        ),
        style: newPWTextStyle,
      ),);
  }

  Widget changeViewForm(String title, Widget textField) {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(title, style: pwTitleTextStyle),
            margin: EdgeInsets.only(bottom: 10.0),
          ),
          Container(
            child: textField,
          )
        ],
      ),
    );
  }

  void updateHideState1(){
    setState(() {isHided1 = !isHided1;});
  }
  void updateHideState2(){
    setState(() {isHided2 = !isHided2;});
  }
  void updateHideState3(){
    setState(() {isHided3 = !isHided3;});
  }

  OutlineInputBorder TextFieldOutlineColor(){
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(color: PURPLE_COLOR_50, width: 1)
    );
  }

}
