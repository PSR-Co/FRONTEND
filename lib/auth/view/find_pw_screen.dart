import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:psr/auth/component/input_user_info.dart';
import 'package:psr/model/data/general_model.dart';
import 'package:psr/model/network/cutsom_interceptor.dart';
import 'package:psr/presenter/auth/login_service.dart';

import '../../common/layout/default_appbar_layout.dart';
import '../../common/layout/purple_filled_button.dart';
import '../component/complete_widget.dart';
import '../component/reset_password.dart';
import 'login_screen.dart';

class FindPWScreen extends StatefulWidget {
  const FindPWScreen({Key? key}) : super(key: key);

  @override
  State<FindPWScreen> createState() => _FindPWScreenState();
}

class _FindPWScreenState extends State<FindPWScreen> {
  bool isInfoInputted = false;
  bool isReset = false;
  bool isAllInput = false;

  final TextEditingController idController = TextEditingController();
  final TextEditingController phoneNumController = TextEditingController();
  final TextEditingController codeController = TextEditingController();

  final TextEditingController pwController = TextEditingController();
  final TextEditingController pwValidController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    isAllInput = false;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBarLayout(titleText: '비밀번호 재설정', isBackItemHidden: isReset,),
      body: renderBody(),
      bottomNavigationBar: PurpleFilledButton(
        title: (isReset) ? '로그인' : '다음',
        onPressed: didTapNextButton,
        height: 40,
      ),
    );
  }

  Widget renderBody() {
    if (isInfoInputted && isReset) {
      return const CompleteWidget(mainText: '비밀번호 재설정이\n완료되었습니다.',);
    } else if (isInfoInputted && !isReset) {
      return ResetPassword(
        pwController: pwController,
        pwValidController: pwValidController,
      );
    } else {
      return GestureDetector(
        onTap: () { FocusScope.of(context).unfocus(); },
        child: ListView(
          children: [
            const SizedBox(height: 50,),
            InputUserInfo(
              isTopName: false,
              nameController: idController,
              phoneNumController: phoneNumController,
              validCodeController: codeController,
            )
          ],
        ),
      );
    }
  }

  /// event methods
  Future<void> didTapNextButton() async {
    if (!getIsAllInput()) {
      Fluttertoast.showToast(msg: '모든 정보를 입력해주세요!');
      return;
    }
    if (isInfoInputted && isReset) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (_) => const LoginScreen()
          ), (route) => false
      );

    } else if (isInfoInputted && !isReset) {
      GeneralModel? result = await LoginService().resetPW(
        idController.value.text,
        pwController.value.text,
        phoneNumController.value.text,
      );

      if (result != null) {
        setState(() { isReset = (result.code == 200); });
        if (result.code != 200) {
          Fluttertoast.showToast(msg: "입력정보를 확인해주세요.");
        }
      } else {
        Fluttertoast.showToast(msg: "네트워크 오류가 발생하였습니다.");
      }

    } else {
      GeneralModel? result = await LoginService().validateForResetPW(
          idController.value.text,
          phoneNumController.value.text,
          codeController.value.text
      );

      if (result != null) {
        setState(() { isInfoInputted = (result.code == 200); });
        if (result.code != 200) {
          Fluttertoast.showToast(msg: "입력정보를 확인해주세요.");
        }
      } else {
        Fluttertoast.showToast(msg: CustomInterceptor().errorMsg ?? "네트워크 오류가 발생하였습니다.");
      }
    }

  }

  /// helper methods
  bool getIsAllInput() {
    if (!isInfoInputted && !isReset) {
      return isAllInput = (idController.value.text.isNotEmpty
          && phoneNumController.value.text.isNotEmpty
          && codeController.value.text.isNotEmpty);
    } else {
      return isAllInput = (pwController.value.text.isNotEmpty
          && pwValidController.value.text.isNotEmpty);
    }

  }
}
