import 'package:flutter/material.dart';

class CategoryListItem extends StatefulWidget {
  const CategoryListItem({Key? key}) : super(key: key);

  @override
  State<CategoryListItem> createState() => _CategoryListItemState();
}

class _CategoryListItemState extends State<CategoryListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      height: 90,
    );
  }
}
