import 'package:flutter/material.dart';

import '../const/colors.dart';

class PurpleBottomButton extends StatefulWidget {
  final String title;
  final VoidCallback onPressed;

  const PurpleBottomButton({
    required this.title,
    required this.onPressed,
    Key? key
  }) : super(key: key);

  @override
  State<PurpleBottomButton> createState() => _PurpleBottomButtonState();
}

class _PurpleBottomButtonState extends State<PurpleBottomButton> {
  @override
  Widget build(BuildContext context) {
    return renderButton();
  }

  Widget renderButton() {
    final titleStyle = TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: Colors.white
    );

    return Container(
      margin: EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 30),
      height: 40.0,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        child: Text(widget.title, style: titleStyle,),
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: PURPLE_COLOR,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            )
        ),
      ),
    );
  }
}
