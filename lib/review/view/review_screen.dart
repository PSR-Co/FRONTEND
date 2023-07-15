import 'package:flutter/material.dart';

import '../../common/layout/default_appbar_layout.dart';
import '../component/review_item.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {

  final String reviewContent = '리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다';
  bool isReviewFolded = true;
  int isTappedIndex = -1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarLayout(titleText: '리뷰',),
      body: renderBody(),
    );
  }

  /// rendering methods
  Widget renderBody() {
    return Container(
      color: Colors.white,
      child: ListView.builder(
          itemCount: 10,  // for test
          itemBuilder: (BuildContext context, int index) {
            return ReviewItem(reviewContent: reviewContent,);
          }
      ),
    );
  }
}