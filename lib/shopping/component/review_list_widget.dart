import 'package:flutter/material.dart';
import 'package:psr/shopping/component/review_list_item.dart';

class ReviewListWidget extends StatefulWidget {
  const ReviewListWidget({Key? key}) : super(key: key);

  @override
  State<ReviewListWidget> createState() => _ReviewListWidgetState();
}

class _ReviewListWidgetState extends State<ReviewListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 13, bottom: 18),
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          // TODO: 이후 데이터 패치 후 map 연산자를 통해 코드 리팩토링
          ReviewItem(
            avgOfRating: 5.0,
            detail: '리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다 리뷰 내용입니다',
          ),
          ReviewItem(
            avgOfRating: 5.0,
            detail: '리뷰 내용입니다',
          ),
          ReviewItem(
            avgOfRating: 5.0,
            detail: '리뷰 내용입니다',
          ),
          ReviewItem(
            avgOfRating: 5.0,
            detail: '리뷰 내용입니다',
          ),
        ],
      ),
    );
  }
}
