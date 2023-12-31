import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';
import 'package:psr/myinfo/component/complete_btn.dart';
import 'package:psr/presenter/inquiry/inquiry_service.dart';

import '../../common/const/colors.dart';
import '../component/inquiry_dialog.dart';

class InquiryScreen extends StatefulWidget {
  const InquiryScreen({super.key});

  @override
  State<InquiryScreen> createState() => _InquiryScreenState();
}

class _InquiryScreenState extends State<InquiryScreen> {
  final TextStyle hintContentTextStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w400, color: GRAY_1_COLOR);
  final TextStyle contentTextStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w400, color: GRAY_4_COLOR);

  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  bool isSuccess = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const DefaultAppBarLayout(titleText: "문의하기"),
      body: SafeArea(
        child: registerInquiryView(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(17.0, 0, 17.0, 20),
        child: CompleteBtn(
          btnTitle: '등록하기',
          isVisible: true,
          onPressed: () {
            addInquiry().then((value) => setState(() {}));
          },
        ),
      ),
    );
  }

  Widget registerInquiryView() {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(left: 17.0, right: 17.0, top: 40.0),
        child: Column(
          children: [
            inputBox('제목을 입력하세요.', 70.0, titleController),
            inputBox('내용을 입력하세요.', 370.0, contentController),
          ],
        ),
      ),
    );
  }

  Widget inputBox(
      String hintTitle, double height, TextEditingController controller) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        expands: true,
        maxLines: null,
        minLines: null,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: hintTitle,
          hintStyle: hintContentTextStyle,
          border: customBorder(),
          focusedBorder: customBorder(),
          enabledBorder: customBorder(),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        ),
        style: contentTextStyle,
        textAlignVertical: TextAlignVertical.top,
        controller: controller,
      ),
    );
  }

  OutlineInputBorder customBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: GRAY_0_COLOR, width: 1),
    );
  }

  Future<void> addInquiry() async {
    String title = titleController.text;
    String content = contentController.text;
    dynamic data = await InquiryService().addInquiry(title, content);

    if (data != null) {
      if (data.code == 200) {
        if (kDebugMode) {
          print('요청에 성공했습니다.');
          changeState();
          isSuccess
              ? inquiryDialog('문의가 등록되었습니다!')
              : inquiryDialog('문의 등록에 실패하셨습니다.');
        }
      } else {
        if (kDebugMode) {
          print('요청에 실패했습니다.');
        }
      }
    } else {
      if (kDebugMode) {
        print('네트워크 오류가 발생하였습니다.');
      }
    }
  }

  void changeState() {
    setState(() {
      isSuccess = !isSuccess;
      // print('success : $isSuccess');
    });
  }

  void inquiryDialog(String result) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (_) {
          return InquiryDialog(result: result);
        });
  }
}
