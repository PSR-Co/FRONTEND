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
        bottom: false,
        child: Column(
          children: [
            DefaultAppBarLayout(titleText: "프로필 수정"),
            Expanded(child: changeProfileView())
          ],
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
          completeButton()
        ],
      ),
    );
  }

  Widget changeImage() {
    return IconButton(
      onPressed: (){},
      icon: SvgPicture.asset("asset/icons/common/change_profile.svg"),
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(),);
  }

  Widget changeNickname() {
    return Column(
      children: [
        Container(alignment: Alignment.centerLeft, child: Text("닉네임", style: nicknameTitleTextStyle,)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "닉네임을 입력해주세요",
                hintStyle: newNicknameHintTextStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: PURPLE_COLOR_50, width: 1)
                ),
              ),
              style: newNicknameTextStyle,
            ),
            OutlinedButton(
                onPressed: (){},
                child: Text("중복확인", style: checkBtnTextStyle,),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  // side: BorderSide(color: PURPLE_COLOR),
                  shadowColor: LIGHT_SHADOW_COLOR,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      side: BorderSide(color: PURPLE_COLOR, width: 1)
                  )
                )
            )
          ],
        ),
        Container(
          padding: EdgeInsets.only(left: 10.0),
          alignment: Alignment.centerLeft,
          child: Text("한글, 영문, 숫자만 입력해주세요. (10자)", style: errorTextStyle,)),
      ],
    );
  }

  Widget completeButton() {
    return Expanded(
        child: OutlinedButton(
          onPressed: () {  },
          child: Text("완료", style: completeBtnTextStyle,),
            style: OutlinedButton.styleFrom(
                backgroundColor: PURPLE_COLOR,
                // side: BorderSide(color: PURPLE_COLOR),
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
