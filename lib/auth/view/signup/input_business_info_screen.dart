import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:psr/auth/view/signup/input_accout_info_screen.dart';
import 'package:psr/common/const/colors.dart';
import 'package:psr/common/layout/custom_title_text.dart';
import 'package:psr/common/layout/purple_outlined_text_field.dart';

import '../../../common/const/constants.dart';
import '../../../common/layout/default_appbar_layout.dart';
import '../../../common/layout/purple_filled_button.dart';
import '../../component/guide_title.dart';

class InputBusinessInfo extends StatefulWidget {
  const InputBusinessInfo({Key? key}) : super(key: key);

  @override
  State<InputBusinessInfo> createState() => _InputBusinessInfoState();
}

class _InputBusinessInfoState extends State<InputBusinessInfo> {

  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  final TextEditingController yearController = TextEditingController();
  final TextEditingController monthController = TextEditingController();
  final TextEditingController dayController = TextEditingController();
  // final TextEditingController addressController = TextEditingController();

  final TextEditingController registeredCodeController = TextEditingController();

  bool isValidInput = false;

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
        GuideTitleText(title: SIGNUP_GUIDE_TITLE.elementAt(2),),
        getCenterBody(),
      ],
    );
  }

  Widget getCenterBody() {
    final warningStyle = TextStyle(fontSize: 12, color: Colors.red);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Text('사업자 진위 여부 파악을 위해\n사업자 등록증에 표기된 대로 입력해주세요', style: warningStyle,),
        ),

        const CustomTitleText(title: '상호명'),
        PurpleOutlinedTextField(maxLine: 1, hintText: '상호명을 입력해주세요.', controller: businessNameController),
        const SizedBox(height: 20,),

        const CustomTitleText(title: '대표자명'),
        PurpleOutlinedTextField(maxLine: 1, hintText: '대표자명을 입력해주세요.', controller: nameController),
        const SizedBox(height: 20,),

        // TODO: DatePicker로 변경
        const CustomTitleText(title: '개업일자'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PurpleOutlinedTextField(maxLine: 1, hintText: '년(4자)', controller: yearController,
              width: (MediaQuery.of(context).size.width - 50.0)/3, margin: 5,
            ),
            PurpleOutlinedTextField(maxLine: 1, hintText: '월', controller: monthController,
              width: (MediaQuery.of(context).size.width - 50.0)/3, margin: 5,
            ),
            PurpleOutlinedTextField(maxLine: 1, hintText: '일', controller: dayController,
              width: (MediaQuery.of(context).size.width - 50.0)/3, margin: 5,
            ),
          ],
        ),
        const SizedBox(height: 20,),

        const CustomTitleText(title: '사업자 등록번호'),
        PurpleOutlinedTextField(maxLine: 1, hintText: '사업자 등록 번호를 입력해주세요.', controller: registeredCodeController),
        const SizedBox(height: 20,),

        getValidationButton(),
        const SizedBox(height: 50,)
      ],
    );
  }

  Widget getValidationButton() {
    const TextStyle titleStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: PURPLE_COLOR);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
      height: 40,
      width: MediaQuery.of(context).size.width - 36,
      child: ElevatedButton(
        onPressed: didTapValidationButton,
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: PURPLE_COLOR,
                  width: 1.2,
                ),
                borderRadius: BorderRadius.circular(20)
            )
        ),
        child: const Text('인증하기', style: titleStyle,),
      ),
    );
  }

  /// event methods
  void didTapNextButton() {
    setState(() {
      if (isValidInput) {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => const InputAccountInfoScreen()));
      } else {
        Fluttertoast.showToast(msg: '입력된 사업자 정보를 확인해주세요!');
      }
    });
  }

  void didTapValidationButton() {
    setState(() {
      // TODO: 인증 성공하면 canPushNextView 값을 true로 변경하기
      isValidInput = !isValidInput;
    });
  }
}
