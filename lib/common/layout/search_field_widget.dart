import 'package:flutter/material.dart';

class SearchDetailScreen extends StatefulWidget {
  const SearchDetailScreen({Key? key}) : super(key: key);

  @override
  State<SearchDetailScreen> createState() => _SearchDetailScreenState();
}

class _SearchDetailScreenState extends State<SearchDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('검색 화면'),
      ),
    );
  }
}
