import 'package:flutter/material.dart';

import '../../common/const/colors.dart';

class CommonDialog extends StatefulWidget {
  final Widget askTitle;
  final String alert;
  final Widget onDidTap;

  const CommonDialog(
      {required this.askTitle,
      required this.alert,
      required this.onDidTap,
      Key? key})
      : super(key: key);

  @override
  State<CommonDialog> createState() => _CommonDialogState();
}

class _CommonDialogState extends State<CommonDialog> {
  final TextStyle answerLogoutTextStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w400, color: GRAY_3_COLOR);
  final TextStyle answerTextStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w700, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.only(bottom: 0.0),
      titlePadding: const EdgeInsets.only(top: 20.0),
      buttonPadding: const EdgeInsets.symmetric(horizontal: 17.0),
      title: Center(
        child: widget.askTitle,
      ),
      actions: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 30.0),
                  child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop<bool>(true);
                      },
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: GRAY_1_COLOR,
                          elevation: 0.0,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(21.0)),
                              side: BorderSide(color: GRAY_1_COLOR, width: 1))),
                      child: Container(
                          height: 45.0,
                          alignment: Alignment.center,
                          child: Text(
                            '취소',
                            style: answerLogoutTextStyle,
                          ))),
                ),
              ),
              Container(
                width: 20.0,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 30.0),
                  child: OutlinedButton(
                      onPressed: () {
                        showDialog(
                            barrierDismissible: true,
                            context: context,
                            builder: (_) {
                              return widget.onDidTap;
                            });
                      },
                      style: OutlinedButton.styleFrom(
                          backgroundColor: PURPLE_COLOR,
                          foregroundColor: Colors.white,
                          elevation: 0.0,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(21.0)),
                              side: BorderSide(color: GRAY_1_COLOR, width: 1))),
                      child: Container(
                          height: 45.0,
                          alignment: Alignment.center,
                          child: Text(
                            widget.alert,
                            style: answerTextStyle,
                          ))),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
