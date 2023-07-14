import 'package:flutter/material.dart';

import '../../common/const/colors.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({Key? key}) : super(key: key);

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  bool isFolded = true;
  final double FOLDED_HEIGHT = 200.0;
  final double NOT_FOLDED_HEIGHT = 1000.0;

  final BoxDecoration containerDeco = BoxDecoration(
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
    color: GRAY_0_COLOR,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      height: isFolded ? FOLDED_HEIGHT : NOT_FOLDED_HEIGHT,  // TODO: 상세내용에 따른 동적높이 구현
      decoration: containerDeco,
      child:
      Stack(
          children: [
            renderingDetailView(),
            renderingMoreViewButton(),
          ]
      ),
    );
  }

  /// rendering methods
  Widget renderingDetailView() {
    return Container(
        margin: EdgeInsets.all(10),
        child: Text("상세설명 상세설명 상세설명 상세설명 상세설명 상세설명 상세설명 상세설명 상세설명 상세설명 상세설명 상세설명 상세설명 상세설명 상세설명")
    );
  }

  Widget renderingMoreViewButton() {
    return Positioned(
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
    );
  }

  /// event methods
  void didTapViewMoreButton() {
    setState(() {
      isFolded = !isFolded;
    });
  }
}
