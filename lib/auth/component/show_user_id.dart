import 'package:flutter/material.dart';
import 'package:psr/common/const/colors.dart';
import 'package:psr/common/layout/custom_title_text.dart';

class ShowUserID extends StatefulWidget {
  const ShowUserID({Key? key}) : super(key: key);

  @override
  State<ShowUserID> createState() => _ShowUserIDState();
}

class _ShowUserIDState extends State<ShowUserID> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 100,),
        const CustomTitleText(title: 'OOO님의 아이디입니다.'),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          padding: const EdgeInsets.symmetric(vertical: 50),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: PURPLE_COLOR,
              width: 1.0,
            )
          ),
          child: const Center(
            child: Column(
              children: [
                Text('아이디:', style: TextStyle(fontSize: 16),),
                Text('psr1234', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
              ],
            )
          ),
        ),
      ],
    );
  }
}
