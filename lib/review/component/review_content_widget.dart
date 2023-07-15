import 'package:flutter/material.dart';

import '../../common/const/colors.dart';

class ReviewContent extends StatefulWidget {
  final String reviewContent;

  const ReviewContent({
    required this.reviewContent,
    Key? key
  }) : super(key: key);

  @override
  State<ReviewContent> createState() => _ReviewContentState();
}

class _ReviewContentState extends State<ReviewContent> {
  bool isFolded = true;
  static const double FOLDED_REVIEW_HEIGHT = 90;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() { isFolded = !isFolded;});
        },
        child:
        !(widget.reviewContent.length > 100 && !isFolded) ?
        Container(
          height: FOLDED_REVIEW_HEIGHT,  // TODO: 리뷰 내용에 따른 동적 높이로 변경
          width: MediaQuery.of(context).size.width - 85,
          margin: EdgeInsets.only(left: 14, top: 10),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: GRAY_0_COLOR,
              borderRadius: BorderRadius.circular(14)
          ),
          child: Text(widget.reviewContent),
        ) :
        FittedBox(
            child: Container(
              width: MediaQuery.of(context).size.width - 85,
              margin: EdgeInsets.only(left: 14, top: 10),
              padding: EdgeInsets.all(15),
              child: Text(widget.reviewContent, style: TextStyle(
                  fontSize: 14,
                  color: Colors.black),
              ),
              decoration: BoxDecoration(
                  color: GRAY_0_COLOR,
                  borderRadius: BorderRadius.circular(14)
              ),
            )
        )
    );
  }

}
