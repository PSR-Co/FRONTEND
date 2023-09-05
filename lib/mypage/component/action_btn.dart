import 'package:flutter/material.dart';

import '../../common/const/colors.dart';

class ActionBtn extends StatefulWidget {
  Widget child;

  ActionBtn({required this.child, Key? key}) : super(key: key);

  @override
  State<ActionBtn> createState() => _ActionBtnState();
}

class _ActionBtnState extends State<ActionBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 17.0),
        height: 50.0,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: PURPLE_COLOR,
              width: 1.0,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(21))),
        child: widget.child);
  }
}
