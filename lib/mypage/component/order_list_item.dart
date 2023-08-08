///요청 받은/한 상품 목록
///productId는 임시로 String으로 해둠
class Order{
  String userName;
  String? productIdx;
  String productName;
  String? orderIdx;
  String orderDate;
  bool isReviewed;

  Order(this.userName, this.productIdx, this.productName, this.orderIdx, this.orderDate, this.isReviewed);
}

///하나로 합쳐서 받을 지, 따로 받을 지 아직 결정 못 함
//요청 받은 상품
class SellProduct{
  String ordererName;
  String ordererProfileImgKey;
  String? productIdx;
  String productImgKey;
  String productName;
  String orderDate;

  SellProduct(this.ordererName, this.ordererProfileImgKey, this.productIdx,this.productName,this.productImgKey,  this.orderDate);
}
//요청한 상품
class OrderProduct{
  String sellerProfileImgKey;
  String sellerName;
  String? productIdx;
  String productImgKey;
  String productName;
  String orderDate;

  OrderProduct(this.sellerName, this.sellerProfileImgKey, this.productIdx, this.productName, this.productImgKey,this.orderDate);

}