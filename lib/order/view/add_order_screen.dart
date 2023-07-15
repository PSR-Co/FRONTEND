import 'package:flutter/material.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';

class AddOrderScreen extends StatefulWidget {
  const AddOrderScreen({Key? key}) : super(key: key);

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarLayout(titleText: '요청하기',),
    );
  }
}
