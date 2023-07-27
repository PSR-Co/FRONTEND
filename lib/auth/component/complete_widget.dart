import 'package:flutter/cupertino.dart';
import 'package:psr/common/const/colors.dart';

class CompleteWidget extends StatefulWidget {
  final String mainText;

  const CompleteWidget({
    required this.mainText,
    Key? key
  }) : super(key: key);

  @override
  State<CompleteWidget> createState() => _CompleteWidgetState();
}

class _CompleteWidgetState extends State<CompleteWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(top: 80),
      child: Column(
        children: [
          const SizedBox(
              child: Icon(CupertinoIcons.check_mark_circled_solid, color: PURPLE_COLOR, size: 40,)
          ),
          const SizedBox(height: 20,),
          Text(
            // '비밀번호 재설정이\n완료되었습니다.',
            widget.mainText,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
