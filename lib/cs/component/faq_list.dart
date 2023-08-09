class FAQ{
  DetailFAQ faqType;

  FAQ(this.faqType);
}

class DetailFAQ{
  String faqType;
  String title;
  String content;

  DetailFAQ(this.faqType, this.title, this.content);
}