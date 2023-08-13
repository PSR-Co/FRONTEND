import 'package:flutter/material.dart';

import '../../common/const/colors.dart';
import '../view/detail_order_screen.dart';
import 'action_btn.dart';

class MoveToDetailOrderScreen extends StatefulWidget {
  String type;
  int orderId;

  MoveToDetailOrderScreen({required this.type, required this.orderId, Key? key})
      : super(key: key);

  @override
  State<MoveToDetailOrderScreen> createState() =>
      _MoveToDetailOrderScreenState();
}

class _MoveToDetailOrderScreenState extends State<MoveToDetailOrderScreen> {
  final TextStyle btnTypeTextStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);

  @override
  Widget build(BuildContext context) {
    return moveToDetailScreenLogic(widget.type, widget.orderId);
  }

  Widget moveToDetailScreenLogic(String type, int orderId) {
    if (type == 'sell') {
      return DetailOrderScreen(
          orderId: orderId,
          type: type,
          btnOption1: '요청승인',
          btnOption2: '요청거절',
          child: renderBtn('1:1 채팅'));
    } else {
      return DetailOrderScreen(
          orderId: orderId,
          type: type,
          btnOption1: '요청수정',
          btnOption2: '요청취소',
          child: renderBtn('수정하기'));
    }
  }

  ActionBtn renderBtn(String btnText) {
    return ActionBtn(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: Text(
              btnText,
              style: btnTypeTextStyle,
            )),
      ),
    );
  }
}
