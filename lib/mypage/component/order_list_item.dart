//요청 받은 상품
class SellProduct{
  String ordererImg;
  String ordererName;
  String productImg;
  String productName;
  String orderDate;

  SellProduct(this.ordererImg, this.ordererName, this.productImg, this.productName, this.orderDate);
}
//요청한 상품
class OrderProduct{
  String sellerImg;
  String sellerName;
  String productImg;
  String productName;
  String orderDate;

  OrderProduct(this.sellerImg, this.sellerName, this.productImg, this.productName, this.orderDate);

}