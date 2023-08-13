import 'package:flutter/material.dart';

class ReviewImgListView extends StatefulWidget {
  final List<String> imgUrlList;

  const ReviewImgListView({
    required this.imgUrlList,
    Key? key
  }) : super(key: key);

  @override
  State<ReviewImgListView> createState() => _ReviewImgListViewState();
}

class _ReviewImgListViewState extends State<ReviewImgListView> {
  @override
  Widget build(BuildContext context) {
    return (widget.imgUrlList.isEmpty)
      ? const SizedBox(width: 0, height: 10,)
      : Container(
          height: 150,
          width: MediaQuery.of(context).size.width - 85,
          margin: const EdgeInsets.only(left: 14, top: 10),
          child:
          ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.only(right: 5),
                child: Image.asset('asset/images/product_sample.png', fit: BoxFit.cover, width: 144, height: 144,),
              );
            },
          ),
        );
  }
}
