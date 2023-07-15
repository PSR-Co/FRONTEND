import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:psr/common/const/colors.dart';

import '../../product/view/product_detail_screen.dart';

class PopularListItem extends StatefulWidget {
  final String category;

  // TODO: api 연결 후 속성값(상품이름,가격,평균리뷰점수, 리뷰개수, 좋아요 여부) 추가 및 수정
  const PopularListItem({
    required this.category,
    Key? key
  }) : super(key: key);

  @override
  State<PopularListItem> createState() => _PopularListItemState();
}

class _PopularListItemState extends State<PopularListItem> {
  bool isLiked = false;

  /// TextStyle 정의
  final productNameTextStyle = TextStyle(
    color: GRAY_4_COLOR,
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
  );

  final itemOrderTextStyle = TextStyle(
    color: GRAY_4_COLOR,
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
  );

  final priceTextStyle = TextStyle(
    color: GRAY_4_COLOR,
    fontSize: 15.0,
    fontWeight: FontWeight.w500,
  );

  final reviewPointTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 11.0,
    fontWeight: FontWeight.w500,
  );

  final reviewCountTextStyle = TextStyle(
    color: GRAY_2_COLOR,
    fontSize: 11.0,
    fontWeight: FontWeight.w400,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 170,
        child: Column(
          children: [
            renderProductImageItem(),
            renderItemOrder(),
            renderDivider(),
            renderProductInfo(),
          ],
        ),
      ),
      onTap: didTapItem,
    );
  }

  /// 제품 이미지 컴포넌트 구현 관련 메소드
  Widget renderProductImageItem() {
    return Stack(
      children: [
        renderProductImage('asset/images/product_sample.png'),
        renderLikeButton(),
      ],
    );
  }

  Widget renderProductImage(String imgUrl) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 2.0),
        decoration: BoxDecoration(
          border: Border.all(
              width: 1.0,
              color: GRAY_0_COLOR
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Image.asset(imgUrl, width: 160, height: 160,)
    );
  }

  Widget renderLikeButton() {
    Widget likeIcon;
    if (isLiked) {
      likeIcon = SvgPicture.asset('asset/icons/common/favorite_border.fill.svg', width: 20, height: 20,);
    } else {
      likeIcon = SvgPicture.asset('asset/icons/common/favorite_border.svg', width: 20, height: 20,);
    }

    return Positioned(
      bottom: 0,
      right: 0,
      child: IconButton(
          onPressed: didTapLikeButton,
          icon: likeIcon!
      ),
    );
  }

  /// 제품 순서 구현 메소드
  Widget renderItemOrder() {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 3),
        child: Text('01', style: itemOrderTextStyle,)
    );
  }

  /// 구분선 구현 메소드
  Widget renderDivider() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Divider(thickness: 1, height: 1,color: GRAY_0_COLOR)
    );
  }

  /// 제품 정보 구현 관련 메소드
  Widget renderProductInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('폴로랄프로렌 목도리', style: productNameTextStyle,),
          Text('79,000원', style: priceTextStyle,),
          renderReviewInfo()
        ],
      ),
    );
  }

  Widget renderReviewInfo() {
    return Padding(
      padding: EdgeInsets.only(top: 4, bottom: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 3, top: 1),
            child: Icon(Icons.star, color: Color(0xFFFFA939), size: 12.0,),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 2),
            child: Text('5.0', style: reviewPointTextStyle,),
          ),
          Text('(1)', style: reviewCountTextStyle,),
        ],
      ),
    );
  }


  /// 이벤트 메소드 정의
  void didTapLikeButton() {
    print('didTapLikeButton');
    setState(() {
      isLiked = !isLiked;
    });
  }

  void didTapItem() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => ProductDetailScreen(category: widget.category,)));
  }
}
