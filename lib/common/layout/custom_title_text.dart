import 'package:flutter/material.dart';

import '../const/colors.dart';

class CustomTitleText extends StatefulWidget {

  final String title;
  final String? option;

  const CustomTitleText({
    required this.title,
    required this.option,
    Key? key
  }) : super(key: key);

  @override
  State<CustomTitleText> createState() => _CustomTitleTextState();
}

class _CustomTitleTextState extends State<CustomTitleText> {
  final titleStyle = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 17,
    color: GRAY_4_COLOR,
  );

  final optionStyle = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 17,
    color: GRAY_2_COLOR,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: RichText(
        text: TextSpan(
            text: widget.title, style: titleStyle,
            children: [
              TextSpan(text: widget.option, style: optionStyle,)
            ]
        ),
      ),
    );
  }
}
