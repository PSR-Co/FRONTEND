import 'package:flutter/material.dart';
import 'package:psr/common/const/colors.dart';

class PurpleOutlinedTextField extends StatefulWidget {
  final int maxLine;
  final int? maxLength;
  final String hintText;
  final TextEditingController controller;

  const PurpleOutlinedTextField({
    required this.maxLine,
    this.maxLength,
    required this.hintText,
    required this.controller,
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
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            width: MediaQuery.of(context).size.width - 40,
            height: (widget.maxLine == 1) ? 45.0 : 140.0,
            child: TextField(
              onChanged: (text) {
                setState(() {
                  currentTextLength = text.length;
                });
              },
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
            )
        )
    );

    if (widget.maxLength != null) {
      children.add(
          Positioned(
              bottom: 20,
              right: 35,
              child: Text('${currentTextLength}/${widget.maxLength}', style: TextStyle(
                fontSize: 12,
                color: GRAY_1_COLOR,
              ),)
          )
      );
    }

    return children;
  }

}
