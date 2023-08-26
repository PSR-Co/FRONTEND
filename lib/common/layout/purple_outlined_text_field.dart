import 'package:flutter/material.dart';
import 'package:psr/common/const/colors.dart';

class PurpleOutlinedTextField extends StatefulWidget {
  final int maxLine;
  final int? maxLength;
  final String hintText;
  final TextEditingController controller;
  final IconButton? suffixIconButton;
  final double? width;
  final double? margin;
  final VoidCallback? onChanged;
  final bool? isEditing;

  const PurpleOutlinedTextField({
    required this.maxLine,
    this.maxLength,
    required this.hintText,
    required this.controller,
    this.suffixIconButton,
    this.width,
    this.margin,
    this.onChanged,
    this.isEditing,
    Key? key
  }) : super(key: key);

  @override
  State<PurpleOutlinedTextField> createState() => _PurpleOutlinedTextFieldState();
}

class _PurpleOutlinedTextFieldState extends State<PurpleOutlinedTextField> {
  int currentTextLength = 0;

  @override
  Widget build(BuildContext context) {
    return renderCustomTextField();
  }

  Widget renderCustomTextField() {
    return Stack(children: renderTextFieldStack(),);
  }

  List<Widget> renderTextFieldStack() {
    currentTextLength = widget.controller.value.text.length;

    final defaultStyle = OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(
          color: PURPLE_COLOR.withOpacity(0.5),
          width: 1.0,
        )
    );

    List<Widget> children = [];
    children.add(
        Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: widget.margin ?? 20),
            width: widget.width ?? MediaQuery.of(context).size.width,
            height: (widget.maxLine == 1) ? 45.0 : 140.0,
            child: TextField(
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
              onChanged: (text) {
                setState(() {
                  if (widget.onChanged != null) { widget.onChanged!(); }
                  currentTextLength = text.length;
                });
              },
              enabled: widget.isEditing,
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
        )
    );

    if (widget.maxLength != null) {
      children.add(
          Positioned(
              bottom: 20,
              right: 35,
              child: Text(
                '$currentTextLength/${widget.maxLength}',
                style: const TextStyle(
                  fontSize: 12,
                  color: GRAY_1_COLOR,
                ),
              )
          )
      );
    }
    return children;
  }

}
