import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:psr/presenter/shopping/shopping_service.dart';

import '../../common/const/colors.dart';
import '../../order/view/add_order_screen.dart';

class BottomNavigationWidget extends StatefulWidget {
  final bool isOwner;
  final int numOfLike;
  final int productId;
  final String? productImgUrl;
  final String productName;
  final bool isLiked;

  const BottomNavigationWidget({
    required this.isOwner,
    required this.numOfLike,
    required this.productId,
    required this.productImgUrl,
    required this.productName,
    required this.isLiked,
    Key? key
  }) : super(key: key);

  @override
  State<BottomNavigationWidget> createState() => _State();
}

class _State extends State<BottomNavigationWidget> {

  bool isLiked = false;
  int numOfLike = 0;

  @override
  void initState() {
    isLiked = widget.isLiked;
    numOfLike = widget.numOfLike;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(bottom: 20),
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

  /// rendering methods
  Widget renderLikeButton() {
    TextStyle likeCntStyle = TextStyle(
        fontSize: 12,
        color: (isLiked) ? PINK_COLOR : GRAY_3_COLOR,
        fontWeight: FontWeight.w500
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 35,
          width: 40,
          child: IconButton(
              onPressed: didTapLikeButton,
              icon: (isLiked)
                  ? SvgPicture.asset("asset/icons/common/favorite_border.fill.svg")
                  : SvgPicture.asset("asset/icons/common/favorite_border.svg")
          ),
        ),
        Text('$numOfLike', style: likeCntStyle,),
      ],
    );
  }

  Widget renderOrderButton() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      width: MediaQuery.of(context).size.width-90,
      child: ElevatedButton(
        onPressed: didTapOrderButton,
        style: ElevatedButton.styleFrom(
            backgroundColor: PURPLE_COLOR,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            elevation: 0
        ),
        child: const Text("1:1 요청하기", style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14
        ),),
      ),
    );
  }

  /// event methods
  void didTapLikeButton() async {
    final result = await ShoppingService().likeProduct(widget.productId);
    if (result) {
      setState(() {
        isLiked = !isLiked;
        numOfLike += isLiked ? 1 : -1;
        Fluttertoast.showToast(msg: (isLiked) ? '상품을 찜하였습니다!' : '상품 찜을 해제하였습니다!');
      });
    }
    else { Fluttertoast.showToast(msg: '네트워크 오류가 발생하였습니다.'); }


  }

  void didTapOrderButton() {
    if (widget.isOwner) {
      Fluttertoast.showToast(msg: '본인의 상품에 요청을 작성할 수 없습니다.');
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder:
          (_) => AddOrderScreen(
        productId: widget.productId,
        productImgUrl: widget.productImgUrl,
        productName: widget.productName,
      )
      ));
    }

  }
}
