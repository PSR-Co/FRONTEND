import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:psr/common/const/colors.dart';
import 'package:psr/common/layout/custom_title_text.dart';
import 'package:psr/common/layout/purple_outlined_textfield_with_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:psr/common/view/root_tab.dart';
import 'package:psr/model/data/auth/user_model.dart';
import 'package:psr/model/network/cutsom_interceptor.dart';
import 'package:psr/presenter/auth/signup_service.dart';
import 'package:psr/presenter/auth/user_service.dart';
import 'package:psr/presenter/common/ImageService.dart';

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

  bool isLoginUser = false;
  bool isFirstFetch = true;

  bool isInputValid = false;
  bool isValidNickname = false;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic> (
        future: fetchData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) { isLoginUser = true; }

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: DefaultAppBarLayout(titleText: isLoginUser ? '프로필 수정' : '회원가입',),
            body: renderBody(profile: snapshot.data),
            bottomNavigationBar: PurpleFilledButton(title: isLoginUser ? '완료' : '다음', onPressed: didTapNextButton, height: 40,),
          );
        }
    );
  }

  Widget getProgressBar() {
    return isLoginUser
        ? const SizedBox(height: 0, width: 0,)
        : const CustomProgressBar(currentPage: 4);
  }

  Widget getTitleGuide() {
   return isLoginUser
        ? const SizedBox(height: 0, width: 0,)
        : GuideTitleText(title: SIGNUP_GUIDE_TITLE.elementAt(5),);
  }

  Widget renderBody({required profile}) {
    return GestureDetector(
      onTap: () { FocusScope.of(context).unfocus(); },
      child: Stack(
        children: [
          ListView(
            children: [
              getProgressBar(),
              getTitleGuide(),
              const SizedBox(height: 30,),
              getCenterBody(profile: profile),
            ],
          ),
          (isLoading)
              ? Container(
                  child: const Center(
                    child: CircularProgressIndicator(color: PURPLE_COLOR,),
                  ),
                )
              : const SizedBox(height: 0,)
        ]
      ),
    );
  }

  Widget getCenterBody({required profile}) {
    if (isLoginUser && isFirstFetch) {
      nicknameController.text = profile!.nickname;
      isFirstFetch = false;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: PROFILE_IMG_SIZE,
                height: PROFILE_IMG_SIZE,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(44),
                ),
                child: IconButton(
                    onPressed: didTapProfileImgButton,
                    icon: (profile?.imgUrl == null)
                        ? getProfileImg()
                        : ClipRRect(
                        borderRadius: BorderRadius.circular(PROFILE_IMG_SIZE/2),
                        child: Image.network(profile!.imgUrl,
                            width: PROFILE_IMG_SIZE, height: PROFILE_IMG_SIZE,
                            fit: BoxFit.cover)
                    )
                ),
              ),
                   Positioned(
                       bottom: 3,
                       right: 5,
                       child: Container(
                           width: 25,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(30),
                             boxShadow: [
                               BoxShadow(
                                 color: Colors.grey.withOpacity(0.5),
                                 spreadRadius: -5.0,
                                 blurRadius: 20,
                               ),
                              ],
                           ),
                           child: SvgPicture.asset('asset/icons/common/circle_plus_icon.svg')
                       )
              )
            ]
          ),
          const SizedBox(height: 20,),
          const CustomTitleText(title: '닉네임', margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),),
          PurpleOutlinedTextFieldWithButton(
            maxLine: 1,
            hintText: '닉네임을 입력해주세요.',
            text: (profile?.nickname == null) ? null : profile!.nickname,
            controller: nicknameController,
            buttonTitle: '중복확인',
            onPressed: didTapValidationNickname,
          )

        ],
      ),
    );
  }

  Widget getProfileImg() {
    if (profileImgKey == null) {
      return SvgPicture.asset('asset/icons/common/pick_profile_img_icon.svg',);
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(PROFILE_IMG_SIZE/2),
        child: Image.file(
            File(profileImgKey!),
            width: PROFILE_IMG_SIZE, height: PROFILE_IMG_SIZE,
            fit: BoxFit.cover
        )
      );
    }
  }

  /// event methods
  Future<void> didTapNextButton() async {
    if (isInputValid) {
      if (!SignupService().checkNickname(nicknameController.value.text)) {
        Fluttertoast.showToast(
            msg: '변경된 닉네임의 중복확인이 필요합니다!',
            gravity: ToastGravity.CENTER
        );
        return;
      }

      if (isLoginUser) {
        setState(() { isLoading = true; });

        // TODO: upload profile image using Firebase
        if (profileImgKey != null) {
          List<String> imgKeyList = [];
          imgKeyList.add(profileImgKey!);
          await ImageService().uploadImageList(ImageType.userProfile, imgKeyList)
              .then((value) => requestEditProfile(value.first));
        } else {
          requestEditProfile(null);
        }

      } else {
        setState(() { isLoading = true; });
        Future<bool> result = SignupService().signup();
        if (await result) {
          setState(() { isLoading = false; });
          checkPermission();
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => const CompleteSignupScreen()));
        }
        else {
          Fluttertoast.showToast(msg: CustomInterceptor().errorMsg ?? '회원가입에 실패하였습니다.',);
        }
      }
    }
    else { Fluttertoast.showToast(msg: '입력된 정보를 확인해주세요!'); }
  }

  void checkPermission() async {
    await Permission.notification.request();
    final deviceToken = await FirebaseMessaging.instance.getToken();
    SignupService().setNotificationSetting(
        await Permission.notification.isGranted,
        deviceToken
    );
  }

  void didTapValidationNickname() async {
    if (validateInput(nicknameController.value.text)) {
      bool? result = await validateNickname();
      setState(() {
        if (result != null) {
          isInputValid = result;
          if (isInputValid) { SignupService().setNickname(nicknameController.value.text); }
          Fluttertoast.showToast(
            msg: result ? "사용 가능한 닉네임입니다!" : "이미 존재하는 닉네임입니다.",
            gravity: ToastGravity.CENTER
          );
        } else {
          isInputValid = false;
          Fluttertoast.showToast(msg: "1자 이상의 닉네임을 입력해주세요.");
        }
      });
    }
    else { Fluttertoast.showToast(msg: '1자 이상, 10자 이하의 한글/영문/숫자로 구성된 닉네임이어야 합니다!', ); }
  }

  void didTapProfileImgButton() async {
    var picker = ImagePicker();
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        profileImgKey = image.path;
        isInputValid = isLoginUser;
      });
    }
  }

  /// helper methods
  Future<UserProfile?> fetchData() async {
    if (await APIManager().checkToken()) {
      return UserService().getUserProfile();
    }
    else { return null; }
  }

  Future<bool?> validateNickname() async {
    return await SignupService().validateNickname(nicknameController.value.text);
  }

  bool validateInput(String value) {
    RegExp regExp = RegExp(r"^[a-zA-Z0-9ㄱ-ㅎ가-힣]*$" );
    if (value.isEmpty) { return false; }
    else if (!regExp.hasMatch(value)) { return false; }
    return true;
  }

  void onChanged() {
    if (nicknameController.value.text.length < 11) {
      if (!validateInput(nicknameController.value.text)) {
        Fluttertoast.showToast(msg: '닉네임에는 한글,영문,숫자만 포함될 수 있습니다!');
      }
    }
    else { Fluttertoast.showToast(msg: '10자 이하의 닉네임을 입력해주세요!'); }
  }

  void requestEditProfile(String? imgUrl) async {
    Future<bool> result = UserService().editProfile(nicknameController.value.text, imgUrl);

    setState(() { isLoading = false; });
    if (await result) { 
         ///프로필 변경 후 마이페이지 새로고침
         Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const RootTab(selectedRootTab: 3, selectedIndex: null)), (route) => false);

      //Navigator.of(context).pop(); 
    }
    else { Fluttertoast.showToast(msg: CustomInterceptor().errorMsg ?? '프로필 수정에 실패하였습니다.'); }
  }

}
