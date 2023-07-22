import 'package:flutter/material.dart';
import 'package:psr/myinfo/view/change_profile_screen.dart';
import '../const/colors.dart';

class DetailBar extends StatefulWidget {
  String title;
  Widget moveTo;
  DetailBar({required this.title, required this.moveTo, Key? key}):super(key: key);

  @override
  State<DetailBar> createState() => DetailBarState();
}

class DetailBarState extends State<DetailBar> {

  final TextStyle headerTextStyle = const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(widget.title, style: headerTextStyle,),
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>widget.moveTo));
            },
            icon: const Icon(Icons.arrow_forward_ios, size: 16.0,),
            padding: EdgeInsets.only(right: 17.0, bottom: 5.0),
            constraints: BoxConstraints(),
          )
        ],
      ),
    );
  }
}
