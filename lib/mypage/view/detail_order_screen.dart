import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';
import 'package:psr/common/layout/division.dart';
import 'package:psr/model/data/order/order_detail_model.dart';
import 'package:psr/mypage/component/action_btn.dart';
import 'package:psr/mypage/component/detail_order_textfield_form.dart';
import 'package:psr/order/component/order_dialog.dart';
import 'package:psr/presenter/order/order_service.dart';

import '../../common/const/colors.dart';
import '../../common/layout/circular_progress_indicator.dart';
import '../../product/view/product_detail_screen.dart';

class DetailOrderScreen extends StatefulWidget {
  int orderId;
  String type;
  String btnOption1;
  String btnOption2;

  DetailOrderScreen(
      {required this.orderId,
      required this.type,
      required this.btnOption1,
      required this.btnOption2,
      Key? key})
      : super(key: key);

  @override
  State<DetailOrderScreen> createState() => _DetailOrderScreenState();
}

class _DetailOrderScreenState extends State<DetailOrderScreen> {
  final TextStyle userTypeTextStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w700, color: PINK_COLOR);
  final TextStyle detailTitleTextStyle = const TextStyle(
      fontSize: 16.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  final TextStyle hintTextStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w400, color: GRAY_1_COLOR);
  final TextStyle defaultTextStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w400, color: GRAY_4_COLOR);
  final TextStyle headerTextStyle = const TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  final TextStyle dateTextStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w400, color: GRAY_2_COLOR);
  final TextStyle btnTypeTextStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w700, color: PURPLE_COLOR);

  final TextStyle titleTextStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  final TextStyle answerTextStyle = const TextStyle(
      fontSize: 15.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController urlController = TextEditingController();
  final TextEditingController askController = TextEditingController();
  final TextEditingController detailController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  bool readOnly = true;
  String status = '';
  OrderDetailModel? data;
  bool isSuccess = false;


  Future<dynamic> fetchData(int orderId) async {
    return await OrderService().getOrderDetailData(orderId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const DefaultAppBarLayout(titleText: '요청 상세'),
        body: SafeArea(
          child: SizedBox(
              width: MediaQuery.of(context).size.width, child: optionBody()),
        ));
  }

  Widget optionBody() {
    return FutureBuilder(
        future: fetchData(widget.orderId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            if (kDebugMode) {
              print("detail-order-screen : 에러가 발생했습니다.");
            }
            return const CircularProgress();
          }
          if (snapshot.hasData) {
            data = OrderDetailModel.fromJson(snapshot.data);
            if (data?.code == 403) {
              if (kDebugMode) {
                print('detail-order-screen : 권한이 없습니다.');
              }
              return const CircularProgress();
            } else if (data?.code == 404) {
              if (kDebugMode) {
                print("detail-order-screen : 해당 요청을 찾을 수 없습니다.");
              }
              return const CircularProgress();
            }
          } else {
            return const CircularProgress();
          }
          if (kDebugMode) {
            print(widget.type);
          }
          return SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                orderDetailHeader(data!.data.status, data!.data.orderDate),
                const Division(),
                orderDetailView(data!.data.ordererName, data!.data.websiteUrl,
                    data!.data.inquiry, data!.data.description),
                if (widget.type == 'sell' && data!.data.status != '요청대기' && data!.data.status != '진행완료')
                  buttonView('진행완료', '진행취소', data!.data.status)
                else if ((widget.type != 'sell' ||
                        data!.data.status == '요청대기') &&
                    data!.data.status != '요청취소')
                  buttonView(
                      widget.btnOption1, widget.btnOption2, data!.data.status),
                if (widget.type == 'sell' && data!.data.status == '요청대기')
                  ActionBtn(
                      child: actionBtnChild(
                          () => () {
                            ///추후 채팅과 연결
                                Navigator.pop(context, false);
                                setState(() {
                                  scrollController.jumpTo(scrollController.position.maxScrollExtent);
                                });
                              },
                          '1:1 채팅'))
                else if (widget.type == 'order' && !readOnly)
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: ActionBtn(
                        child: actionBtnChild(
                            () => editedBtn(
                                    data!.data.ordererName,
                                    data!.data.websiteUrl,
                                    data!.data.inquiry,
                                    data!.data.description,
                                    "수정",
                                    "요청을 수정하였습니다.")
                                .then((value) => setState(() {})),
                            '수정하기')),
                  )
              ],
            ),
          );
        });
  }

  Widget orderDetailHeader(String status, String orderDate) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 17.0),
        child: Column(children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 70.0,
                  height: 25.0,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: PINK_COLOR_20,
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                  child: Text(
                    status,
                    style: userTypeTextStyle,
                  ),
                ),
                Text(
                  orderDate,
                  style: dateTextStyle,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: detailOrderBar(data!.data.productName, data!.data.productId),
          ),
        ]));
  }

  Widget detailOrderBar(String productName, int productId) {
    return GestureDetector(
      onTap: () {
        tapProduct(productId);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                productName,
                style: headerTextStyle,
              ),
            ),
            IconButton(
              onPressed: () {
                tapProduct(productId);
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 20.0,
                color: GRAY_4_COLOR,
              ),
              padding: const EdgeInsets.only(bottom: 2.0),
              constraints: const BoxConstraints(),
            )
          ],
        ),
      ),
    );
  }

  Widget orderDetailView(
      String userName, String? websiteUrl, String inquiry, String description) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          DetailOrderTextFieldForm(
            title: '이름',
            hintText: userName,
            maxLine: 1,
            controller: nameController,
            readOnly: readOnly,
          ),
          DetailOrderTextFieldForm(
            title: '사업자/쇼핑몰 URL',
            option: ' (선택)',
            hintText: websiteUrl ?? 'URL을 입력해주세요.',
            maxLine: 1,
            controller: urlController,
            readOnly: readOnly,
          ),
          DetailOrderTextFieldForm(
            title: '문의사항',
            hintText: inquiry,
            maxLine: 5,
            controller: askController,
            readOnly: readOnly,
          ),
          DetailOrderTextFieldForm(
            title: '요청 상세 설명',
            hintText: description,
            maxLine: 5,
            controller: detailController,
            readOnly: readOnly,
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Widget buttonView(String btnOption1, String btnOption2, String status) {
    return ActionBtn(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
            onPressed: () {
              if (kDebugMode) {
                print("order status: $status");
              }
              switch (btnOption1) {
                case '요청수정':
                  if (status != '진행중') {
                    changeEditable();
                  } else {
                    orderDialog("요청이 진행 중에는 수정이 불가합니다.");
                  }
                  break;
                case '요청승인':
                  changeStatus('진행중');
                  editedBtn(
                      data!.data.ordererName,
                      data!.data.websiteUrl,
                      data!.data.inquiry,
                      data!.data.description,
                      "승인",
                      "요청을 승인하였습니다!")
                      .then((value) => setState(() {}));
                  break;
                case '진행완료' :
                  changeStatus('진행완료');
                  setState(() {
                    editedBtn(
                        data!.data.ordererName,
                        data!.data.websiteUrl,
                        data!.data.inquiry,
                        data!.data.description,
                        "완료",
                        "요청이 완료되었습니다.")
                        .then((value) => setState(() {}));
                  });
                  break;
                default:
                  break;
              }
            },
            child: Text(
              btnOption1,
              style: btnTypeTextStyle,
            )),
        Container(
          width: 1.0,
          height: 17.0,
          color: PURPLE_COLOR,
        ),
        TextButton(
            onPressed: () {
              switch(btnOption2){
                case '진행취소' :
                  changeStatus('요청취소');
                  setState(() {
                    editedBtn(
                        data!.data.ordererName,
                        data!.data.websiteUrl,
                        data!.data.inquiry,
                        data!.data.description,
                        "취소",
                        "요청을 취소하였습니다.")
                        .then((value) => setState(() {}));
                  });
                  break;
                case '요청거절' :
                  changeStatus('요청취소');
                  setState(() {
                    editedBtn(
                        data!.data.ordererName,
                        data!.data.websiteUrl,
                        data!.data.inquiry,
                        data!.data.description,
                        "거절",
                        "요청을 거절하였습니다.")
                        .then((value) => setState(() {}));
                  });
                  break;
                case '요청취소' :
                  changeStatus('요청취소');
                  setState(() {
                    editedBtn(
                        data!.data.ordererName,
                        data!.data.websiteUrl,
                        data!.data.inquiry,
                        data!.data.description,
                        "취소",
                        "요청을 취소하였습니다.")
                        .then((value) => setState(() {}));
                  });
                  break;
              }
            },
            child: Text(
              btnOption2,
              style: btnTypeTextStyle,
            )),
      ],
    ));
  }

  Widget actionBtnChild(Function()? onPressed, String btnText) {
    scrollController.jumpTo(scrollController.position.maxScrollExtent);

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextButton(
          onPressed: onPressed,
          child: Text(
            btnText,
            style: btnTypeTextStyle,
          )),
    );
  }

  Future<dynamic> editedBtn(
      String ordererName,
      String? websiteUrl,
      String inquiry,
      String description,
      String type,
      String dialogMsg) async {
    String name = '';
    String? url = '';
    String ask = '';
    String detail = '';
    dynamic result;

    nameController.text == '' ? name = ordererName : name = nameController.text;
    urlController.text == '' ? url = websiteUrl : url = urlController.text;
    askController.text == '' ? ask = inquiry : ask = askController.text;
    detailController.text == ''
        ? detail = description
        : detail = detailController.text;

    print('updateState $status');
    if(type == '수정'){
      if(status == '진행중'){
        orderDialog('요청이 진행 중일 때는 요청을 수정할 수 없습니다.');
      }else{
        result = await OrderService().editOrderData(
            widget.orderId, name, url, ask, detail);
        changeState();
        isSuccess ? orderDialog('요청이 수정되었습니다!')
            : orderDialog('요청 수정에 실패하셨습니다.');
        if(result != null) {
          orderDialog(dialogMsg);
        } else {
          orderDialog('요청수정 실패');
        }
      }
      changeEditable();
    }else {
      result = await OrderService().editOrderStatus(widget.orderId, {"status" : status});
      if(result != null) {
        orderDialog(dialogMsg);
      } else {
        orderDialog('요청$type 실패');
      }    }
    print('updateStateResponse $result');
  }

  void orderDialog(String result) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (_) {
          return OrderDialog(result: result);
        });
  }

  void changeEditable() {
    setState(() {
      readOnly = !readOnly;
    });
  }

  void changeStatus(String newStatus) {
    setState(() {
      status = newStatus;
    });
  }

  void tapProduct(int productId) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => ProductDetailScreen(productId: productId),
        settings: const RouteSettings(name: '/productDetail')));
  }

  void changeState() {
    setState(() {
      isSuccess = !isSuccess;
    });
  }
}
