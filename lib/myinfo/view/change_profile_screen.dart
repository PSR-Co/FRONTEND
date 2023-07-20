import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';

import '../../common/const/colors.dart';

class ChangeProfileScreen extends StatefulWidget {
  const ChangeProfileScreen({super.key});

  @override
  State<ChangeProfileScreen> createState() => _ChangeProfileScreenState();
}

class _ChangeProfileScreenState extends State<ChangeProfileScreen> {
  final TextStyle nicknameTitleTextStyle = const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  final TextStyle newNicknameHintTextStyle = const TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400, color: GRAY_1_COLOR);
  final TextStyle newNicknameTextStyle = const TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400, color: GRAY_4_COLOR);
  final TextStyle checkBtnTextStyle = const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500, color: PURPLE_COLOR);
  final TextStyle errorTextStyle = const TextStyle(fontSize: 11.0, fontWeight: FontWeight.w400, color: ERROR_COLOR);
  final TextStyle completeBtnTextStyle = const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700, color: Colors.white);

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
              DefaultAppBarLayout(titleText: "프로필 수정"),
              Expanded(child: changeProfileView())
            ],
          ),
        ),
      ),
    );
  }

  Widget changeProfileView(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17.0),
      child: Column(
        children: [
          changeImage(),
          changeNickname(),
          Expanded(child: Container()),
          completeButton()
        ],
      ),
    );
  }

  Widget changeImage() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(vertical: 30.0),
      child: ClipOval(
        child: IconButton(
          onPressed: (){},
          iconSize: 92.0,
          icon: SvgPicture.asset("asset/icons/common/pick_profile_img_icon.svg"),
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
        ),
      ),
    );
  }

  Widget changeNickname() {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(bottom: 10.0),
            alignment: Alignment.centerLeft, child: Text("닉네임", style: nicknameTitleTextStyle,)),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "닉네임을 입력해주세요",
                  hintStyle: newNicknameHintTextStyle,
                  focusedBorder: TextFieldOutlineColor(),
                  enabledBorder: TextFieldOutlineColor(),
                  border: TextFieldOutlineColor(),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0)
                ),
                style: newNicknameTextStyle,
              ),
            ),
            Container(width: 10.0,),
            SizedBox(
              width: 70.0,
              height: 48.0,
              child: OutlinedButton(
                  onPressed: (){},
                  child: Text("중복확인", style: checkBtnTextStyle,),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 0.0),
                    backgroundColor: Colors.white,
                    side: BorderSide(color: PURPLE_COLOR),
                    shadowColor: LIGHT_SHADOW_COLOR,
                    foregroundColor: PURPLE_COLOR,
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),)
                  )
              ),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5.0),
          padding: EdgeInsets.only(left: 10.0),
          alignment: Alignment.centerLeft,
          child: Text("한글, 영문, 숫자만 입력해주세요. (10자)", style: errorTextStyle,)),
      ],
    );
  }

  OutlineInputBorder TextFieldOutlineColor(){
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(color: PURPLE_COLOR_50, width: 1)
    );
  }

  Widget completeButton() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        child: OutlinedButton(
          onPressed: () {  },
          child: Text("완료", style: completeBtnTextStyle,),
            style: OutlinedButton.styleFrom(
                backgroundColor: PURPLE_COLOR,
                foregroundColor: Colors.white,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    side: BorderSide(color: PURPLE_COLOR, width: 1)
                )
            )
        )
    );
  }

}
