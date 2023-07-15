import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/const/colors.dart';
import '../../product/view/product_detail_screen.dart';

class CategoryListItem extends StatefulWidget {
  final String category;

  const CategoryListItem({
    required this.category,
    Key? key
  }) : super(key: key);

  @override
  State<CategoryListItem> createState() => _CategoryListItemState();
}

class _CategoryListItemState extends State<CategoryListItem> {
  bool isLiked = false;

  // 제품 정보 텍스트 스타일 정의
  final brandNameTextStyle = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    color: GRAY_4_COLOR,
  );

  final productNameTextStyle = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    color: GRAY_4_COLOR,
  );

  final priceTextStyle = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: didTapItem,
      child: IntrinsicHeight(
        child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Row(
            children: [
              renderProductImage(),
              renderProductInfo(),
              renderLikeButton(),
            ],
          ),
        ),
      ),
    );
  }

  /// 제품 이미지 위젯 구현 메소드
  Widget renderProductImage() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          border: Border.all(
              width: 1.0,
              color: GRAY_0_COLOR
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Image.asset('asset/images/product_sample.png', width: 90, height: 90,)
    );
  }

  /// 제품 정보(cloumn: 브랜드명, 제품명, 가격) 위젯 구현 메소드
  Widget renderProductInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('루시 앤플 셀러', style: brandNameTextStyle,),
          Text('폴로랄프로렌 목도리 Red Color', style: productNameTextStyle,),
          Text('79,000원', style: priceTextStyle,),
        ],
      ),
    );
  }

  /// 좋아요 버튼 위젯 구현 메소드
  Widget renderLikeButton() {
    Widget likeIcon;
    if (isLiked) {
      likeIcon = SvgPicture.asset('asset/icons/common/favorite_border.fill.svg', width: 20, height: 20,);
    } else {
      likeIcon = SvgPicture.asset('asset/icons/common/favorite_border.svg', width: 20, height: 20,);
    }

    return IconButton(
        onPressed: didTapLikeButton,
        icon: likeIcon
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
