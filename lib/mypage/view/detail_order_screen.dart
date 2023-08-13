import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';
import 'package:psr/common/layout/division.dart';
import 'package:psr/model/data/order/order_detail_model.dart';
import 'package:psr/mypage/component/action_btn.dart';
import 'package:psr/mypage/component/detail_order_textfield_form.dart';
import 'package:psr/presenter/order/order_service.dart';

import '../../common/const/colors.dart';

///요청 상세 기본틀 => (요청상태 대기)판매자와 구매자 상세 화면
///추후 유저타입, 진행상태에 따른 로직 생성 예정
class DetailOrderScreen extends StatefulWidget {
  int orderId;
  String type;
  String btnOption1;
  String btnOption2;

  // Widget? child;

  DetailOrderScreen(
      {required this.orderId,
      required this.type,
      required this.btnOption1,
      required this.btnOption2,
      // required this.child,
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

  final TextEditingController nameController = TextEditingController();
  final TextEditingController urlController = TextEditingController();
  final TextEditingController askController = TextEditingController();
  final TextEditingController detailController = TextEditingController();

  bool readOnly = true;
  String status = '';
  OrderDetailModel? data;

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
            return const Center(
              child: Text('에러가 발생했습니다.'),
            );
          }
          if (snapshot.hasData) {
            data = OrderDetailModel.fromJson(snapshot.data);
            if (data?.code == 403) {
              return const Center(
                child: Text('권한이 없습니다.'),
              );
            } else if (data?.code == 404) {
              return const Center(
                child: Text('해당 요청을 찾을 수 없습니다.'),
              );
            }
          } else {
            return const Center(
              child: Text('요청 상세를 불러오는데 실패하였습니다.'),
            );
          }
          return Column(
            children: [
              orderDetailHeader(data!.data.status, data!.data.orderDate),
              const Division(),
              orderDetailView(data!.data.ordererName, data!.data.websiteUrl,
                  data!.data.inquiry, data!.data.description),
              if (widget.type == 'sell' && data!.data.status != '요청대기')
                buttonView('진행완료', '진행취소')
              else
                buttonView(widget.btnOption1, widget.btnOption2),
              if (widget.type == 'sell' && data!.data.status == '요청대기')
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: ActionBtn(
                      child: actionBtnChild(
                          () => () {
                                Navigator.pop(context, false);
                              },
                          '1:1 채팅')),
                )
              else if (widget.type == 'order' && !readOnly)
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: ActionBtn(
                      child: actionBtnChild(
                          () => editedBtn(
                                  data!.data.status,
                                  data!.data.ordererName,
                                  data!.data.websiteUrl,
                                  data!.data.inquiry,
                                  data!.data.description)
                              .then((value) => setState(() {})),
                          '수정하기')),
                )
            ],
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
            child: detailOrderBar(data!.data.productName),
          ),
        ]));
  }

  Widget detailOrderBar(String productName) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            productName,
            style: headerTextStyle,
          ),
          IconButton(
            onPressed: () {},
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
    );
  }

  Widget orderDetailView(
      String userName, String? websiteUrl, String inquiry, String description) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 10),
      child: ListView(
        shrinkWrap: true,
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

  Widget buttonView(String btnOption1, String btnOption2) {
    return ActionBtn(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
            onPressed: () {
              switch (btnOption1) {
                case '요청수정':
                  changeEditable();
                  break;
                case '요청승인':
                  changeStatus('진행중');
                  setState(() {
                    editedBtn(
                            status,
                            data!.data.ordererName,
                            data!.data.websiteUrl,
                            data!.data.inquiry,
                            data!.data.description)
                        .then((value) => setState(() {}));
                  });
                  break;
                case '진행완료':
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
              Navigator.pop(context, false);
            },
            child: Text(
              btnOption2,
              style: btnTypeTextStyle,
            )),
      ],
    ));
  }

  Widget actionBtnChild(Function()? onPressed, String btnText) {
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

  Future<dynamic> editedBtn(String status, String ordererName,
      String? websiteUrl, String inquiry, String description) async {
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
    result = await OrderService().editOrderData(
        widget.orderId, {'status': status}, name, url, ask, detail);

    if (result != null) {
      if (result.code == 200) {
        if (kDebugMode) {
          print('요청에 성공했습니다.');
        }
        changeEditable();
      } else {
        if (kDebugMode) {
          print('요청에 실패했습니다.');
        }
      }
    } else {
      if (kDebugMode) {
        print('네트워크 오류가 발생하였습니다.');
      }
    }
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
}
