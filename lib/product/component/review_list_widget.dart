import 'package:flutter/material.dart';
import 'package:psr/product/component/review_list_item.dart';

import '../../model/data/shopping/review_model.dart';

class ReviewListWidget extends StatefulWidget {
  final List<Review> reviewList;

  const ReviewListWidget({
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
      return Container(
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
      );
    } else {
      return const SizedBox(height: 0, width: 0,);
    }

  }
}
