import 'package:flutter/material.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';

class SellerProfileScreen extends StatefulWidget {
  const SellerProfileScreen({Key? key}) : super(key: key);

  @override
  State<SellerProfileScreen> createState() => _SellerProfileScreenState();
}

class _SellerProfileScreenState extends State<SellerProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarLayout(titleText: '프로필',),
      body: renderBody(),
    );
  }

  Widget renderBody() {
    return Center(
      child: Text("판매자 프로필 화면"),
    );
  }
}
