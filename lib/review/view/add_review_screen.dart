import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:psr/common/layout/pick_img_widget.dart';
import 'package:psr/common/layout/purple_outlined_text_field.dart';
import 'package:psr/model/data/review/review_model.dart';
import 'package:psr/presenter/review/review_service.dart';
import 'package:psr/review/component/review_detail_appbar.dart';

import '../../common/const/colors.dart';
import '../../common/const/constants.dart';
import '../../common/layout/custom_title_text.dart';
import '../../common/layout/purple_filled_button.dart';

enum REVIEW_SCREEN_TYPE { ADD, EDIT }

class AddReviewScreen extends StatefulWidget {

  final String sellerName;
  final String productName;
  final String productImgKey;

  final int? orderId;
  final int? reviewId;

  const AddReviewScreen({
    required this.sellerName,
    required this.productName,
    required this.productImgKey,
    required this.reviewId,
    required this.orderId,
    Key? key
  }) : super(key: key);

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  static const double PROFILE_IMG_SIZE = 64.0;
  final TextEditingController reviewController = TextEditingController();

  List<String> imgKeyList = [];

  int selectedRating = 0;
  String selectedRatingInfoText = '별점을 선택해주세요.';

  Review? data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ReviewDetailAppbar(reviewId: widget.reviewId),
      body: renderBody(),
      bottomNavigationBar: (widget.reviewId == null)
          ? PurpleFilledButton(title: '등록하기', onPressed: didTapAddReviewButton,)
          : Container(height: 0,),
    );
  }

  /// rendering methods
  Widget renderBody() {
    return FutureBuilder<dynamic>(
        future: fetchData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!snapshot.hasError) {
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

          } else {
            print('error -> ${snapshot.error}');
            return const Center(
              child: Text('리뷰 정보를 불러오지 못하였습니다.', style: TextStyle(fontSize: 14, color: Colors.black),),
            );
          }
        }
    );
  }

  Widget renderCenterView() {
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
      height: 550,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          renderInputRatingView(),
          const SizedBox(height: 18,),

          renderInputDetailView(),
          const SizedBox(height: 18,),

          renderPickImgView(),
          const SizedBox(height: 100,),

        ],
      ),
    );
  }

  Widget renderInputRatingView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15,),
        const CustomTitleText(title: '상품은 어떠셨나요?', option: null,),
        getStarButtonList(),

        Container(
          margin: const EdgeInsets.only(top: 5, bottom: 5, left: 20),
          child: (selectedRating > 0)
              ? getSelectedRatingText()
              : Text('별점을 선택해주세요.', style: TextStyle(
                  fontSize: 14,
                  color: (selectedRating == 0) ? GRAY_1_COLOR : ORANGE_COLOR,
                ),),
        )
      ],
    );
  }

  Widget renderInputDetailView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTitleText(title: '상세한 후기를 써주세요.', option: null,),
        PurpleOutlinedTextField(
            maxLine: 15,
            maxLength: 5000,
            hintText: '구매하신 상품의 후기를 20자 이상 남겨주시면 다른 구매자들에게도 도움이 됩니다.',
            controller: reviewController
        ),
      ],
    );
  }

  Widget renderPickImgView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTitleText(title: '사진을 올려주세요.', option: ' (선택)',),
        PickImgView(imgKeyList: imgKeyList,),
        // PickImgView(imgKeyList: (data != null && data!.imgList != null) ? data!.imgList : [],),
      ],
    );
  }

  /// getting custom component methods
  Widget getStarButtonList() {
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

  Widget getSelectedRatingText() {
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
  Future<void> didTapAddReviewButton() async {
    final result = await ReviewService().addReview(
      widget.orderId!,
      selectedRating,
      reviewController.value.text,
      imgKeyList,
    );
    if (result) { Navigator.of(context).pop(); }
    else { Fluttertoast.showToast(msg: '리뷰 등록에 실패하였습니다.'); }
  }

  Future<void> fetchData() async {
    if (widget.reviewId != null) {
      final response = await ReviewService().getReviewData('${widget.reviewId}');
      print('response -> $response');
      final result = ReviewResponseModel.fromJson(response);
      if (result.code == 200) {
        data = result.data;
        selectedRating = data!.rating;
        reviewController.text = data!.content;
        imgKeyList = data!.imgList ?? [];
      }
    }
  }
}
