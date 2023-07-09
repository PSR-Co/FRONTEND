import 'package:flutter/material.dart';
import 'package:psr/common/const/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({this.hintText, Key? key}) : super(key: key);

  final String? hintText; // placehold 역할 텍스트

  @override
  Widget build(BuildContext context) {
    final baseBorder = OutlineInputBorder(
        borderSide: BorderSide(
          color: PURPLE_COLOR,
          width: 1.0,
        )
    );

    return TextFormField(
      cursorColor: PURPLE_COLOR,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(16),
        hintText: hintText,
        hintStyle: TextStyle(
          color: GRAY_1_COLOR,
          fontSize: 13.0,
        ),
        border: baseBorder,
        focusedBorder: baseBorder,
      ),
    );
  }
}
