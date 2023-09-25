import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:psr/presenter/myinfo/myinfo_service.dart';

import '../../common/const/colors.dart';
import '../../model/network/constants.dart';

class SetNotification extends StatefulWidget {
  const SetNotification({super.key});

  @override
  State<SetNotification> createState() => _SetNotificationState();
}

class _SetNotificationState extends State<SetNotification> {
  final TextStyle headerTextStyle = const TextStyle(
      fontSize: 15.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);

  bool isFirstCheck = true;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
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
    if (isFirstCheck) {
      final permission = await storage.read(key: NOTIFICATION_PERMISSION);
      if (permission == 'true') {isChecked = true; }
      else { isChecked = false; }
      isFirstCheck = false;
    }
  }

  Future<void> changeChecked() async {
    bool isGranted = await Permission.notification.request().isGranted;
    setState(() { isChecked = !isChecked; });

    if(!isGranted && isChecked) {
      // 알림 ON 요청했으나 디바이스 상 권한 요청이 거절된 경우 -> 앱 설정 열기
      openAppSettings();
    }
    final permission = await MyInfoService().editNotificationPermission();
    setState(() { isChecked = permission; });
    await storage.write(key: NOTIFICATION_PERMISSION, value: permission.toString());
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
