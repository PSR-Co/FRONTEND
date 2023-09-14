import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/const/colors.dart';

enum InputType { email, phone, text }

class AccountInputTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isNeededForHidden;
  final Color? backgroundColor;
  final Color? borderColor;
  final VoidCallback? onChange;
  final InputType? inputType;

  const AccountInputTextField({
    required this.controller,
    required this.hintText,
    required this.isNeededForHidden,
    this.backgroundColor,
    this.borderColor,
    this.onChange,
    this.inputType,
    Key? key
  }) : super(key: key);

  @override
  State<AccountInputTextField> createState() => _AccountInputTextFieldState();
}

class _AccountInputTextFieldState extends State<AccountInputTextField> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    final defaultStyle = OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: widget.borderColor ??  Colors.transparent,
        )
    );

    return Container(
      decoration: BoxDecoration(
          color: widget.backgroundColor ?? GRAY_1_COLOR.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12)
      ),
      width: MediaQuery.of(context).size.width - 40,
      height: 50,
      child: TextFormField(
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
        controller: widget.controller,
        scrollPhysics: const NeverScrollableScrollPhysics(),
        textInputAction: TextInputAction.next,
        showCursor: true,
        cursorColor: PURPLE_COLOR_50,
        maxLines: 1,
        obscureText: widget.isNeededForHidden && isVisible,
        keyboardType: getKeyboardType(widget.inputType),
        decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(
                fontSize: 14,
                color: GRAY_1_COLOR
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            enabledBorder: defaultStyle,
            border: defaultStyle,
            focusedBorder: defaultStyle,
            suffixIcon: widget.isNeededForHidden ?
            IconButton(
              icon: isVisible ? Icon(CupertinoIcons.eye_fill, color: GRAY_1_COLOR,) : Icon(CupertinoIcons.eye_slash_fill, color: GRAY_1_COLOR,) ,
              onPressed: (){
                setState(() {
                  isVisible = !isVisible;
                });
              },) : null
        ),
        onChanged: (value) {
          if (widget.onChange != null) {
            widget.onChange!();
          }
        },
      ),
    );
  }

  TextInputType getKeyboardType(InputType? inputType) {
    switch (inputType) {
      case InputType.email:
        return TextInputType.emailAddress;
      case InputType.phone:
        return TextInputType.phone;
      default:
        return TextInputType.text;
    }
  }
}
