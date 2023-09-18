import 'package:flutter/material.dart';
import 'package:psr/common/view/root_tab.dart';

import '../../common/const/colors.dart';
import '../view/service_center_screen.dart';

class InquiryDialog extends StatefulWidget {
  final String result;

  const InquiryDialog({required this.result, Key? key}) : super(key: key);

  @override
  State<InquiryDialog> createState() => _InquiryDialogState();
}

class _InquiryDialogState extends State<InquiryDialog> {
  final TextStyle titleTextStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  final TextStyle answerTextStyle = const TextStyle(
      fontSize: 15.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      titlePadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      elevation: 0.0,
      content: Container(
        height: 100,
        alignment: Alignment.center,
        child: Text(widget.result, style: answerTextStyle),
      ),
      actions: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: TextButton(
              onPressed: () {
                if (widget.result == '문의가 등록되었습니다!') {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const RootTab(selectedRootTab: 3, selectedIndex: null)), (route)=>false);
                } else {
                  Navigator.pop(context);
                }
                setState(() {});
              },
              child: Text(
                "확인",
                style: titleTextStyle,
              )),
        )
      ],
    );
  }
}
