import 'package:flutter/material.dart';

import '../../common/const/colors.dart';

class ReviewItem extends StatefulWidget {
  final double avgOfRating;
  final String detail;
  final String? imgKey;

  const ReviewItem({
    required this.avgOfRating,
    required this.detail,
    this.imgKey,
    Key? key
  }) : super(key: key);

  @override
  State<ReviewItem> createState() => _ReviewItemState();
}

class _ReviewItemState extends State<ReviewItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 190,
      decoration: BoxDecoration(
        color: GRAY_0_COLOR,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          renderAvgOfRating(),
          renderDetail()
        ],
      ),
    );
  }

  Widget renderAvgOfRating() {
    final reviewCntStyle = TextStyle(
      fontSize: 13,
      color: GRAY_4_COLOR,
      fontWeight: FontWeight.w700,
    );

    List<Widget> starIconList = [];
    for (int i=0; i<widget.avgOfRating; i++) {
      starIconList.add(
          Icon(Icons.star, color: Color(0xFFFFA939), size: 14.0,)
      );
    }
    starIconList.add(
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text('${widget.avgOfRating}', style: reviewCntStyle)
        )
    );
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: starIconList,
      ),
    );
  }
  
  Widget renderDetail() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(widget.detail, style: TextStyle(
          fontSize: 12
        ),),
        Image.asset("asset/images/product_sample.png", width: 48, height: 48,)
      ],
    );
  }
}
