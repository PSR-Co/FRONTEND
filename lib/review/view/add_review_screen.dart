import 'package:flutter/material.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';
import 'package:psr/common/layout/purple_outlined_text_field.dart';

import '../../common/const/colors.dart';
import '../../common/const/constants.dart';
import '../../common/layout/purple_bottom_button.dart';

class AddReviewScreen extends StatefulWidget {

  final String sellerName;
  final String productName;
  final String productImgKey;

  const AddReviewScreen({
    required this.sellerName,
    required this.productName,
    required this.productImgKey,
    Key? key
  }) : super(key: key);

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  static const double PROFILE_IMG_SIZE = 64.0;
  final TextEditingController reviewController = TextEditingController();


  int selectedRating = 0;
  String selectedRatingInfoText = '별점을 선택해주세요.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const DefaultAppBarLayout(titleText: '리뷰 작성',),
      body: renderBody(),
      bottomNavigationBar: PurpleBottomButton(title: '등록하기', onPressed: didTapAddReviewButton,),
    );
  }

  /// rendering methods
  Widget renderBody() {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          renderProductInfoView(),
          Container(height: 5, color: GRAY_0_COLOR.withOpacity(0.5),),
          renderInputReviewView(),
        ],
      ),
    );
  }

  Widget renderProductInfoView() {
    const TextStyle sellerNameStyle = TextStyle(
      fontSize: 13,
      color: GRAY_3_COLOR,
    );

    const TextStyle productNameStyle = TextStyle(
      fontSize: 16,
      color: GRAY_4_COLOR,
    );

    return Container(
      height: 110,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 10),
              child: Image.asset(widget.productImgKey, fit: BoxFit.cover, width: PROFILE_IMG_SIZE,),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.sellerName, style: sellerNameStyle,),
                Container(
                  margin: const EdgeInsets.only(top: 3),
                  child: Text(widget.productName, style: productNameStyle,),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget renderInputReviewView() {
    return SizedBox(
      height: 1000,
      child: ListView(
        children: [
          renderTitleText('상품은 어떠셧나요?'),
          renderStarButtonList(),

          Container(
            margin: const EdgeInsets.only(top: 5, bottom: 5, left: 20),
            child: (selectedRating > 0) ? renderSelectedRatingText() :
            Text('별점을 선택해주세요.', style: TextStyle(
              fontSize: 14,
              color: (selectedRating == 0) ? GRAY_1_COLOR : ORANGE_COLOR,
            ),
            ),
          ),

          const SizedBox(height: 20,),

          renderTitleText('상세한 후기를 써주세요.'),
          PurpleOutlinedTextField(
              maxLine: 5,
              maxLength: 5000,
              hintText: '구매하신 상품의 후기를 20자 이상 남겨주시면 다른 구매자들에게도 도움이 됩니다.',
              controller: reviewController
          ),

        ],
      ),
    );
  }

  Widget renderTitleText(String title) {
    const TextStyle titleStyle = TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );

    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 5, left: 20, right: 20),
      child: Text(title, style: titleStyle,),
    );
  }

  Widget renderStarButtonList() {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return IconButton(
            padding: EdgeInsets.zero,
            onPressed: (){
              setState(() { selectedRating = index+1; });
            },
            icon: Icon(
              Icons.star,
              color: (index < selectedRating) ? ORANGE_COLOR : GRAY_0_COLOR,
              size: 46,)
          );
        },
      )
    );
  }

  Widget renderSelectedRatingText() {
    final defaultStyle = TextStyle(
        fontSize: 14,
        color: (selectedRating == 0) ? GRAY_1_COLOR : ORANGE_COLOR,
    );

    return RichText(
        text: TextSpan(
          text: '$selectedRating점',
          style: defaultStyle.copyWith(fontWeight: FontWeight.w700),
          children: [
            TextSpan(
              text: ' (${RATING_DETAIL[selectedRating].toString()})',
              style: defaultStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 13),
            )
          ]
        )
    );
  }

  /// event methods
  void didTapAddReviewButton() {
    print('didTapAddReviewButton');
    print('입력된 리뷰 정보 -> ${selectedRating}점 / 후기 상세 : ${reviewController.text}');
  }
}
