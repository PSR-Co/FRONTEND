import 'package:flutter/material.dart';
import 'package:psr/model/data/shopping/review_preview_model.dart';
import 'package:psr/product/component/review_list_item.dart';

import '../../review/view/review_screen.dart';

class ReviewListWidget extends StatefulWidget {
  final int productId;
  final List<ReviewPreview> reviewList;

  const ReviewListWidget({
    required this.productId,
    required this.reviewList,
    Key? key
  }) : super(key: key);

  @override
  State<ReviewListWidget> createState() => _ReviewListWidgetState();
}

class _ReviewListWidgetState extends State<ReviewListWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.reviewList!.isNotEmpty) {
      return GestureDetector(
        onTap: didTapReview,
        child: Container(
            margin: const EdgeInsets.only(top: 10, left: 13, bottom: 18),
            height: 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.reviewList!.length,
                itemBuilder: (BuildContext context, int index) {
                  return ReviewItem(
                    avgOfRating: widget.reviewList![index].rating,
                    detail: widget.reviewList![index].content,
                    imgUrl: widget.reviewList![index].imgUrl,
                  );
                })
        ),
      );
    } else {
      return const SizedBox(height: 0, width: 0,);
    }
  }

  void didTapReview() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => ReviewScreen(productId: widget.productId,)));
  }
}
