import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:psr/common/const/constants.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';
import 'package:psr/common/layout/large_detail_bar_layout.dart';
import 'package:psr/common/view/body_tab.dart';
import 'package:psr/mypage/component/order_list_item.dart';
import 'package:psr/review/view/add_review_screen.dart';
import 'package:psr/review/view/review_screen.dart';
import '../../common/const/colors.dart';
import 'detail_order_screen.dart';

class OrderListScreen extends StatefulWidget {
  List<SellProduct> sellProductList;
  List<OrderProduct> orderProductList;
  OrderListScreen({required this.sellProductList, required this.orderProductList, Key? key}): super(key: key);

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  final TextStyle ordererNameTextStyle = const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: GRAY_4_COLOR);
  final TextStyle productNameTextStyle = const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  final TextStyle dateTextStyle = const TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400, color: GRAY_2_COLOR);
  final TextStyle dropdownBtnTextStyle = const TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500, color: GRAY_3_COLOR);
  final TextStyle dropdownSelectedBtnTextStyle = const TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500, color: PURPLE_COLOR);
  final TextStyle reviewBtnTextStyle = const TextStyle(fontSize: 13.0, fontWeight: FontWeight.w700, color: PURPLE_COLOR, decoration: TextDecoration.underline);

  List<String> dropDownBtnTitle = ['요청대기','진행중','진행완료','요청취소'];
  String isReviewed = "리뷰 쓰기";
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: BodyTab(titleList: ORDER_LIST_TAB, tabTitle: DefaultAppBarLayout(titleText: '요청 목록'), tabBarViewChild: [sellProductView(widget.sellProductList), orderProductView(widget.orderProductList)]),
      ),
    );
  }

  Widget sellProductView(List<SellProduct> sellProductList){
    return orderView(
        Container(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: sellProductList.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index){
                  return ListTile(
                      onTap: () {},
                      title: Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                children: [
                                  Container(child: Text('요청자 ${sellProductList[index].ordererName}님', style: ordererNameTextStyle,)),
                                  Container(child: Text(sellProductList[index].orderDate, style: dateTextStyle,)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0, bottom: 30.0),
                              child: LargeDetailBar(
///판매자 상세 화면 + 요청대기
                                  title: sellProductList[index].productName,
                                  moveTo: DetailOrderScreen(selectedValue: selectedValue, orderDate: sellProductList[index].orderDate, productName: sellProductList[index].productName, btnOption1: '진행완료', btnOption2: '진행취소',)),
///구매자 상세 화면
                              // LargeDetailBar(
                              //     title: sellProductList[index].productName,
                              //     moveTo: DetailOrderScreen(selectedValue: selectedValue, orderDate: sellProductList[index].orderDate, productName: sellProductList[index].productName, btnOption1: '요청수정', btnOption2: '요청취소',)),
///판매자 상세 화면 + 진행중
                              // LargeDetailBar(
                              //     title: sellProductList[index].productName,
                              //     moveTo: DetailOrderScreen(selectedValue: selectedValue, orderDate: sellProductList[index].orderDate, productName: sellProductList[index].productName, btnOption1: '진행완료', btnOption2: '진행취소',)),

                            )
                          ],
                        ),
                      )
                  );
                }
            )
        )
    );
  }

  Widget orderProductView(List<OrderProduct> orderProductList){
    return orderView(
        Container(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: orderProductList.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index){
                  Order orderList = Order(orderProductList[index].sellerName, orderProductList[index].productIdx, orderProductList[index].productName, "", orderProductList[index].orderDate, false);
                  if(orderList.isReviewed){
                    setState(() {isReviewed = "리뷰 보기";});
                  }
                  return ListTile(
                      onTap: () {},
                      title: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                children: [
                                  Container(child: Text('요청자 ${orderProductList[index].sellerName}님', style: ordererNameTextStyle,)),
                                  Container(child: Text('${orderProductList[index].orderDate}', style: dateTextStyle,)),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top:5.0 ,bottom: 30.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('${orderProductList[index].productName}', style: productNameTextStyle,),
                                  Container(
                                    child: TextButton(
                                      style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero, tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                                        onPressed: () {
                                          if (isReviewed == "리뷰 쓰기") {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => AddReviewScreen(sellerName: orderProductList[index].sellerName, productName: orderProductList[index].productName, productImgKey: orderProductList[index].productImgKey)));
                                          }else{
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewScreen()));
                                          }
                                        },
                                        child: Text(isReviewed, style: reviewBtnTextStyle,),),
                                  )
                                ],
                              ),
                            )
                          ]
                        )
                      )
                  );
                }
            )
        )
    );
  }

  Widget orderView(Widget child) {
    return Container(
        child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 20.0, bottom: 10.0, top: 5.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    hint: Text('요청대기', style: dropdownBtnTextStyle,),
                      value: selectedValue,
                      items: dropDownBtnTitle.map((String item) =>
                          DropdownMenuItem(value: item, child: Text(item, style: dropdownBtnTextStyle,))
                      ).toList(),
                      onChanged: (value) {
                        setState(() {setSelectedValue(value!);});
                        print(selectedValue);
                      },
                    dropdownStyleData: DropdownStyleData(
                      width: 80.0,
                      elevation: 0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: PURPLE_COLOR, width: 1)
                      ),
                      useSafeArea: true,
                      padding: EdgeInsets.zero,

                    ),
                    iconStyleData: IconStyleData(
                      icon: SvgPicture.asset('asset/icons/common/toggle_down.svg'),
                      openMenuIcon: SvgPicture.asset('asset/icons/common/toggle_up.svg')
                    ),
                  ),
                ),
              ),
              child
            ]
        )
    );
  }
  setSelectedValue(String value){
    setState(() {
      selectedValue = value;
    });
  }
}
