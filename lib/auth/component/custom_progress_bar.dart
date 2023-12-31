import 'package:flutter/material.dart';

import '../../common/const/colors.dart';

class CustomProgressBar extends StatefulWidget {

  final int currentPage;

  const CustomProgressBar({
    required this.currentPage,
    Key? key
  }) : super(key: key);

  @override
  State<CustomProgressBar> createState() => _CustomProgressBarState();
}

class _CustomProgressBarState extends State<CustomProgressBar> {
  final totalPageCnt = 5;

  @override
  Widget build(BuildContext context) {
    return getProgressBar();
  }

  Widget getProgressBar() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 5,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: totalPageCnt,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 1),
            width: MediaQuery.of(context).size.width / totalPageCnt,
            height: 1.5,
            color: (widget.currentPage > index) ? PURPLE_COLOR : GRAY_1_COLOR,
          );
        },
      ),
    );
  }
}
