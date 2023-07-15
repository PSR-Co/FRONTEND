import 'package:flutter/material.dart';

class SearchFieldWidget extends StatefulWidget {
  const SearchFieldWidget({Key? key}) : super(key: key);

  @override
  State<SearchFieldWidget> createState() => _SearchFieldWidgetState();
}

class _SearchFieldWidgetState extends State<SearchFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('검색 화면'),
      ),
    );
  }
}
