import 'package:flutter/material.dart';
import 'package:psr/product/view/seller_profile_screen.dart';

import '../../common/const/colors.dart';

class SellerInfoWidget extends StatefulWidget {
  final String sellerName;
  final int sellerId;

  const SellerInfoWidget({
    required this.sellerName,
    required this.sellerId,
    Key? key
  }) : super(key: key);

  @override
  State<SellerInfoWidget> createState() => _SellerInfoWidgetState();
}

class _SellerInfoWidgetState extends State<SellerInfoWidget> {
  final sellerNameStyle = const TextStyle(
      fontSize: 15,
      color: GRAY_2_COLOR,
      fontWeight: FontWeight.w500
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            onPressed: didTapSellerName,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.only(left: 8),
            ),
            child: Text(widget.sellerName, style: sellerNameStyle,),
          ),
          SizedBox(
            width: 10,
            child: IconButton(
              onPressed: didTapSellerName,
              icon: const Icon(Icons.chevron_right, color: GRAY_2_COLOR,),
            ),
          ),
        ],
      ),
    );
  }

  void didTapSellerName() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => SellerProfileScreen(userId: widget.sellerId,)));
  }
}
