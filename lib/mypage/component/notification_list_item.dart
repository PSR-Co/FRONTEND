//알림 목록
import 'dart:ffi';

class Notifications{
  String date;
  List<NotiList> notiList; //해당 일자에 온 알림 리스트

  Notifications(this.date, this.notiList);
}

class NotiList{
  String productName;
  String content;

  NotiList(this.productName, this.content);
}

