import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:psr/common/layout/custom_title_text.dart';
import 'package:psr/common/layout/purple_outlined_textfield_with_button.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class InputProfile extends StatefulWidget {
  const InputProfile({Key? key}) : super(key: key);

  @override
  State<InputProfile> createState() => _InputProfileState();
}

class _InputProfileState extends State<InputProfile> {
  static const PROFILE_IMG_SIZE = 88.0;

  final TextEditingController nicknameController = TextEditingController();
  String? profileImgKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: PROFILE_IMG_SIZE,
            height: PROFILE_IMG_SIZE,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(44),
            ),
            child: IconButton(
                onPressed: didTapProfileImgButton,
                icon: (profileImgKey == null)
                    ? SvgPicture.asset('asset/icons/common/pick_profile_img_icon.svg',)
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(PROFILE_IMG_SIZE/2),
                        child: Image.file(File(profileImgKey!),
                        width: PROFILE_IMG_SIZE, height: PROFILE_IMG_SIZE,
                        fit: BoxFit.cover),
                      )
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

  void didTapProfileImgButton() async {
    var picker = ImagePicker();
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() { profileImgKey = image.path; });
    }
  }

}
