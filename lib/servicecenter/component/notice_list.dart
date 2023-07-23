class Notice {
  List? noticeLists;
  String title;
  String date;

  Notice(this.noticeLists, this.title, this.date);
}

class DetailNotice {
  String title;
  String date;
  String content;
  String ?imgKey;

  DetailNotice(this.title, this.date, this.content, this.imgKey);
}