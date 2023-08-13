import 'package:flutter/material.dart';

import '../../common/const/colors.dart';

class DetailOrderTextFieldForm extends StatefulWidget {
  final String title;
  final String? option;
  final int maxLine;
  final int? maxLength;
  final String hintText;
  final TextEditingController controller;
  bool readOnly;

  DetailOrderTextFieldForm(
      {required this.title,
      this.option,
      required this.maxLine,
      this.maxLength,
      required this.hintText,
      required this.controller,
      required this.readOnly,
      Key? key})
      : super(key: key);

  @override
  State<DetailOrderTextFieldForm> createState() =>
      _DetailOrderTextFieldFormState();
}

class _DetailOrderTextFieldFormState extends State<DetailOrderTextFieldForm> {
  int currentTextLength = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleTextField(widget.title, widget.option),
        purpleOutlinedField(widget.maxLine, widget.hintText, widget.controller),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }

  Widget titleTextField(String title, String? option) {
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
        text: TextSpan(text: title, style: titleStyle, children: [
          TextSpan(
            text: option,
            style: optionStyle,
          )
        ]),
      ),
    );
  }

  Widget purpleOutlinedField(
      int maxLine, String hintText, TextEditingController controller) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 17.0),
        child: TextField(
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
          onChanged: (text) {
            setState(() {
              currentTextLength = text.length;
            });
            updateText(widget.title, widget.controller.text);
          },
          controller: widget.controller,
          maxLines: widget.maxLine,
          maxLength: widget.maxLength,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(fontSize: 14, color: GRAY_1_COLOR),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: PURPLE_COLOR_50, width: 1.0),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                )),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: PURPLE_COLOR_50, width: 1.0),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                )),
          ),
          readOnly: widget.readOnly,
        ));
  }

  Map<String, dynamic> updateText(String title, String? newText){
    Map<String, dynamic> updateOrder = {};
    switch(title){
      case '이름': updateOrder.addAll({'ordererName': newText}); break;
      case '이름': updateOrder.addAll({'websiteUrl': newText}); break;
      case '이름': updateOrder.addAll({'inquiry': newText}); break;
      case '이름': updateOrder.addAll({'description': newText}); break;
    }
    return updateOrder;
  }
}
