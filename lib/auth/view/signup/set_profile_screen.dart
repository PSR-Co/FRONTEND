import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:psr/auth/view/signup/select_interest_screen.dart';
import 'package:psr/common/layout/custom_title_text.dart';
import 'package:psr/common/layout/purple_outlined_textfield_with_button.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../common/const/constants.dart';
import '../../../common/layout/default_appbar_layout.dart';
import '../../../common/layout/purple_filled_button.dart';
import '../../component/custom_progress_bar.dart';
import '../../component/guide_title.dart';

class SetProfile extends StatefulWidget {
  const SetProfile({Key? key}) : super(key: key);

  @override
  State<SetProfile> createState() => _SetProfileState();
}

class _SetProfileState extends State<SetProfile> {
  static const PROFILE_IMG_SIZE = 88.0;

  final TextEditingController nicknameController = TextEditingController();
  String? profileImgKey;

  bool isInputValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const DefaultAppBarLayout(titleText: '회원가입',),
      body: renderBody(),
      bottomNavigationBar: PurpleFilledButton(
        title: '다음',
        onPressed: didTapNextButton,
        height: 40,
      ),
    );
  }

  Widget renderBody() {
    return ListView(
      children: [
        const CustomProgressBar(currentPage: 4),
        GuideTitleText(title: SIGNUP_GUIDE_TITLE.elementAt(5),),
        const SizedBox(height: 30,),
        getCenterBody(),
      ],
    );
  }

  Widget getCenterBody() {
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

  /// event methods
  void didTapNextButton() {
    if (isInputValid) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SelectInterestScreen()));
    } else {
      Fluttertoast.showToast(msg: '입력된 정보를 확인해주세요!');
    }
  }

  void didTapValidationNickname() {
    print('didTapValidationNickname - 닉네임 중복확인');
    setState(() {
      isInputValid = !isInputValid;
    });
  }

  void didTapProfileImgButton() async {
    var picker = ImagePicker();
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() { profileImgKey = image.path; });
    }
  }

}
