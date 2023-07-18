import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:psr/common/layout/custom_title_text.dart';
import 'package:psr/common/layout/purple_outlined_textfield_with_button.dart';

class InputProfile extends StatefulWidget {
  const InputProfile({Key? key}) : super(key: key);

  @override
  State<InputProfile> createState() => _InputProfileState();
}

class _InputProfileState extends State<InputProfile> {
  final TextEditingController nicknameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 88,
            height: 88,
            child: IconButton(
                onPressed: (){},
                icon: SvgPicture.asset('asset/icons/common/pick_profile_img_icon.svg',)
            ),
          ),
          const SizedBox(height: 20,),
          const CustomTitleText(title: '닉네임', margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),),
          PurpleOutlinedTextFieldWithButton(
              maxLine: 1,
              hintText: '닉네임을 입력해주세요.',
              controller: nicknameController,
              buttonTitle: '중복확인',
              onPressed: didTapValidationNickname
          )
        ],
      ),
    );
  }

  void didTapValidationNickname() {
    print('didTapValidationNickname - 닉네임 중복확인');
  }

}
