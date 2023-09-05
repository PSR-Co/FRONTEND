import 'package:flutter/material.dart';
import 'package:psr/model/data/review/review_model.dart';
import 'package:psr/presenter/review/review_service.dart';

import '../../common/layout/default_appbar_layout.dart';
import '../component/review_item_widget.dart';

class ReviewScreen extends StatefulWidget {
  final int productId;

  const ReviewScreen({
    required this.productId,
    Key? key
  }) : super(key: key);

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {

  bool isReviewFolded = true;
  ReviewListResponseModel? data;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: fetchData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return Scaffold(
            appBar: const DefaultAppBarLayout(titleText: '리뷰',),
            body: renderBody(snapshot.hasError),
          );
        }
    );
  }

  /// rendering methods
  Widget renderBody(bool hasError) {
    return Container(
      color: Colors.white,
      child: (data == null)
          ? const Center(
              child: Text('리뷰 정보를 불러오지 못하였습니다.'),
            )
          : ListView.builder(
              itemCount: data!.data.content.length,  // for test
              itemBuilder: (BuildContext context, int index) {
                return ReviewItemWidget(review: data!.data.content[index],);
              }
            ),
    );
  }

  Future<bool> fetchData() async {
    final result = await ReviewService().getReviewListData('${widget.productId}');
    data = ReviewListResponseModel.fromJson(result);
    return (data != null);
  }
}