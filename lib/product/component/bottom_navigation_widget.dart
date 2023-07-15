import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/const/colors.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  State<BottomNavigationWidget> createState() => _State();
}

class _State extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(bottom: 20),
      height: 90,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          renderLikeButton(),
          renderOrderButton(),
        ],
      ),
    );
  }

  /// rendering methods
  Widget renderLikeButton() {
    final likeCntStyle = TextStyle(
        fontSize: 12,
        color: PINK_COLOR,
        fontWeight: FontWeight.w500
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 35,
          width: 40,
          child: IconButton(
              onPressed: didTapLikeButton,
              icon: SvgPicture.asset("asset/icons/common/favorite_border.fill.svg")
          ),
        ),
        Text('23', style: likeCntStyle,),
      ],
    );
  }

  Widget renderOrderButton() {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 8),
      margin: EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      width: MediaQuery.of(context).size.width-90,
      child: ElevatedButton(
        onPressed: didTapOrderButton,
        child: Text("1:1 요청하기", style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14
        ),),
        style: ElevatedButton.styleFrom(
            backgroundColor: PURPLE_COLOR,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            elevation: 0
        ),
      ),
    );
  }

  /// event methods
  void didTapLikeButton() {
    print("didTapLikeButton");
  }

  void didTapOrderButton() {
    print("didTapOrderButton");
  }
}