import 'package:flutter/material.dart';
import 'package:psr/common/const/colors.dart';

class PurpleOutlinedTextField extends StatefulWidget {
  final int maxLine;
  final String hintText;
  final TextEditingController controller;

  const PurpleOutlinedTextField({
    required this.maxLine,
    required this.hintText,
    required this.controller,
    Key? key
  }) : super(key: key);

  @override
  State<PurpleOutlinedTextField> createState() => _PurpleOutlinedTextFieldState();
}

class _PurpleOutlinedTextFieldState extends State<PurpleOutlinedTextField> {
  @override
  Widget build(BuildContext context) {
    return renderCustomTextField();
  }

  Widget renderCustomTextField() {
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
      height: (widget.maxLine == 1) ? 45.0 : 140.0,
      child: TextField(
        controller: widget.controller,
        scrollPhysics: NeverScrollableScrollPhysics(),
        showCursor: false,
        maxLines: (widget.maxLine > 5) ? 5 : widget.maxLine,
        decoration: InputDecoration(
          hintText: widget.hintText,
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
