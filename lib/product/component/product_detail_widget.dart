import 'package:flutter/material.dart';

import '../../common/const/colors.dart';

class ProductDetailWidget extends StatefulWidget {
  final String description;

  const ProductDetailWidget({
    required this.description,
    Key? key
  }) : super(key: key);

  @override
  State<ProductDetailWidget> createState() => _ProductDetailWidgetState();
}

class _ProductDetailWidgetState extends State<ProductDetailWidget> {
  bool isFolded = true;
  final double FOLDED_HEIGHT = 200.0;
  final double NOT_FOLDED_HEIGHT = 1000.0;

  @override
  Widget build(BuildContext context) {
    final BoxDecoration containerDeco = BoxDecoration(
      borderRadius: (widget.description.length > 100)
          ? const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
          : BorderRadius.zero,
      color: GRAY_0_COLOR,
    );

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      height: isFolded ? getContainerHeight() : NOT_FOLDED_HEIGHT,  // TODO: 상세내용에 따른 동적높이 구현
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
        margin: const EdgeInsets.all(10),
        child: Text(widget.description)
    );
  }

  Widget renderingMoreViewButton() {
     return (widget.description.length > 100)
        ? Positioned(
            left: 0, right: 0, bottom: 0,
            height: 40,
            child: OutlinedButton(
                onPressed: didTapViewMoreButton,
                style: OutlinedButton.styleFrom(
                    side: const BorderSide(width: 1, color: PURPLE_COLOR),
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    )
                ),
                child: Text(isFolded ? "상세설명 더보기 \u{0203A}" : "상세설명 접기", style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: PURPLE_COLOR
                ),)
            )
        )
        : const SizedBox(height: 0,);
  }

  /// event methods
  void didTapViewMoreButton() {
    setState(() {
      isFolded = !isFolded;
    });
  }

  /// helper methods
  double getContainerHeight() { return (widget.description.length / 25 + 1) * 50; }
}
