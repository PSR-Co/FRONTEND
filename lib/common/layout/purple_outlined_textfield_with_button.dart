import 'package:flutter/material.dart';
import 'package:psr/common/const/colors.dart';

class PurpleOutlinedTextFieldWithButton extends StatefulWidget {
  final int maxLine;
  final int? maxLength;
  final String hintText;
  final TextEditingController controller;
  final IconButton? suffixIconButton;

  final String buttonTitle;
  final VoidCallback onPressed;

  const PurpleOutlinedTextFieldWithButton({
    required this.maxLine,
    this.maxLength,
    required this.hintText,
    required this.controller,
    this.suffixIconButton,

    required this.buttonTitle,
    required this.onPressed,

    Key? key
  }) : super(key: key);

  @override
  State<PurpleOutlinedTextFieldWithButton> createState() => _PurpleOutlinedTextFieldWithButtonState();
}

class _PurpleOutlinedTextFieldWithButtonState extends State<PurpleOutlinedTextFieldWithButton> {
  int currentTextLength = 0;

  @override
  Widget build(BuildContext context) {
    return renderRow();
  }

  Widget renderRow() {
    final defaultStyle = OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: PURPLE_COLOR.withOpacity(0.5),
          width: 1.0,
        )
    );

    return Row(
        children: [
          Container(
              margin: const EdgeInsets.only(top: 5, bottom: 5, right: 8),
              width: MediaQuery.of(context).size.width - 130,
              height: 45,
              child: TextField(
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
                onChanged: (text) {
                  setState(() {
                    currentTextLength = text.length;
                  });
                },
                controller: widget.controller,
                scrollPhysics: const NeverScrollableScrollPhysics(),
                showCursor: false,
                maxLines: widget.maxLine,
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
                  suffixIcon: widget.suffixIconButton,
                ),
              )
          ),
          Expanded(
            child: SizedBox(
              height: 45,
              child: TextButton(
                  onPressed: widget.onPressed,
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    foregroundColor: PURPLE_COLOR,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(
                          color: PURPLE_COLOR,
                        )
                    ),
                    elevation: 0.5
                  ),
                  child: Text(widget.buttonTitle)
              ),
            ),
          ),
        ],
      );

  }

}
