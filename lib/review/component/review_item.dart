import 'package:flutter/material.dart';
import 'package:psr/review/component/review_content_widget.dart';
import 'package:psr/review/component/review_img_list_view.dart';
import 'package:psr/review/component/review_info_widget.dart';
import 'package:psr/review/component/user_profile_img_widget.dart';

import '../../common/const/colors.dart';

class ReviewItem extends StatefulWidget {

  final String reviewContent;
  const ReviewItem({
    required this.reviewContent,
    Key? key
  }) : super(key: key);

  @override
  State<ReviewItem> createState() => _ReviewItemState();
}

class _ReviewItemState extends State<ReviewItem> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        renderReviewItem(),
        renderDivider()
      ],
    );
  }

  Widget renderReviewItem() {
    return FittedBox(
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 7),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RoundedUserProfileImg(
              width: 32.0,
              height: 32.0,
              imgKey: 'asset/images/profile_img_sample.jpg',
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReviewInfo(),
                ReviewContent(reviewContent: widget.reviewContent,),
                ReviewImgListView()
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// rendering methods
  Widget renderDivider() {
    return Container(
      height: 1.5,
      width: MediaQuery.of(context).size.width-30,
      color: GRAY_1_COLOR.withOpacity(0.5),
      padding: EdgeInsets.symmetric(horizontal: 15),
    );
  }
}
