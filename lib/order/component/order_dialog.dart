import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psr/mypage/view/mypage_screen.dart';

import '../../common/const/colors.dart';

class OrderDialog extends StatefulWidget {
  final String result;
  const OrderDialog({required this.result, Key? key}): super(key: key);

  @override
  State<OrderDialog> createState() => _OrderDialogState();
}

class _OrderDialogState extends State<OrderDialog> {
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
                if ((widget.result == "요청을 수정하였습니다.")||(widget.result == "로그아웃에 성공했습니다!")) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => const MypageScreen()),
                          (route) => false);
                } else {
                  Navigator.of(context).pop();
                }
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
