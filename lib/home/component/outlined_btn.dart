import 'package:flutter/material.dart';

//OutlinedButton component
class OutlinedBtnComponent extends StatefulWidget {
  final Widget child;
  final Color borderColor;
  final double borderWidth, radius, width, height;

  const OutlinedBtnComponent(
      {required this.child,
      required this.borderColor,
      required this.borderWidth,
      required this.radius,
      required this.width,
      required this.height,
      Key? key}) : super(key: key);

  @override
  State<OutlinedBtnComponent> createState() => _OutlinedBtnComponentState();
}

class _OutlinedBtnComponentState extends State<OutlinedBtnComponent> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.white,
            side: BorderSide(color: widget.borderColor, width: widget.borderWidth),
            maximumSize: Size(widget.width, widget.height),
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(widget.radius)))
        ),
        child: widget.child,
      );
    }
}
