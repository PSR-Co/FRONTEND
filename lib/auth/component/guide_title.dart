import 'package:flutter/material.dart';

import '../../common/const/colors.dart';

class GuideTitleText extends StatefulWidget {

  final String title;
  const GuideTitleText({
    required this.title,
    Key? key
  }) : super(key: key);

  @override
  State<GuideTitleText> createState() => _GuideTitleTextState();
}

class _GuideTitleTextState extends State<GuideTitleText> {
  @override
  Widget build(BuildContext context) {
    return getGuideTitle(widget.title);
  }

  Widget getGuideTitle(String title) {
    const titleStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: GRAY_4_COLOR,
    );
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 18),
        child: Text(title, style: titleStyle,)
    );
  }
}
