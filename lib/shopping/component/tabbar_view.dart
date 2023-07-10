import 'package:flutter/material.dart';

class ShoppingTabBarView extends StatefulWidget {
  final String categoryName;

  const ShoppingTabBarView({
    required this.categoryName,
    Key? key
  }) : super(key: key);

  @override
  State<ShoppingTabBarView> createState() => _ShoppingTabBarViewState();
}

class _ShoppingTabBarViewState extends State<ShoppingTabBarView> {
  final titleStyle = TextStyle(
    color: Colors.black,
    fontSize: 18.0,
    fontWeight: FontWeight.w500
  );

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        renderTitle('📌 인기목록'),
        SizedBox(
          height: 260,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                color: Colors.green,
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                width: 170,
              ),
              Container(
                color: Colors.green,
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                width: 170,
              ),
              Container(
                color: Colors.green,
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                width: 170,
              ),
              Container(
                color: Colors.green,
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                width: 170,
              ),
            ],
          ),
        ),

        SizedBox(height: 4.0),

        renderTitle(widget.categoryName),

        Column(
          children: [
            Container(
              color: Colors.green,
              margin: EdgeInsets.symmetric(vertical: 10.0),
              height: 90,
            ),
            Container(
              color: Colors.green,
              margin: EdgeInsets.symmetric(vertical: 10.0),
              height: 90,
            ),
            Container(
              color: Colors.green,
              margin: EdgeInsets.symmetric(vertical: 10.0),
              height: 90,
            ),
            Container(
              color: Colors.green,
              margin: EdgeInsets.symmetric(vertical: 10.0),
              height: 90,
            ),
            Container(
              color: Colors.green,
              margin: EdgeInsets.symmetric(vertical: 10.0),
              height: 90,
            ),
            Container(
              color: Colors.green,
              margin: EdgeInsets.symmetric(vertical: 10.0),
              height: 90,
            ),
          ],
        )
      ],
    );
  }

  Widget renderTitle(String titleStr) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      color: Colors.yellow,
      child: Text(titleStr, style: titleStyle),
    );
  }
}
