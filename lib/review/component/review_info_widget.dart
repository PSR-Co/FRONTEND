import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../common/const/colors.dart';
import '../../product/view/declaration_dialog.dart';

class ReviewInfo extends StatefulWidget {

  final int reviewId;
  final int avgOfRating;
  final String nickName;
  final String reviewedDate;
  final String? profileImgKey;
  final bool isMyReview;

  const ReviewInfo({
    required this.reviewId,
    required this.avgOfRating,
    required this.nickName,
    required this.reviewedDate,
    this.profileImgKey,
    required this.isMyReview,
    Key? key
  }) : super(key: key);

  @override
  State<ReviewInfo> createState() => _ReviewInfoState();
}

class _ReviewInfoState extends State<ReviewInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        renderAvgOfRating(), // 평점
        renderWriteInfo(),  // 작성자 아이디, 작성일, 신고 버튼
      ],
    );
  }

  Widget renderAvgOfRating() {
    const reviewCntStyle = TextStyle(
      fontSize: 12,
      color: GRAY_4_COLOR,
      fontWeight: FontWeight.w700,
    );

    // final int avgOfRating = 5;

    List<Widget> starIconList = [];
    for (int i=0; i<widget.avgOfRating; i++) {
      starIconList.add(
          const Icon(Icons.star, color: Color(0xFFFFA939), size: 16.0,)
      );
    }
    starIconList.add(
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text('${widget.avgOfRating}', style: reviewCntStyle)
        )
    );
    return Container(
      margin: const EdgeInsets.only(left: 11, right: 14, top: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: starIconList,
      ),
    );
  }

  Widget renderWriteInfo() {
    return Container(
      margin: const EdgeInsets.only(left: 14, top: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.nickName, style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12,
              color: GRAY_2_COLOR
          ),),

          const SizedBox(width: 10,),
          // 작성일
          Text('${widget.avgOfRating.toDouble()}', style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: GRAY_2_COLOR,
          ),),

          const SizedBox(width: 12,),
          // 신고 버튼
          TextButton(
            onPressed: didTapDeclarationButton,
            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text('신고', style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: GRAY_2_COLOR
            ),),
          )
        ],
      ),
    );
  }

  /// event methods
  void didTapDeclarationButton() {
    if (widget.isMyReview) {
      Fluttertoast.showToast(
          msg: '자신의 리뷰는 신고할 수 없습니다.',
          gravity: ToastGravity.CENTER,
          toastLength: Toast.LENGTH_LONG,
      );
    } else {
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (_) {
            return DeclarationDialog(idx: widget.reviewId, type: DeclarationType.REVIEW,);
          }
      );
    }

  }
}
