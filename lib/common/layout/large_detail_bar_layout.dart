import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../const/colors.dart';

class LargeDetailBar extends StatefulWidget {
  String title;
  Widget moveTo;

  LargeDetailBar({required this.title, required this.moveTo, Key? key})
      : super(key: key);

  @override
  State<LargeDetailBar> createState() => LargeDetailBarState();
}

class LargeDetailBarState extends State<LargeDetailBar> {
  final TextStyle headerTextStyle = const TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);

  ///위젯 임시 연결
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => widget.moveTo));
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        // margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                widget.title,
                style: headerTextStyle,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => widget.moveTo));
              },
              icon: SvgPicture.asset('asset/icons/common/forward.svg'),
              padding: const EdgeInsets.only(bottom: 2.0),
              constraints: const BoxConstraints(),
            )
          ],
        ),
      ),
    );
  }
}
