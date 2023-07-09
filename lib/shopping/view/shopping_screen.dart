import 'package:flutter/material.dart';

import '../../common/layout/main_appbar_layout.dart';

class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainAppBarLayout(widget: renderBody(), context: context,),
    );
  }

  Widget renderBody() {
    return Center(
      child: Text('쇼핑 화면'),
    );
  }
}
