import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:psr/common/const/colors.dart';

import '../../model/data/shopping/shopping_main_model.dart';
import '../../product/view/product_detail_screen.dart';

class PopularListItem extends StatefulWidget {
  final String category;
  final int productId;
  final PopularProduct data;

  const PopularListItem({
    required this.category,
    required this.productId,
    required this.data,
    Key? key
  }) : super(key: key);

  @override
  State<PopularListItem> createState() => _PopularListItemState();
}

class _PopularListItemState extends State<PopularListItem> {
  bool isLiked = false;

  /// TextStyle 정의
  final productNameTextStyle = const TextStyle(
    color: GRAY_4_COLOR,
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
  );

  final itemOrderTextStyle = const TextStyle(
    color: GRAY_4_COLOR,
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
  );

  final priceTextStyle = const TextStyle(
    color: GRAY_4_COLOR,
    fontSize: 15.0,
    fontWeight: FontWeight.w500,
  );

  final reviewPointTextStyle = const TextStyle(
    color: Colors.black,
    fontSize: 11.0,
    fontWeight: FontWeight.w500,
  );

  final reviewCountTextStyle = const TextStyle(
    color: GRAY_2_COLOR,
    fontSize: 11.0,
    fontWeight: FontWeight.w400,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: didTapItem,
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
    );
  }

  /// 제품 이미지 컴포넌트 구현 관련 메소드
  Widget renderProductImageItem() {
    return Stack(
      children: [
        renderProductImage(widget.data.imgUrl),
        renderLikeButton(),
      ],
    );
  }

  Widget renderProductImage(String? imgUrl) {
    return Container(
      width: 160,
      height: 160,
      margin: const EdgeInsets.symmetric(vertical: 2.0),
      decoration: BoxDecoration(
        border: Border.all(
            width: 1.0,
            color: GRAY_0_COLOR
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: (imgUrl == null)
          ? const Icon(Icons.question_mark, color: PURPLE_COLOR, size: 50,)
          : Image.network(imgUrl),
    );
  }

  Widget renderLikeButton() {
    Widget likeIcon;
    if (widget.data.isLike) {
      likeIcon = SvgPicture.asset('asset/icons/common/favorite_border.fill.svg', width: 20, height: 20,);
    } else {
      likeIcon = SvgPicture.asset('asset/icons/common/favorite_border.svg', width: 20, height: 20,);
    }

    return Positioned(
      bottom: 0,
      right: 0,
      child: IconButton(
          onPressed: didTapLikeButton,
          icon: likeIcon
      ),
    );
  }

  /// 제품 순서 구현 메소드
  Widget renderItemOrder() {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3),
        child: Text('${widget.productId}', style: itemOrderTextStyle,)
    );
  }

  /// 구분선 구현 메소드
  Widget renderDivider() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: const Divider(thickness: 1, height: 1,color: GRAY_0_COLOR)
    );
  }

  /// 제품 정보 구현 관련 메소드
  Widget renderProductInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.data.name,
            style: productNameTextStyle,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          Text('${widget.data.price}원', style: priceTextStyle,),
          renderReviewInfo()
        ],
      ),
    );
  }

  Widget renderReviewInfo() {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 3, top: 1),
            child: Icon(Icons.star, color: Color(0xFFFFA939), size: 12.0,),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 2),
            child: Text('${widget.data.avgOfRating}', style: reviewPointTextStyle,),
          ),
          Text('(${widget.data.numOfReview})', style: reviewCountTextStyle,),
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
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => ProductDetailScreen(productId: widget.productId,)));
  }
}
