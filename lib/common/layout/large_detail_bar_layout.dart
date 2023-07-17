import 'package:flutter/material.dart';
import '../const/colors.dart';

class LargeDetailBar extends StatefulWidget {
  String title;
  LargeDetailBar({required this.title, Key? key}):super(key: key);

  @override
  State<LargeDetailBar> createState() => LargeDetailBarState();
}

class LargeDetailBarState extends State<LargeDetailBar> {

  final TextStyle headerTextStyle = const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 17.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(widget.title, style: headerTextStyle,),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_forward_ios, size: 20.0,),
            padding: EdgeInsets.only(bottom: 2.0),
            constraints: BoxConstraints(),
          )
        ],
      ),
    );
  }
}
