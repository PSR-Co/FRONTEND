import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:psr/auth/view/signup/input_accout_info_screen.dart';
import 'package:psr/common/const/colors.dart';
import 'package:psr/common/layout/custom_title_text.dart';
import 'package:psr/common/layout/purple_outlined_text_field.dart';

import '../../../common/const/constants.dart';
import '../../../common/layout/default_appbar_layout.dart';
import '../../../common/layout/purple_filled_button.dart';
import '../../../presenter/auth/signup_service.dart';
import '../../component/guide_title.dart';

class InputBusinessInfo extends StatefulWidget {
  const InputBusinessInfo({Key? key}) : super(key: key);

  @override
  State<InputBusinessInfo> createState() => _InputBusinessInfoState();
}

class _InputBusinessInfoState extends State<InputBusinessInfo> {

  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController registeredCodeController = TextEditingController();

  String yearText = '년(4자)';
  String monthText = '월';
  String dayText = '일';
  DateTime? companyDate;

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
    return GestureDetector(
      onTap: () { FocusScope.of(context).unfocus(); },
      child: ListView(
        children: [
          GuideTitleText(title: SIGNUP_GUIDE_TITLE.elementAt(2),),
          getCenterBody(),
        ],
      ),
    );
  }

  Widget getCenterBody() {
    const warningStyle = TextStyle(fontSize: 12, color: Colors.red);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: const Text('사업자 진위 여부 파악을 위해\n사업자 등록증에 표기된 대로 입력해주세요', style: warningStyle,),
        ),

        const CustomTitleText(title: '상호명'),
        PurpleOutlinedTextField(maxLine: 1, hintText: '상호명을 입력해주세요.', controller: businessNameController),
        const SizedBox(height: 20,),

        const CustomTitleText(title: '대표자명'),
        PurpleOutlinedTextField(maxLine: 1, hintText: '대표자명을 입력해주세요.', controller: nameController),
        const SizedBox(height: 20,),

        const CustomTitleText(title: '개업일자'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getCompanyDateButton(yearText),
            getCompanyDateButton(monthText),
            getCompanyDateButton(dayText),
          ],
        ),
        const SizedBox(height: 20,),

        const CustomTitleText(title: '사업자 등록번호'),
        PurpleOutlinedTextField(maxLine: 1, hintText: '사업자 등록 번호를 입력해주세요.', controller: registeredCodeController, textInputType: TextInputType.number),
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

  Widget getCompanyDateButton(String placehold) {
    return Container(
      width: MediaQuery.of(context).size.width / 3 - 20,
      height: 42,
      margin: const EdgeInsets.only(left: 5, right: 5, top: 7),
      child: ElevatedButton(
          onPressed: didTapCompanyDateButton,
          style: ElevatedButton.styleFrom(
            alignment: Alignment.centerLeft,
            backgroundColor: Colors.white,
            side: BorderSide(width:1, color: PURPLE_COLOR.withOpacity(0.5)),
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
            ),
          ),
          child: Text(placehold,
            style: TextStyle(color: (companyDate == null) ? Colors.grey : GRAY_4_COLOR),
            textAlign: TextAlign.left,
          )
      ),
    );
  }

  /// event methods
  void didTapCompanyDateButton() async {
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime.now(),
    );
    if (selectedDate != null) {
      setState(() {
        companyDate = selectedDate;
        yearText = '${companyDate!.year.toString()}년';
        monthText = '${companyDate!.month.toString()}월';
        dayText = '${companyDate!.day.toString()}일';
      });
    }
  }

  void didTapNextButton() {
    setState(() {
      if (isValidInput) {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => const InputAccountInfoScreen()));
      } else {
        Fluttertoast.showToast(msg: '입력된 사업자 정보를 확인해주세요!');
      }
    });
  }

  void didTapValidationButton() async {
    bool? result = await validateEid();
    setState(() {
      if (result != null) {
        isValidInput = result;
        Fluttertoast.showToast(msg: result ? "인증에 성공하였습니다!" : "인증에 실패하였습니다.");
      } else {
        isValidInput = false;
        Fluttertoast.showToast(msg: "네트워크 오류가 발생하였습니다.");
      }
    });
  }

  Future<bool?> validateEid() async {
    String date = DateFormat('yyyyMMdd').format(companyDate!);
    return await SignupService().validateEid(
        registeredCodeController.value.text,
        date,
        nameController.value.text,
        businessNameController.value.text
    );
  }
}
