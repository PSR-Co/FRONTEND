import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:psr/common/layout/custom_title_text.dart';
import 'package:psr/common/layout/purple_outlined_textfield_with_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:psr/presenter/auth/signup_service.dart';
import 'dart:io';

import '../../../common/const/constants.dart';
import '../../../common/layout/default_appbar_layout.dart';
import '../../../common/layout/purple_filled_button.dart';
import '../../../model/network/api_manager.dart';
import '../../component/custom_progress_bar.dart';
import '../../component/guide_title.dart';
import 'complete_signup_screen.dart';

class SetProfileScreen extends StatefulWidget {
  const SetProfileScreen({Key? key}) : super(key: key);

  @override
  State<SetProfileScreen> createState() => _SetProfileScreenState();
}

class _SetProfileScreenState extends State<SetProfileScreen> {
  static const PROFILE_IMG_SIZE = 88.0;

  final TextEditingController nicknameController = TextEditingController();
  String? profileImgKey;

  bool isInputValid = false;
  bool isValidNickname = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const DefaultAppBarLayout(titleText: '회원가입',),
      body: renderBody(),
      bottomNavigationBar: getBottomButton(),
    );
  }

  Widget getBottomButton() {
    return FutureBuilder<dynamic> (
        future: isLoginUser(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return  PurpleFilledButton(title: snapshot.data ?'완료':'다음', onPressed: didTapNextButton, height: 40,);
        }
    );
  }

  Widget getProgressBar() {
    return FutureBuilder<dynamic> (
        future: isLoginUser(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return snapshot.data
              ? const SizedBox(height: 0, width: 0,)
              : const CustomProgressBar(currentPage: 4);
        }
    );
  }

  Widget getTitleGuide() {
    return FutureBuilder<dynamic> (
        future: isLoginUser(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return snapshot.data
              ? const SizedBox(height: 0, width: 0,)
              : GuideTitleText(title: SIGNUP_GUIDE_TITLE.elementAt(5),);
        }
    );
  }

  Widget renderBody() {
    return ListView(
      children: [
        getProgressBar(),
        // GuideTitleText(title: SIGNUP_GUIDE_TITLE.elementAt(5),),
        getTitleGuide(),
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

  /// helper methods
  Future<bool> isLoginUser() { return APIManager().checkToken(); }

  /// event methods
  Future<void> didTapNextButton() async {
    if (isInputValid) {
      Future<bool> result = SignupService().signup();
      if (await result) {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => const CompleteSignupScreen()));
      } else {
        Fluttertoast.showToast(msg: '회원가입에 실패하였습니다.');
      }

    } else {
      Fluttertoast.showToast(msg: '입력된 정보를 확인해주세요!');
    }
  }

  void didTapValidationNickname() async {
    bool? result = await validateNickname();
    setState(()  {
      if (result != null) {
        isInputValid = result;
        if (isInputValid) { SignupService().setNickname(nicknameController.value.text); }
        Fluttertoast.showToast(msg: result ? "사용 가능한 닉네임입니다!" : "이미 존재하는 닉네임입니다.");
      } else {
        isInputValid = false;
        Fluttertoast.showToast(msg: "1자 이상의 닉네임을 입력해주세요.");
      }
    });
  }

  void didTapProfileImgButton() async {
    var picker = ImagePicker();
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        profileImgKey = image.path;
        SignupService().setProfileImage(profileImgKey);
      });
    }
  }

  Future<bool?> validateNickname() async {
    return await SignupService().validateNickname(nicknameController.value.text);
  }
}
