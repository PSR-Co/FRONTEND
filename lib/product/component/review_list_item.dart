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
  static const double CONTAINER_HEIGHT = 190.0;
  static const double REVIEW_IMG_HEIGHT = 48.0;
  static const double REVIEW_IMG_WIDTH = 48.0;

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
      children: [
        Container(
          width: CONTAINER_HEIGHT - REVIEW_IMG_WIDTH - 20,
          height: REVIEW_IMG_HEIGHT,
          margin: const EdgeInsets.only(left: 10),
          padding: const EdgeInsets.only(left: 10, right: 5),
          child: Text(widget.detail, style: reviewStyle, maxLines: 2,),
        ),
        renderReviewImg(),
      ],
    );
  }

  Widget renderReviewImg() {
    return (widget.imgUrl == null)
      ? const SizedBox(height: 0,)
      : Container(
          padding: const EdgeInsets.only(right: 10),
          child: Image.network(widget.imgUrl!, width: REVIEW_IMG_WIDTH, height: REVIEW_IMG_HEIGHT,)
        );
  }
}
