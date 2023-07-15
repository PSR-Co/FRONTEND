import 'package:flutter/material.dart';
import 'package:psr/common/const/colors.dart';

import '../../common/layout/default_appbar_layout.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
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
        itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                renderReviewItem(),
                renderDivider()
              ],
            );
          }
      ),
    );
  }

  Widget renderReviewItem() {
    return Container(
      color: Colors.white,
      height: 300,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          renderProfileImg(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              renderAvgOfRating(), // 평점

              Container(
                margin: EdgeInsets.only(left: 14, top: 3),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 아이디 (뒤4자리 가리기)
                    Text('ryr0121', style: TextStyle(
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
                        onPressed: (){},
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
              )

              // 리뷰 내용

              // 리뷰 사진 (사진 있으면,,!)
            ],
          ),
        ],
      ),
    );
  }

  Widget renderDivider() {
    return Container(
      height: 1.5,
      width: MediaQuery.of(context).size.width-30,
      color: GRAY_1_COLOR.withOpacity(0.5),
      padding: EdgeInsets.symmetric(horizontal: 15),
    );
  }

  Widget renderProfileImg() {
    const double PROFILE_IMG_SIZE = 32.0;

    return Container(
      padding: EdgeInsets.only(left: 20, top: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(PROFILE_IMG_SIZE/2),
        child: Image.asset('asset/images/profile_img_sample.jpg', width: PROFILE_IMG_SIZE, height: PROFILE_IMG_SIZE,),
      ),
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
}
