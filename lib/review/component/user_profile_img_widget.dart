import 'package:flutter/material.dart';

class RoundedUserProfileImg extends StatefulWidget {
  final double width;
  final double height;
  final String? imgKey;

  const RoundedUserProfileImg({
    required this.width,
    required this.height,
    required this.imgKey,
    Key? key
  }) : super(key: key);

  @override
  State<RoundedUserProfileImg> createState() => _RoundedUserProfileImgState();
}

class _RoundedUserProfileImgState extends State<RoundedUserProfileImg> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.width/2),
        child: (widget.imgKey == null)
            ? Image.asset('asset/images/profile_img_sample.jpg', width: widget.width, height: widget.height,)
            : Image.network(widget.imgKey!, width: widget.width, height: widget.height,)
      ),
    );
  }
}
