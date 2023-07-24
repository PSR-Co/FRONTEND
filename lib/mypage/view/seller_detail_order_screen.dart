import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psr/mypage/component/action_btn.dart';
import 'package:psr/mypage/view/detail_order_screen.dart';

import '../../common/const/colors.dart';

class SellerDetailOrderSccreen extends StatefulWidget {
  String? selectedValue;
  String orderDate;
  String productName;
  String btnOption1;
  String btnOption2;

  SellerDetailOrderSccreen({required this.selectedValue, required this.orderDate, required this.productName, required this.btnOption1, required this.btnOption2, Key? key}):super(key: key);

  @override
  State<SellerDetailOrderSccreen> createState() => _SellerDetailOrderSccreenState();
}
///TO-DO : 채팅 연결
class _SellerDetailOrderSccreenState extends State<SellerDetailOrderSccreen> {
  final TextStyle btnTypeTextStyle = const TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  bool readOnly = true;

  @override
  Widget build(BuildContext context) {
    return DetailOrderScreen(
      selectedValue: widget.selectedValue,
      orderDate: widget.orderDate,
      productName: widget.productName,
      btnOption1: widget.btnOption1,
      btnOption2: widget.btnOption2,
      child: ActionBtn(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: TextButton(onPressed: (){Navigator.pop(context, false);},
              child: Text('1:1 채팅', style: btnTypeTextStyle,)),
        ),
      ),);
  }
}
