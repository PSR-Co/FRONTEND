import 'package:flutter/cupertino.dart';

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

  void changeChecked() {
    setState(() {
      isChecked = !isChecked;
    });
  }

}
