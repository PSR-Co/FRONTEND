import 'package:flutter/material.dart';
import 'package:psr/common/const/colors.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';

class SellerProfileScreen extends StatefulWidget {
  const SellerProfileScreen({Key? key}) : super(key: key);

  @override
  State<SellerProfileScreen> createState() => _SellerProfileScreenState();
}

class _SellerProfileScreenState extends State<SellerProfileScreen> {
  static const PROFILE_IMG_SIZE = 64.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarLayout(titleText: '프로필',),
      body: renderBody(),
    );
  }

  Widget renderBody() {
    return Column(
      children: [
        renderSellerInfo(),
        SizedBox(height: 5,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              padding: EdgeInsets.only(left: 15, top: 20, bottom: 15),
              child: Text('글 목록', style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.black,
            ),
            ),
            // ListView.builder(
            //   itemCount: 10,
            //     itemBuilder: (BuildContext context, int index) {
            //       return Container(
            //         height: 100,
            //       );
            //     }
            ),
          ],
        ),

      ],
    );
  }

  Widget renderSellerInfo() {
    return Container(
      height: 110,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(PROFILE_IMG_SIZE/2),
              child: Image.asset('asset/images/profile_img_sample.jpg', fit: BoxFit.cover, width: PROFILE_IMG_SIZE,),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              renderSellerRole(),
              renderSellerName(),
            ],
          ),
        ],
      ),
    );
  }

  Widget renderSellerRole() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
      margin: EdgeInsets.only(top: 30, bottom: 8, left: 10),
      child: Text('사업자', style: TextStyle(
        color: PINK_COLOR,
        fontSize: 12,
        fontWeight: FontWeight.w700
      ),),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: PINK_COLOR.withOpacity(0.2),
      ),
    );
  }

  Widget renderSellerName() {
    final nameStyle = TextStyle(
      fontSize: 14,
      color: Colors.black,
      fontWeight: FontWeight.w500
    );

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Text('루시 앤플 셀러', style: nameStyle,)
    );
  }
}
