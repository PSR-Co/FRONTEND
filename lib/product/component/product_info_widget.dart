import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../common/const/colors.dart';
import '../../review/view/review_screen.dart';

class ProductInfoWidget extends StatefulWidget {
  final int productId;
  final String productName;
  final int price;
  final double avgOfRating;
  final int reviewCnt;

  const ProductInfoWidget({
    required this.productId,
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
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Text(widget.productName, style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),),
        ),

        // 별점 이미지 + 리뷰 개수
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: renderAvgOfRating()
        ),

        // 가격
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Text('${getTrimmedPrice()}원', style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),),
        ),
      ],
    );
  }

  /// rendergin methods
  Widget renderAvgOfRating() {
    const reviewCntStyle = TextStyle(
      fontSize: 14,
      color: GRAY_4_COLOR,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.underline,
    );

    List<Widget> starIconList = [];
    for (int i=0; i<widget.avgOfRating; i++) {
      starIconList.add(
          const Icon(Icons.star, color: Color(0xFFFFA939), size: 16.0,)
      );
    }
    starIconList.add(
        TextButton(
          style: TextButton.styleFrom(
            minimumSize: Size.zero,
            padding: const EdgeInsets.symmetric(vertical: 10),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
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
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => ReviewScreen(productId: widget.productId,)));
  }
}
