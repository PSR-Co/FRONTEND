import 'package:flutter/material.dart';

import '../../common/layout/default_appbar_layout.dart';
import '../component/review_item.dart';

class ReviewScreen extends StatefulWidget {
  final int productId;

  const ReviewScreen({
    required this.productId,
    Key? key
  }) : super(key: key);

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {

  final String reviewContent = '리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다';
  bool isReviewFolded = true;
  int isTappedIndex = -1;


  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: const DefaultAppBarLayout(titleText: '리뷰',),
    //   body: renderBody(),
    // );
    return FutureBuilder<dynamic>(
        future: fetchData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return Scaffold(
            appBar: const DefaultAppBarLayout(titleText: '리뷰',),
            body: renderBody(snapshot.hasError),
          );
        }
    );
  }

  /// rendering methods
  Widget renderBody(bool hasError) {
    return Container(
      color: Colors.white,
      child: (hasError)
          ? const Center(
              child: Text('리뷰 정보를 불러오지 못하였습니다.'),
            )
          : ListView.builder(
              itemCount: 10,  // for test
              itemBuilder: (BuildContext context, int index) {
                return ReviewItem(reviewContent: reviewContent,);
              }
            ),
    );
  }

  Future<void> fetchData() async {

  }
}