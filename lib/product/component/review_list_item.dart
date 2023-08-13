import 'package:flutter/material.dart';

import '../../common/const/colors.dart';

class ReviewItem extends StatefulWidget {
  final int avgOfRating;
  final String detail;
  final String? imgUrl;

  const ReviewItem({
    required this.avgOfRating,
    required this.detail,
    this.imgUrl,
    Key? key
  }) : super(key: key);

  @override
  State<ReviewItem> createState() => _ReviewItemState();
}

class _ReviewItemState extends State<ReviewItem> {
  static final double CONTAINER_HEIGHT = 190.0;
  static final double REVIEW_IMG_HEIGHT = 48.0;
  static final double REVIEW_IMG_WIDTH = 48.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: CONTAINER_HEIGHT,
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
    const reviewCntStyle = TextStyle(
      fontSize: 13,
      color: GRAY_4_COLOR,
      fontWeight: FontWeight.w700,
    );

    List<Widget> starIconList = [];
    for (int i=0; i<widget.avgOfRating; i++) {
      starIconList.add(
          const Icon(Icons.star, color: Color(0xFFFFA939), size: 14.0,)
      );
    }
    starIconList.add(
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text('${widget.avgOfRating}', style: reviewCntStyle)
        )
    );
    return Container(
      padding: const EdgeInsets.only(left: 14, right: 14, top: 12, bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: starIconList,
      ),
    );
  }
  
  Widget renderDetail() {
    const reviewStyle = TextStyle(fontSize: 12,);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: CONTAINER_HEIGHT - REVIEW_IMG_WIDTH - 15,
          height: REVIEW_IMG_HEIGHT,
          padding: const EdgeInsets.only(left: 14, right: 5),
          child: Text(widget.detail, style: reviewStyle, maxLines: 2,),
        ),
        Container(
          padding: const EdgeInsets.only(right: 10),
            // TODO: widget.imgUrl로 렌더링
            child: Image.asset("asset/images/product_sample.png", width: REVIEW_IMG_WIDTH, height: REVIEW_IMG_HEIGHT,)
        )
      ],
    );
  }
}
