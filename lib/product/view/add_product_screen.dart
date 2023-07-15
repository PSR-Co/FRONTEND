import 'package:flutter/material.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';
import 'package:psr/common/layout/purple_bottom_button.dart';

import '../../common/const/colors.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBarLayout(titleText: '상품 추가',),
      body: renderBody(),
      bottomNavigationBar: PurpleBottomButton(title: '등록하기', onPressed: didTapAddButton,),
    );
  }

  Widget renderBody() {
    return ListView(
      children: [

      ],
    );
  }

  /// event methods
  void didTapAddButton() {
    print("didTapAddButton");
  }

}
