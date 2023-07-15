import 'package:flutter/material.dart';
import 'package:psr/common/const/colors.dart';

import '../../common/layout/default_appbar_layout.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarLayout(titleText: '리뷰',),
      body: renderBody(),
    );
  }

  /// rendering methods
  Widget renderBody() {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                renderReviewItem(),
                renderDivider()
              ],
            );
          }
      ),
    );
  }

  Widget renderReviewItem() {
    return Container(
      color: Colors.white,
      height: 300,
    );
  }

  Widget renderDivider() {
    return Container(
      height: 1.5,
      width: MediaQuery.of(context).size.width-30,
      color: GRAY_1_COLOR.withOpacity(0.5),
      padding: EdgeInsets.symmetric(horizontal: 15),
    );
  }
}
