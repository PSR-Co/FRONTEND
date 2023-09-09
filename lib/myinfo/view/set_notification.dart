import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../common/const/colors.dart';

class SetNotification extends StatefulWidget {
  const SetNotification({super.key});

  @override
  State<SetNotification> createState() => _SetNotificationState();
}

class _SetNotificationState extends State<SetNotification> {
  final TextStyle headerTextStyle = const TextStyle(
      fontSize: 15.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);

  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    print('build called');
    return FutureBuilder<dynamic> (
        future: configure(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return SizedBox(
            height: 50.0,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "알림받기",
                    style: headerTextStyle,
                  ),
                  CupertinoSwitch(
                      value: isChecked,
                      activeColor: PURPLE_COLOR,
                      onChanged: (value) {
                        changeChecked();
                      })
                ]),
          );
        }
    );

  }

  Future<void> configure() async {
    isChecked = await Permission.notification.isGranted;
  }

  Future<void> changeChecked() async {
    await Permission.notification.request();
    openAppSettings().then((value) =>
      setState(() async {
        isChecked = await Permission.notification.isGranted;
        // TODO: 알림 권한 설정 후 isChecked 값을 기반으로 rerendering 필요
      })
    );
  }

  void showCustomDialog(
      String title, String content, String buttonTitle, VoidCallback onPressed,
      ) {
    showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: Center(
          child: Text(title, style: const TextStyle(fontSize: 16),),
        ),
        content: Text(content, style: const TextStyle(fontSize: 14),
            textAlign: TextAlign.center),
        actions: <Widget>[
          Center(
            child: TextButton(
              onPressed: onPressed,
              child: Text(buttonTitle),
            ),
          ),
        ],
      );
    });
  }
}
