import 'package:flutter/material.dart';
import 'package:psr/product/view/seller_profile_screen.dart';

import '../../common/const/colors.dart';

class SellerInfoWidget extends StatefulWidget {
  final String sellerName;

  const SellerInfoWidget({
    required this.sellerName,
    Key? key
  }) : super(key: key);

  @override
  State<SellerInfoWidget> createState() => _SellerInfoWidgetState();
}

class _SellerInfoWidgetState extends State<SellerInfoWidget> {
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
            onPressed: didTapSellerName,
            child: Text(widget.sellerName, style: sellerNameStyle,),
            style: TextButton.styleFrom(
              padding: EdgeInsets.only(left: 8),
              // backgroundColor: Colors.red
            ),
          ),
          SizedBox(
            width: 10,
            child: IconButton(
              onPressed: didTapSellerName,
              icon: Icon(Icons.chevron_right, color: GRAY_2_COLOR,),
            ),
          ),
        ],
      ),
    );
  }

  void didTapSellerName() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => SellerProfileScreen()));
  }
}
