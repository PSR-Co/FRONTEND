import 'package:flutter/material.dart';
import 'package:psr/common/const/colors.dart';
import 'package:psr/common/layout/custom_title_text.dart';
import 'package:psr/common/layout/purple_outlined_text_field.dart';

class InputBusinessInfo extends StatefulWidget {
  const InputBusinessInfo({Key? key}) : super(key: key);

  @override
  State<InputBusinessInfo> createState() => _InputBusinessInfoState();
}

class _InputBusinessInfoState extends State<InputBusinessInfo> {

  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController registeredCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTitleText(title: '상호명'),
          PurpleOutlinedTextField(maxLine: 1, hintText: '상호명을 입력해주세요.', controller: businessNameController),
          const SizedBox(height: 20,),

          const CustomTitleText(title: '대표자명'),
          PurpleOutlinedTextField(maxLine: 1, hintText: '대표자명을 입력해주세요.', controller: nameController),
          const SizedBox(height: 20,),

          const CustomTitleText(title: '사업자 주소'),
          PurpleOutlinedTextField(maxLine: 1, hintText: '사업자 주소 입력해주세요.', controller: addressController),
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

  void didTapValidationButton() {
    print('didTapValidationButton - 사업자 정보 인증 요청 보내기');
  }
}
