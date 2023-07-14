import 'package:flutter/material.dart';
import '../../common/const/colors.dart';

class TitleView extends StatefulWidget {
  String title;
  TitleView({required this.title, Key? key}):super(key: key);

  @override
  State<TitleView> createState() => TitleViewState();
}

class TitleViewState extends State<TitleView> {

  final TextStyle headerTextStyle = const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(widget.title, style: headerTextStyle,),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_forward_ios, size: 15.0,),
          padding: EdgeInsets.only(bottom: 2.0),
        )
      ],
    );
  }
}
