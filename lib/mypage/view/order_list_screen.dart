import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:psr/common/const/constants.dart';
import 'package:psr/common/layout/circular_progress_indicator.dart';
import 'package:psr/common/layout/large_detail_bar_layout.dart';
import 'package:psr/common/view/body_tab.dart';
import 'package:psr/review/view/add_review_screen.dart';

import '../../common/const/colors.dart';
import '../../model/data/order/order_list_model.dart';
import '../../presenter/order/order_service.dart';
import '../../review/view/review_screen.dart';
import '../component/MoveToDetailOrderScreen.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({Key? key}) : super(key: key);

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  final TextStyle userNameTextStyle = const TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.w400, color: GRAY_4_COLOR);
  final TextStyle productNameTextStyle = const TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  final TextStyle dateTextStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w400, color: GRAY_2_COLOR);
  final TextStyle dropdownBtnTextStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w500, color: GRAY_3_COLOR);
  final TextStyle dropdownSelectedBtnTextStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w500, color: PURPLE_COLOR);
  final TextStyle reviewBtnTextStyle = const TextStyle(
      fontSize: 13.0,
      fontWeight: FontWeight.w700,
      color: PURPLE_COLOR,
      decoration: TextDecoration.underline);
  final TextStyle headerTextStyle = const TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  final titleStyle = const TextStyle(color: Colors.black, fontSize: 17);

  List<String> dropDownBtnTitle = ['요청대기', '진행중', '진행완료', '요청취소'];
  // String isReviewed = "리뷰 쓰기";
  String selectedValue = "";
  String selectedValue1 = "요청대기";
  String selectedValue2 = "요청대기";

  OrderListModel? data;
  List<OrderList> content = [];

  Future<dynamic> fetchData(String type, String? selectedValue) async {
    Map<String, dynamic> queryParameters = {};
    type == 'sell'
        ? queryParameters.addAll({'type': 'sell'})
        : queryParameters.addAll({'type': 'order'});

    switch (selectedValue) {
      case '진행중':
        queryParameters.addAll({'status': '진행중'});
        break;
      case '진행완료':
        queryParameters.addAll({'status': '진행완료'});
        break;
      case '요청취소':
        queryParameters.addAll({'status': '요청취소'});
        break;
      case '요청대기':
        queryParameters.addAll({'status': '요청대기'});
        break;
      default:
        break;
    }
    if (kDebugMode) {
      print('fetchData : ${await OrderService().getOrderData(queryParameters)}');
    }
    return await OrderService().getOrderData(queryParameters);
  }

  int cnt = 0;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('$cnt : $selectedValue1');
      print('$cnt : $selectedValue2');
    }
    cnt++;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: BodyTab(
            isBackItemHidden: true,
            titleList: ORDER_LIST_TAB,
            tabTitle: Text(
              "요청 목록",
              style: titleStyle,
            ),
            tabBarViewChild: [
              orderProductView('sell', selectedValue1),
              orderProductView('order', selectedValue2)
            ]),
      ),
    );
  }

  Widget orderProductView(String type, String selectedValue) {
    if (kDebugMode) {
      print("실행");
    }
    return FutureBuilder(
        future: fetchData(type, selectedValue),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            if (kDebugMode) {
              print('에러가 발생했습니다.');
            }
            return const CircularProgress();
          }
          if (snapshot.hasData) {
            data = OrderListModel.fromJson(snapshot.data);
            content = data!.data.content;
            if (data?.code != 200) {
              if (kDebugMode) {
                print('올바르지 않은 요청 타입입니다.');
              }
              return const CircularProgress();
            }
          } else {
            return const CircularProgress();
          }
          return orderView(
              type,
              SingleChildScrollView(child: Column(children: content.map((e) =>
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MoveToDetailOrderScreen(
                            type: type,
                            orderId: e.orderId)));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 130,
                  margin: const EdgeInsets.symmetric(horizontal: 17.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              type == 'sell'
                                  ? '요청자 ${e.userName}님'
                                  : '${e.userName}님',
                              style: userNameTextStyle,
                            ),
                            Text(
                              e.orderDate,
                              style: dateTextStyle,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 30.0),
                        child: type == 'sell'
                            ? LargeDetailBar(
                                title: e.productName,
                                moveTo: MoveToDetailOrderScreen(type: type, orderId: e.orderId,)
                              )
                            : moveToReview(e.productName, e.reviewId, e.userName, e.productName, e.productImgUrl, e.orderId, e.productId),
                      )
                    ],
                  ),
                ),
              )).toList()
            ))
        );
      });
  }

  Widget orderView(String type, Widget child) {
    if ((type == 'sell'
            ? selectedValue = selectedValue1
            : selectedValue = selectedValue2) ==
        '') {
      selectedValue = '요청대기';
    }
    if (kDebugMode) {
      print('selectedValue : $selectedValue');
    }
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.only(right: 15.0, bottom: 10.0, top: 5.0),
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton2(
                hint: Text(
                  '요청대기',
                  style: dropdownBtnTextStyle,
                  textAlign: TextAlign.end,
                ),
                value: selectedValue,
                items: dropDownBtnTitle
                    .map((String item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: dropdownBtnTextStyle,
                        )))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    type == 'sell'
                        ? selectedValue1 = value!
                        : selectedValue2 = value!;
                    fetchData(
                        type, type == 'sell' ? selectedValue1 : selectedValue2);
                  });
                },
                dropdownStyleData: DropdownStyleData(
                  width: 90.0,
                  elevation: 0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: PURPLE_COLOR, width: 1)),
                  useSafeArea: true,
                  padding: EdgeInsets.zero,
                ),
                iconStyleData: IconStyleData(
                    icon:
                        SvgPicture.asset('asset/icons/common/toggle_down.svg'),
                    openMenuIcon:
                        SvgPicture.asset('asset/icons/common/toggle_up.svg')),
              ),
            ),
          ),
        ),
        child
      ]),
    );
  }

  Widget moveToReview(String title, int? reviewId, String sellerName,
      String productName, String? productImgKey, int orderId, int productId) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              title,
              style: headerTextStyle,
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => reviewId != null
                            ? ReviewScreen(
                                productId: productId,
                              )
                            : AddReviewScreen(
                                sellerName: sellerName,
                                productName: productName,
                                productImgKey: productImgKey,
                                reviewId: reviewId,
                                orderId: orderId,
                                isAdding: true,
                              )));
              },
              child: Text(reviewId != null ? '리뷰 보기' : '리뷰 쓰기',
                  style: reviewBtnTextStyle))
        ],
      ),
    );
  }

  setSelectedValue(String type, String value) {
    setState(() {
      type == 'sell' ? selectedValue1 = value : selectedValue2 = value;

      // selectedValue = value;
    });
  }

  Widget renderleftItem() {
    return Container(
      color: Colors.red[100],
      child: IconButton(
        icon: SvgPicture.asset("asset/icons/common/chevron.backward.svg"),
        onPressed: didTapBackItem,
      ),
    );
  }

  /// event methods
  void didTapBackItem() {
    Navigator.of(context).pop();
  }
}
