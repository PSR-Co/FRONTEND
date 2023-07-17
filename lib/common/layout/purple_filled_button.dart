import 'package:flutter/material.dart';

import '../const/colors.dart';

class PurpleFilledButton extends StatefulWidget {
  final String title;
  final VoidCallback onPressed;
  final bool? isBottomButton;
  final double? width;
  final double? height;
  final double? borderRadius;

  const PurpleFilledButton({
    required this.title,
    required this.onPressed,
    this.isBottomButton,
    this.width,
    this.height,
    this.borderRadius,
    Key? key
  }) : super(key: key);

  @override
  State<PurpleFilledButton> createState() => _PurpleFilledButtonState();
}

class _PurpleFilledButtonState extends State<PurpleFilledButton> {

  bool isBottomButton = true;

  @override
  void initState() {
    super.initState();
    isBottomButton = widget.isBottomButton ?? true;
  }

  @override
  Widget build(BuildContext context) {
    return renderButton();
  }

  Widget renderButton() {
    const titleStyle = TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: Colors.white
    );

    return Container(
      margin: isBottomButton ? const EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 30) : EdgeInsets.zero,
      width: widget.width,
      height: widget.height,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: PURPLE_COLOR,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 20),
            )
        ),
        child: Text(widget.title,style: titleStyle,),
      ),
    );
  }
}
