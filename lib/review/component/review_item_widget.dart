import 'package:flutter/material.dart';
import 'package:psr/review/component/review_content_widget.dart';
import 'package:psr/review/component/review_img_list_view.dart';
import 'package:psr/review/component/review_info_widget.dart';
import 'package:psr/review/component/user_profile_img_widget.dart';

import '../../common/const/colors.dart';
import '../../model/data/review/review_model.dart';

class ReviewItemWidget extends StatefulWidget {

  final ReviewItem review;

  const ReviewItemWidget({
    required this.review,
    Key? key
  }) : super(key: key);

  @override
  State<ReviewItemWidget> createState() => _ReviewItemWidgetState();
}

class _ReviewItemWidgetState extends State<ReviewItemWidget> {

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
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RoundedUserProfileImg(
              width: 32.0,
              height: 32.0,
              imgKey: widget.review.profileImgUrl,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReviewInfo(
                  reviewId: widget.review.reviewId,
                  avgOfRating: widget.review.rating,
                  nickName: widget.review.nickName,
                  reviewedDate: widget.review.reviewedDate,
                  isMyReview: widget.review.isMyReview,
                ),
                ReviewContent(reviewContent: widget.review.content,),
                ReviewImgListView(imgUrlList: widget.review.imgList ?? [],)
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
      padding: const EdgeInsets.symmetric(horizontal: 15),
    );
  }
}
