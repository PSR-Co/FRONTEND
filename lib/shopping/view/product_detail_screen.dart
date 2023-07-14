import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:psr/common/const/colors.dart';
import 'package:psr/shopping/component/product_img_page_view.dart';
import 'package:intl/intl.dart';

import '../component/review_list_item.dart';

class ProductDetailScreen extends StatefulWidget {
  final String category;

  const ProductDetailScreen({required this.category, Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {

  bool isFolded = true;
  final isMyProduct = false;

  final String sellerName = "루시 앤플 셀러";
  final String name = "폴로랄프로렌 목도리";
  final double avgOfRating = 5.0;
  final int reviewCnt = 12;
  final int price = 79000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      body: renderBody(),
      bottomNavigationBar: renderBottomButtons(),
    );
  }

  AppBar renderAppBar() {
    final titleStyle = TextStyle(
        color: Colors.black,
        fontSize: 17
    );
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(getTrimmedCategory(), style: titleStyle,),
      centerTitle: true,
      leading: renderleftItem(),
      actions: renderRightItems(),
      elevation: 0,
    );
  }

  String getTrimmedCategory() {
    String category = widget.category;
    if (category.contains('\n')) {
      category = category.replaceAll('\n', ' ');
    }
    return category;
  }

  String getTrimmedPrice() {
    return NumberFormat.currency(locale: 'ko_KR', symbol: '').format(price);
  }

  Widget renderleftItem() {
    return Container(
      child: IconButton(
        icon: SvgPicture.asset("asset/icons/common/chevron.backward.svg"),
        onPressed: didTapBackItem,
      ),
    );
  }

  List<Widget> renderRightItems() {
    List<Widget> rightItems = [];
    if (isMyProduct) {
      rightItems.add(
          IconButton(
            icon: SvgPicture.asset("asset/icons/shopping/more_vertical.svg"),
            onPressed: didTapMoreButton,
          )
      );
    } else {
      rightItems.add(
        IconButton(
          icon: SvgPicture.asset("asset/icons/shopping/declaration.svg"),
          onPressed: didTapDeclarationButton,
        )
      );
      rightItems.add(
        IconButton(
          icon: SvgPicture.asset("asset/icons/shopping/share.svg"),
          onPressed: didTapShareButton,
        )
      );
    }

    return rightItems;
  }

  Widget renderBody() {
    final sellerNameStyle = TextStyle(
      fontSize: 15,
      color: GRAY_2_COLOR,
      fontWeight: FontWeight.w500
    );

    final List<String> imgKeyList = [
      "asset/images/product_sample.png",
      "asset/images/product_sample.png",
      "asset/images/product_sample.png",
      "asset/images/product_sample.png",
      "asset/images/product_sample.png",
    ];
    
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          // 상품 이미지 리스트
          ProductImgPageView(imgKeyList: imgKeyList, context: context),
          SizedBox(height: 25,),
          // 팔매자 이름 버튼
          Container(
            padding: EdgeInsets.symmetric(horizontal: 11),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: (){
                      // TODO: 판매자 프로필 화면으로 전환
                    },
                    child: Text(sellerName, style: sellerNameStyle,),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.only(left: 8),
                    // backgroundColor: Colors.red
                  ),
                ),
                SizedBox(
                  width: 10,
                  child: IconButton(
                    onPressed: (){
                      // TODO: 판매자 프로필 화면으로 전환
                      print("did tap icon btn");
                    },
                    icon: Icon(Icons.chevron_right, color: GRAY_2_COLOR,),
                  ),
                ),
              ],
            ),
          ),
          // 상품 제목
          Container(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Text(name, style: TextStyle(
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

          // 상세 뷰
          // 더보기 버튼
          renderProductDetail(),

          // 리뷰 목록 프리뷰
          Container(
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
          )
        ],
      ),
    );
  }

  Widget renderAvgOfRating() {
    final reviewCntStyle = TextStyle(
      fontSize: 14,
      color: GRAY_4_COLOR,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.underline,
    );

    List<Widget> starIconList = [];
    for (int i=0; i<avgOfRating; i++) {
      starIconList.add(
          Icon(Icons.star, color: Color(0xFFFFA939), size: 16.0,)
      );
    }
    starIconList.add(
        TextButton(
            onPressed: didTapReviewCntButton,
            child: Text('리뷰 ${reviewCnt}개', style: reviewCntStyle,)
        )
    );
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: starIconList,
    );
  }

  Widget renderProductDetail() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      height: isFolded ? 200 : 1000,  // TODO: 상세내용에 따른 동적높이 구현
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        color: GRAY_0_COLOR,
      ),
      child:
      Stack(
          children: [
            Container(
                margin: EdgeInsets.all(10),
                child: Text("상세설명 상세설명 상세설명 상세설명 상세설명 상세설명 상세설명 상세설명 상세설명 상세설명 상세설명 상세설명 상세설명 상세설명 상세설명")
            ),
            Positioned(
                left: 0, right: 0, bottom: 0,
                height: 40,
                child: OutlinedButton(
                    onPressed: didTapViewMoreButton,
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(width: 1, color: PURPLE_COLOR),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        )
                    ),
                    child: Text(isFolded ? "상세설명 더보기 \u{0203A}" : "상세설명 접기", style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: PURPLE_COLOR
                    ),)
                )
            )
          ]
      ),
    );
  }

  Widget renderBottomButtons() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(bottom: 20),
      height: 90,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          renderLikeButton(),
          renderOrderButton(),
        ],
      ),
    );
  }

  Widget renderLikeButton() {
    final likeCntStyle = TextStyle(
        fontSize: 12,
        color: PINK_COLOR,
        fontWeight: FontWeight.w500
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 35,
          width: 40,
          child: IconButton(
              onPressed: didTapLikeButton,
              icon: SvgPicture.asset("asset/icons/common/favorite_border.fill.svg")
          ),
        ),
        Text('23', style: likeCntStyle,),
      ],
    );
  }

  Widget renderOrderButton() {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 8),
      margin: EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      width: MediaQuery.of(context).size.width-90,
      child: ElevatedButton(
        onPressed: didTapOrderButton,
        child: Text("1:1 요청하기", style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14
        ),),
        style: ElevatedButton.styleFrom(
            backgroundColor: PURPLE_COLOR,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            elevation: 0
        ),
      ),
    );
  }

  /// 이벤트 메소드 정의
  void didTapBackItem() {
    Navigator.of(context).pop();
  }

  void didTapMoreButton() {
    print("didTapMoreButton");
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) {
          return Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                bottom: 65.1,
                height: 65,
                  child: ElevatedButton(
                    onPressed: didTapEditButton,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: Text("수정", style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                      ),
                    ),
                )
              ),
              Divider(color: GRAY_0_COLOR, height: 0.1,),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  height: 65,
                  child: ElevatedButton(
                    onPressed: didDeleteEditButton,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: Text("삭제", style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.red
                    ),
                    ),
                  )
              ),
            ],
          );
        }
    );
  }

  void didTapDeclarationButton() {
    // TODO: 신고하기 팝업 띄우기
    print("didTapDeclarationButton");
  }

  void didTapShareButton() {
    print("didTapShareButton");
  }

  void didTapEditButton() {
    print("didTapEditButton");
  }

  void didDeleteEditButton() {
    print("didDeleteEditButton");
  }

  void didTapLikeButton() {
    print("didTapLikeButton");
  }

  void didTapOrderButton() {
    print("didTapOrderButton");
  }

  void didTapReviewCntButton() {
    print("didTapReviewCntButton");
  }

  void didTapViewMoreButton() {
    setState(() {
      isFolded = !isFolded;
    });
  }
}