import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:psr/common/const/constants.dart';
import 'package:psr/common/layout/circular_progress_indicator.dart';
import 'package:psr/common/layout/large_detail_bar_layout.dart';
import 'package:psr/common/view/body_tab.dart';
import 'package:psr/mypage/component/MoveToDetailOrderScreen.dart';
import 'package:psr/mypage/view/order_list_screen.dart';
import 'package:psr/presenter/order/order_service.dart';

import '../../common/const/colors.dart';
import '../../home/component/card_slider.dart';
import '../../model/data/order/order_list_model.dart';

class OrderListTab extends StatefulWidget {
  const OrderListTab({Key? key}) : super(key: key);

  @override
  State<OrderListTab> createState() => _OrderListTabState();
}

class _OrderListTabState extends State<OrderListTab>
    with SingleTickerProviderStateMixin {
  final TextStyle orderTextStyle = const TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.w400, color: GRAY_4_COLOR);
  final TextStyle orderProductTextStyle = const TextStyle(
      fontSize: 15.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  final TextStyle orderDateTextStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w400, color: GRAY_2_COLOR);

  final controller = SliderController();

  OrderListModel? data;
  List<OrderList> content = [];

  Future<dynamic> fetchData(String type) async {
    Map<String, dynamic> queryParameters;
    if (type == 'sell') {
      queryParameters = {'type': 'sell'};
    } else {
      queryParameters = {'type': 'order'};
    }
    final result = await OrderService().getOrderData(queryParameters);
    if (kDebugMode) {
      print('ordertab $result');
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("size: ${MediaQuery.of(context).size.height}");
    }
    double height = MediaQuery.of(context).size.height;

    if(MediaQuery.of(context).size.height > 800) {
      height = height * 0.5;
    }else{
      height = height * 0.65;
    }
    return SizedBox(
      height: height,
      child: BodyTab(
        isBackItemHidden: false,
        tabTitle: LargeDetailBar(title: "요청목록", moveTo: const OrderListScreen()),
        tabBarViewChild: [
          orderProductCardSlider(type: 'sell'),
          orderProductCardSlider(type: 'order'),
        ],
        titleList: ORDER_LIST_TAB, selectedTab: null,
      ),
    );
  }

  Widget orderProductCardSlider({required String type}) {
    return FutureBuilder(
        future: fetchData(type),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            if (kDebugMode) {
              print("orderlist-tab : 에러가 발생했습니다.");
            }
            return const CircularProgress();
          }
          if (snapshot.hasData) {
            data = OrderListModel.fromJson(snapshot.data);
            content = data!.data.content;
            if (data?.code != 200) {
              if (kDebugMode) {
                print("orderlist-tab : 올바르지 않은 요청 타입입니다.");
              }
              return const CircularProgress();
            }
          }else {
            return const CircularProgress();
          }
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: WidgetSlider(
              controller: controller,
              itemCount: content.length,
              infiniteScroll: false,
              proximity: 0.5,
              sizeDistinction: 0.4,
              itemBuilder: (context, index, activeIndex) {
                return cardContent(
                    content[index].userName,
                    content[index].productImgUrl,
                    content[index].productName,
                    content[index].orderDate,
                    content[index].orderId,
                    type);
              },
            ),
          );
        });
  }

  Widget cardContent(String userName, String? productImg, String productName,
      String orderDate, int orderId, String type) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    (MoveToDetailOrderScreen(type: type, orderId: orderId))));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 0.0),
        decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: LIGHT_SHADOW_COLOR,
                spreadRadius: 0,
                blurRadius: 4,
              ),
            ],
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "$userName님",
                          style: orderTextStyle,
                        )),
                    Container(
                        width: 140.0,
                        height: 140.0,
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: GRAY_0_COLOR,
                                width: 1.0,
                                style: BorderStyle.solid)),
                        child: ClipRect(
                          child: (productImg == null)
                              ? const Icon(Icons.question_mark, color: PURPLE_COLOR, size: 50,)
                              : Image.network(productImg),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 26.0),
                      child: Text(
                        productName,
                        style: orderProductTextStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      orderDate,
                      style: orderDateTextStyle,
                    )
                  ]),
            )),
      ),
    );
  }
}
