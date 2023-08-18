import 'package:flutter/material.dart';
import 'package:psr/common/const/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductImgPageViewWidget extends StatefulWidget {

  final BuildContext context;
  final List<String> imgKeyList;

  const ProductImgPageViewWidget({
    required this.imgKeyList,
    required this.context,
    Key? key
  }) : super(key: key);

  @override
  State<ProductImgPageViewWidget> createState() => _ProductImgPageViewWidgetState();
}

class _ProductImgPageViewWidgetState extends State<ProductImgPageViewWidget> {
  final PageController controller = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return (widget.imgKeyList.isEmpty)
      ? SizedBox(
        width: MediaQuery.of(widget.context).size.width,
        height: MediaQuery.of(widget.context).size.width,
        child: const Center(
          child: Text('이미지 없음'),
        ),
      )
      : Column(
      children: [
        SizedBox(
          width: MediaQuery.of(widget.context).size.width,
          height: MediaQuery.of(widget.context).size.width,
          child: PageView.builder(
            controller: controller,
            itemBuilder: (BuildContext context, int index) {
              return Image.network(
                widget.imgKeyList.elementAt(index),
                fit: BoxFit.contain,
              );
            }
          ),
        ),
        SmoothPageIndicator(
            controller: controller,
            count: widget.imgKeyList.length,
            effect: const ScrollingDotsEffect(
              activeDotColor: GRAY_2_COLOR,
              activeDotScale: 1,
              dotColor: GRAY_0_COLOR,
              dotWidth: 7,
              dotHeight: 7,
              spacing: 4
            ),
        ),
      ],
    );
  }
}
