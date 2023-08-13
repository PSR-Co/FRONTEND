import 'package:flutter/material.dart';

import '../../common/const/colors.dart';
import '../../product/view/declaration_dialog.dart';

class ReviewInfo extends StatefulWidget {

  final int productId;
  final int avgOfRating;
  final String nickName;
  final String reviewedDate;
  final String? profileImgKey;

  const ReviewInfo({
    required this.productId,
    required this.avgOfRating,
    required this.nickName,
    required this.reviewedDate,
    this.profileImgKey,
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
          // 아이디 (뒤4자리 가리기)
          Text(getEditedID(widget.nickName), style: const TextStyle(
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

  /// helper methods
  String getEditedID(String id) {
    // 작성자 ID의 뒷 4자리를 '*'로 대체
    if (id.length > 4) { return id.replaceRange(id.length-4, id.length, '****'); }
    else { return id.replaceRange(0, id.length, '****'); }
  }

  /// event methods
  void didTapDeclarationButton() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) {
          return DeclarationDialog(productId: widget.productId,);
        }
    );
  }
}
