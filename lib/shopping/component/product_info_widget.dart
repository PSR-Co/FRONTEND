import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../common/const/colors.dart';

class ProductInfoWidget extends StatefulWidget {
  final String productName;
  final int price;
  final double avgOfRating;
  final int reviewCnt;

  const ProductInfoWidget({
    required this.productName,
    required this.price,
    required this.avgOfRating,
    required this.reviewCnt,
    Key? key
  }) : super(key: key);

  @override
  State<ProductInfoWidget> createState() => _ProductInfoWidgetState();
}

class _ProductInfoWidgetState extends State<ProductInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 상품 제목
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Text(widget.productName, style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),),
        ),

        // 별점 이미지 + 리뷰 개수
        Container(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: renderAvgOfRating()
        ),

        // 가격
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Text('${getTrimmedPrice()}원', style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),),
        ),
      ],
    );
  }

  /// rendergin methods
  Widget renderAvgOfRating() {
    final reviewCntStyle = TextStyle(
      fontSize: 14,
      color: GRAY_4_COLOR,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.underline,
    );

    List<Widget> starIconList = [];
    for (int i=0; i<widget.avgOfRating; i++) {
      starIconList.add(
          Icon(Icons.star, color: Color(0xFFFFA939), size: 16.0,)
      );
    }
    starIconList.add(
        TextButton(
            onPressed: didTapReviewCntButton,
            child: Text('리뷰 ${widget.reviewCnt}개', style: reviewCntStyle,)
        )
    );
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: starIconList,
    );
  }

  /// helper methods
  String getTrimmedPrice() {
    return NumberFormat.currency(locale: 'ko_KR', symbol: '').format(widget.price);
  }

  /// event methods
  void didTapReviewCntButton() {
    print("didTapReviewCntButton");
  }
}
