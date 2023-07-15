import 'package:flutter/material.dart';

import '../../common/const/colors.dart';
import '../../product/view/declaration_dialog.dart';

class ReviewInfo extends StatefulWidget {
  const ReviewInfo({Key? key}) : super(key: key);

  @override
  State<ReviewInfo> createState() => _ReviewInfoState();
}

class _ReviewInfoState extends State<ReviewInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        renderAvgOfRating(), // 평점
        renderWriteInfo(),  // 작성자 아이디, 작성일, 신고 버튼
      ],
    );
  }

  Widget renderAvgOfRating() {
    final reviewCntStyle = TextStyle(
      fontSize: 12,
      color: GRAY_4_COLOR,
      fontWeight: FontWeight.w700,
    );

    final int avgOfRating = 5;

    List<Widget> starIconList = [];
    for (int i=0; i<avgOfRating; i++) {
      starIconList.add(
          Icon(Icons.star, color: Color(0xFFFFA939), size: 16.0,)
      );
    }
    starIconList.add(
        Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text('${avgOfRating.toDouble()}', style: reviewCntStyle)
        )
    );
    return Container(
      margin: EdgeInsets.only(left: 11, right: 14, top: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: starIconList,
      ),
    );
  }

  Widget renderWriteInfo() {
    return Container(
      margin: EdgeInsets.only(left: 14, top: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 아이디 (뒤4자리 가리기)
          Text(getEditedID('test1234'), style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12,
              color: GRAY_2_COLOR
          ),),

          SizedBox(width: 10,),
          // 작성일
          Text('23.07.16', style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: GRAY_2_COLOR,
          ),),

          SizedBox(width: 12,),
          // 신고 버튼
          TextButton(
            onPressed: didTapDeclarationButton,
            child: Text('신고', style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: GRAY_2_COLOR
            ),),
            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              padding: EdgeInsets.symmetric(horizontal: 10),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          )
        ],
      ),
    );
  }

  /// helper methods
  String getEditedID(String id) {
    // 작성자 ID의 뒷 4자리를 '*'로 대체
    return id.replaceRange(id.length-4, id.length, '****');
  }

  /// event methods
  void didTapDeclarationButton() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) {
          return DeclarationDialog();
        }
    );
  }
}
