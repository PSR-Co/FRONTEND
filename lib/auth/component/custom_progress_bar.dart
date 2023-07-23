import 'package:flutter/material.dart';

import '../../common/const/colors.dart';

class CustomProgressBar extends StatefulWidget {

  // final int totalPageCnt;
  final int currentPage;

  const CustomProgressBar({
    // required this.totalPageCnt,
    required this.currentPage,
    Key? key
  }) : super(key: key);

  @override
  State<CustomProgressBar> createState() => _CustomProgressBarState();
}

class _CustomProgressBarState extends State<CustomProgressBar> {
  final totalPageCnt = 4;

  @override
  Widget build(BuildContext context) {
    return getProgressBar();
  }

  Widget getProgressBar() {
    const int optionViewCnt = 2;

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
            // color: ((widget.currentPage-1) > index) ? PURPLE_COLOR : GRAY_1_COLOR,
            color: (widget.currentPage > index) ? PURPLE_COLOR : GRAY_1_COLOR,
          );
        },
      ),
    );
  }
}
