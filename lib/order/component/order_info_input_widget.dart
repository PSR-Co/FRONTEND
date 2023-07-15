import 'package:flutter/material.dart';

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
        renderCustomTextField(
            widget.maxLine,
            widget.hintText,
            widget.controller
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

  Widget renderCustomTextField(int maxLine, String hintText, TextEditingController controller) {
    final defaultStyle = OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(
          color: PURPLE_COLOR.withOpacity(0.5),
          width: 1.0,
        )
    );

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      width: MediaQuery.of(context).size.width - 40,
      height: (maxLine == 1) ? 45.0 : 140.0,
      child: TextField(
        controller: controller,
        scrollPhysics: NeverScrollableScrollPhysics(),
        showCursor: false,
        maxLines: (maxLine > 5) ? 5 : maxLine,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
              fontSize: 14,
              color: GRAY_1_COLOR
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          enabledBorder: defaultStyle,
          border: defaultStyle,
          focusedBorder: defaultStyle,
        ),
      ),
    );
  }
}
