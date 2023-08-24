import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/const/colors.dart';
import '../../model/data/shopping/shopping_main_model.dart';

class CategoryListItem extends StatefulWidget {
  final String? category;
  final int? productId;
  final Product data;

  const CategoryListItem({
    this.category,
    this.productId,
    required this.data,
    Key? key
  }) : super(key: key);

  @override
  State<CategoryListItem> createState() => _CategoryListItemState();
}

class _CategoryListItemState extends State<CategoryListItem> {
  bool isLiked = false;

  // 제품 정보 텍스트 스타일 정의
  final brandNameTextStyle = const TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    color: GRAY_4_COLOR,
  );

  final productNameTextStyle = const TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    color: GRAY_4_COLOR,
  );

  final priceTextStyle = const TextStyle(
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
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
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
      width: 90,
      height: 90,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        border: Border.all(
            width: 1.0,
            color: GRAY_0_COLOR
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: (widget.data.imgUrl == null)
          ? const Icon(Icons.question_mark, size: 30,)
          : Image.network(widget.data.imgUrl!)
    );
  }

  /// 제품 정보(cloumn: 브랜드명, 제품명, 가격) 위젯 구현 메소드
  Widget renderProductInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.data.nickname, style: brandNameTextStyle,),
          Text(widget.data.name, style: productNameTextStyle,),
          Text('${widget.data.price}원', style: priceTextStyle,),
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
    print('검색 결과 중 아이템 하나 탭함');
    // Navigator.of(context).push(MaterialPageRoute(builder: (_) => ProductDetailScreen(category: widget.category, productId: widget.productId,)));
  }
}
