import 'package:flutter/material.dart';

import '../../common/const/colors.dart';

class SellerInfoView extends StatefulWidget {
  final String sellerName;

  const SellerInfoView({
    required this.sellerName,
    Key? key
  }) : super(key: key);

  @override
  State<SellerInfoView> createState() => _SellerInfoViewState();
}

class _SellerInfoViewState extends State<SellerInfoView> {
  final sellerNameStyle = TextStyle(
      fontSize: 15,
      color: GRAY_2_COLOR,
      fontWeight: FontWeight.w500
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 11),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            onPressed: (){
              // TODO: 판매자 프로필 화면으로 전환
            },
            child: Text(widget.sellerName, style: sellerNameStyle,),
            style: TextButton.styleFrom(
              padding: EdgeInsets.only(left: 8),
              // backgroundColor: Colors.red
            ),
          ),
          SizedBox(
            width: 10,
            child: IconButton(
              onPressed: (){
                // TODO: 판매자 프로필 화면으로 전환
                print("did tap icon btn");
              },
              icon: Icon(Icons.chevron_right, color: GRAY_2_COLOR,),
            ),
          ),
        ],
      ),
    );
  }
}
