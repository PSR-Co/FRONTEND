import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/const/colors.dart';

class CompleteBtn extends StatefulWidget {
  String btnTitle;
  bool isVisible;
  Function()? onPressed;
  CompleteBtn({required this.btnTitle, required this.isVisible, required this.onPressed, Key? key}):super(key: key);

  @override
  State<CompleteBtn> createState() => _CompleteBtnState();
}

class _CompleteBtnState extends State<CompleteBtn> {
  final TextStyle completeBtnTextStyle = const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.isVisible,
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 40.0,
          child: OutlinedButton(
              onPressed: widget.onPressed,
              child: Text(widget.btnTitle, style: completeBtnTextStyle,),
              style: OutlinedButton.styleFrom(
                  backgroundColor: PURPLE_COLOR,
                  foregroundColor: Colors.white,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      side: BorderSide(color: PURPLE_COLOR, width: 1)
                  )
              )
          )
      ),
    );
  }
}
