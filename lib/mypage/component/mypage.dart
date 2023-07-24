import 'package:psr/mypage/component/order_list_item.dart';

class MyPage{
  String userType;
  String profileImg;
  String nickname;
  List<SellProduct> sellList;
  List<OrderProduct> orderList;

  MyPage(this.userType, this.profileImg, this.nickname, this.sellList, this.orderList);

}