import 'package:flutter/cupertino.dart';
import 'package:psr/common/const/colors.dart';

class CompleteResetPW extends StatefulWidget {
  const CompleteResetPW({Key? key}) : super(key: key);

  @override
  State<CompleteResetPW> createState() => _CompleteResetPWState();
}

class _CompleteResetPWState extends State<CompleteResetPW> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(top: 80),
      child: const Column(
        children: [
          SizedBox(
              child: Icon(CupertinoIcons.check_mark_circled_solid, color: PURPLE_COLOR, size: 40,)
          ),
          SizedBox(height: 20,),
          Text(
            '비밀번호 재설정이\n완료되었습니다.',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
