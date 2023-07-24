
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:psr/myinfo/view/myinfo_screen.dart';
import 'package:psr/mypage/view/likelist_screen.dart';
import 'package:psr/mypage/view/mypost_screen.dart';
import 'package:psr/mypage/view/notificationlist_screen.dart';
import 'package:psr/mypage/view/order_list_tab.dart';
import 'package:psr/servicecenter/view/service_center_screen.dart';

import '../../common/const/colors.dart';
import '../../common/layout/division.dart';
import '../component/mypage.dart';
import '../component/order_list_item.dart';

class MypageScreen extends StatefulWidget {
  const MypageScreen({Key? key}) : super(key: key);

  @override
  State<MypageScreen> createState() => _MypageScreenState();
}

class _MypageScreenState extends State<MypageScreen> {
  final TextStyle mypageTitleTextStyle = const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700, color: Colors.black);
  final TextStyle welcomeTextStyle = const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700, color: GRAY_4_COLOR);
  final TextStyle userTypeTextStyle = const TextStyle(fontSize: 13.0, fontWeight: FontWeight.w700, color: PINK_COLOR);
  final TextStyle categoryTextStyle = const TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  final TextStyle listHeaderTextStyle = const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);

  MyPage userDate = 
    MyPage('사업자', 'asset/images/profile_img_sample.jpg', '웨이드에옹',
       [SellProduct("누구게","asset/images/profile_img_sample.jpg","","요청 상품명", "asset/images/product_sample.png","요청일"),
         SellProduct("누구게","asset/images/profile_img_sample.jpg","","요청 상품명", "asset/images/product_sample.png","요청일"),
         SellProduct("누구게","asset/images/profile_img_sample.jpg","","요청 상품명", "asset/images/product_sample.png","요청일"),
       ],
        [OrderProduct("누구게","asset/images/profile_img_sample.jpg","","요청 상품명", "asset/images/product_sample.png","요청일"),
          OrderProduct("누구게","asset/images/profile_img_sample.jpg","","요청 상품명", "asset/images/product_sample.png","요청일"),
          OrderProduct("누구게","asset/images/profile_img_sample.jpg","","요청 상품명", "asset/images/product_sample.png","요청일"),
        ]);
  MyPage adminDate = 
    MyPage('관리자', 'asset/images/profile_img_sample.jpg', '관리자에옹',
        [SellProduct("누구게","asset/images/profile_img_sample.jpg","","요청 상품명", "asset/images/product_sample.png","요청일"),
          SellProduct("누구게","asset/images/profile_img_sample.jpg","","요청 상품명", "asset/images/product_sample.png","요청일"),
          SellProduct("누구게","asset/images/profile_img_sample.jpg","","요청 상품명", "asset/images/product_sample.png","요청일"),
        ],
        [OrderProduct("누구게","asset/images/profile_img_sample.jpg","","요청 상품명", "asset/images/product_sample.png","요청일"),
          OrderProduct("누구게","asset/images/profile_img_sample.jpg","","요청 상품명", "asset/images/product_sample.png","요청일"),
          OrderProduct("누구게","asset/images/profile_img_sample.jpg","","요청 상품명", "asset/images/product_sample.png","요청일"),
        ]);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
            children: [
              myPageHeader(),
              profile(),
              category(),
              Padding(
                padding: const EdgeInsets.only(top:15.0),
                child: Division(),
              ),
              Expanded(child: Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: OrderListTab(myPageData: userDate)
              )),
            ],
          )
        ),
      ),
    );
  }

  Widget myPageHeader(){
    return SizedBox(
      child: Container(
        margin: EdgeInsets.fromLTRB(17.0, 5.0, 17.0, 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("마이페이지", style: mypageTitleTextStyle,),
            Spacer(flex: 2,),
            IconButton(onPressed: (){Navigator.push(context,
                MaterialPageRoute(builder: (context) => NotificationListScreen()));}, icon: SvgPicture.asset("asset/icons/common/bell.svg"),),
            IconButton(onPressed: (){Navigator.push(context,
                MaterialPageRoute(builder: (context) => LikeListScreen()));}, icon: SvgPicture.asset("asset/icons/common/filled_heart.svg"), padding: EdgeInsets.only(right: 0.0),constraints: const BoxConstraints(),),
          ],
        ),
      ),
    );
  }

  Widget profile() {
    return SizedBox(
      height: 120.0,
      child: Container(
        margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 20.0),
        height: 90.0,
        child: Row(
          children: [
            ClipOval(
              child: Image.asset("asset/images/default_profile.png", width: 90.0, height: 90.0, ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${userDate.nickname}님 안녕하세요!", style: welcomeTextStyle,),
                  Container(
                    width: 55.0, height: 25.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: PINK_COLOR_20, borderRadius: BorderRadius.all(Radius.circular(12.0)) ),
                    child: Text("${userDate.userType}", style: userTypeTextStyle,),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget category(){
    return Container(
      margin: EdgeInsets.fromLTRB(17.0, 10.0, 17.0, 10.0),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            categoryItem("asset/icons/common/myinfo.svg", "내 정보"),
            categoryItem("asset/icons/common/service_center.svg", "고객센터"),
            categoryItem("asset/icons/common/mypost.svg", "내 게시글")
          ],
        ),
      ),
    );
  }

  Widget categoryItem(String imgName, String categoryName){
    return SizedBox(
      child: Column(
        children: [
          Container(
            width: 55.0, height: 55.0,
            margin: EdgeInsets.only(bottom: 5.0),
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: LIGHT_SHADOW_COLOR, blurRadius: 4.0)],
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.white
            ),
            child: IconButton.outlined(
                onPressed: (){
                  if(categoryName=="내 정보"){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyInfoScreen()));
                  }else if(categoryName=="고객센터"){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ServiceCenterScreen()));
                  }else{
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyPostScreen()));
                  }

                },
                icon: SvgPicture.asset(imgName),
              style: ButtonStyle(),
            ),
          ),
          Text(categoryName, style: categoryTextStyle,),
        ],
      ),
    );
  }
}

