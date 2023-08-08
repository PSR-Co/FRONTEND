import 'package:flutter/material.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';
import 'package:psr/common/layout/division.dart';
import 'package:psr/mypage/component/action_btn.dart';
import 'package:psr/mypage/component/detail_order_textfield_form.dart';

import '../../common/const/colors.dart';

///요청 상세 기본틀 => (요청상태 대기)판매자와 구매자 상세 화면
///추후 유저타입, 진행상태에 따른 로직 생성 예정
class DetailOrderScreen extends StatefulWidget {
  String? selectedValue;
  String orderDate;
  String productName;
  String btnOption1;
  String btnOption2;
  Widget? child;

  DetailOrderScreen(
      {required this.selectedValue,
      required this.orderDate,
      required this.productName,
      required this.btnOption1,
      required this.btnOption2,
      required this.child,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const DefaultAppBarLayout(titleText: '요청 상세'),
        body: SafeArea(
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: optionBody(widget.child)),
        ));
  }

  Widget optionBody(Widget? child) {
    if (child != null) {
      return Column(
        children: [
          orderDetailHeader(),
          const Division(),
          orderDetailView(),
          buttonView(),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: child,
          )
        ],
      );
    } else {
      return Column(
        children: [
          orderDetailHeader(),
          const Division(),
          orderDetailView(),
          buttonView(),
        ],
      );
    }
  }

  Widget orderDetailHeader() {
    String selectedValue;
    if (widget.selectedValue == null) {
      selectedValue = '요청대기';
    } else {
      selectedValue = widget.selectedValue!;
    }
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
                    selectedValue,
                    style: userTypeTextStyle,
                  ),
                ),
                Text(
                  widget.orderDate,
                  style: dateTextStyle,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: detailOrderBar(),
          ),
        ]));
  }

  Widget detailOrderBar() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.productName,
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

  Widget orderDetailView() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 10),
      child: ListView(
        shrinkWrap: true,
        children: [
          DetailOrderTextFieldForm(
            title: '이름',
            hintText: '이름을 입력해주세요.',
            maxLine: 1,
            controller: nameController,
            readOnly: readOnly,
          ),
          DetailOrderTextFieldForm(
            title: '사업자/쇼핑몰 URL',
            option: ' (선택)',
            hintText: 'URL을 입력해주세요.',
            maxLine: 1,
            controller: urlController,
            readOnly: readOnly,
          ),
          DetailOrderTextFieldForm(
            title: '문의사항',
            hintText: '문의사항을 입력해주세요.',
            maxLine: 5,
            controller: askController,
            readOnly: readOnly,
          ),
          DetailOrderTextFieldForm(
            title: '요청 상세 설명',
            hintText: '요청 상세 설명을 입력해주세요.',
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

  Widget buttonView() {
    return ActionBtn(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
            onPressed: () {
              changeEditable();
            },
            child: Text(
              widget.btnOption1,
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
              widget.btnOption2,
              style: btnTypeTextStyle,
            )),
      ],
    ));
  }

  void changeEditable() {
    setState(() {
      readOnly = !readOnly;
    });
  }
}