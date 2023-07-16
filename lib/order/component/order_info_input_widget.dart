import 'package:flutter/material.dart';
import 'package:psr/common/layout/purple_outlined_text_field.dart';

import '../../common/const/colors.dart';

class OrderInfoInputView extends StatefulWidget {

  final String title;
  final String? option;
  final String hintText;
  final int maxLine;
  final TextEditingController controller;

  const OrderInfoInputView({
    required this.title,
    this.option,
    required this.hintText,
    required this.maxLine,
    required this.controller,
    Key? key
  }) : super(key: key);

  @override
  State<OrderInfoInputView> createState() => _OrderInfoInputViewState();
}

class _OrderInfoInputViewState extends State<OrderInfoInputView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        renderTitleText(widget.title, widget.option),
        PurpleOutlinedTextField(
            maxLine: widget.maxLine,
            hintText: widget.hintText,
            controller: widget.controller
        ),
        SizedBox(height: 15,),
      ],
    );
  }

  Widget renderTitleText(String title, String? option) {
    final titleStyle = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 15,
      color: GRAY_4_COLOR,
    );

    final optionStyle = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 15,
      color: GRAY_2_COLOR,
    );

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: RichText(
        text: TextSpan(
          text: title, style: titleStyle,
          children: [
            TextSpan(text: option, style: optionStyle,)
          ]
        ),
      ),
    );
  }

}
