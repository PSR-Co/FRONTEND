import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:psr/model/network/cutsom_interceptor.dart';
import 'package:psr/presenter/auth/login_service.dart';

import '../../common/layout/default_appbar_layout.dart';
import '../../common/layout/purple_filled_button.dart';
import '../../model/data/auth/login_model.dart';
import '../component/input_user_info.dart';
import 'show_user_id_screen.dart';

class FindIDScreen extends StatefulWidget {
  const FindIDScreen({Key? key}) : super(key: key);

  @override
  State<FindIDScreen> createState() => _FindIDScreenState();
}

class _FindIDScreenState extends State<FindIDScreen> {
  bool isFounded = false;
  bool isAllInput = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumController = TextEditingController();
  final TextEditingController validCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const DefaultAppBarLayout(titleText: '아이디 찾기',),
      body: renderBody(),
      bottomNavigationBar: PurpleFilledButton(
        title: '다음',
        onPressed: didTapNextButton,
        height: 40,
      ),
    );
  }

  Widget renderBody() {
    return GestureDetector(
      onTap: () { FocusScope.of(context).unfocus(); },
      child: ListView(
        children: [
          const SizedBox(height: 50,),
          InputUserInfo(
            nameController: nameController,
            phoneNumController: phoneNumController,
            validCodeController: validCodeController,
          ),
        ],
      ),
    );
  }


  /// event methods
  Future<void> didTapNextButton() async {
    if (!getIsAllInput()) {
      Fluttertoast.showToast(msg: '모든 정보를 입력해주세요!');
      return;
    }
    SearchEmailResponse? result = await LoginService().searchEmail(
        nameController.value.text,
        validCodeController.value.text,
        phoneNumController.value.text
    );
    if (result != null) {
      if (result.code == 200){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) =>
            ShowUserIDScreen(
                name: nameController.value.text,
                email: result.data.email
            )), (route) => false
        );
      } else {
        Fluttertoast.showToast(msg: result.message);
      }
    } else {
      Fluttertoast.showToast(
          msg: CustomInterceptor().errorMsg ?? "네트워크 오류가 발생하였습니다.",
          gravity: ToastGravity.CENTER
      );
    }
  }

  /// helper methods
  bool getIsAllInput() {
    return isAllInput = (nameController.value.text.isNotEmpty
          && phoneNumController.value.text.isNotEmpty
          && validCodeController.value.text.isNotEmpty);
  }

}
