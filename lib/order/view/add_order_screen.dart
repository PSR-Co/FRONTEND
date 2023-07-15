import 'package:flutter/material.dart';
import 'package:psr/common/const/colors.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';
import 'package:psr/order/component/order_info_input_widget.dart';

class AddOrderScreen extends StatefulWidget {
  final String productImgKey;
  final String productName;

  const AddOrderScreen({
    required this.productImgKey,
    required this.productName,
    Key? key
  }) : super(key: key);

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController urlController = TextEditingController();
  final TextEditingController askController = TextEditingController();
  final TextEditingController detailController = TextEditingController();

  final defaultStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 15,
    color: GRAY_4_COLOR,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBarLayout(titleText: '요청하기',),
      body: renderBody(),
      bottomNavigationBar: renderBottomButton(),
    );
  }

  /// rendering methods
  Widget renderBody() {

    return ListView(
      children: [
        renderProductInfo(),

        OrderInfoInputView(
          title: '이름',
          hintText: '이름을 입력해주세요.',
          maxLine: 1,
          controller: nameController,
        ),

        OrderInfoInputView(
          title: '사업자/쇼핑몰 URL',
          option: ' (선택)',
          hintText: 'URL을 입력해주세요.',
          maxLine: 1,
          controller: urlController,
        ),

        OrderInfoInputView(
          title: '문의사항',
          hintText: '문의사항을 입력해주세요.',
          maxLine: 5,
          controller: askController,
        ),

        OrderInfoInputView(
          title: '요청 상세 설명',
          hintText: '요청 상세 설명을 입력해주세요.',
          maxLine: 5,
          controller: detailController,
        ),

        SizedBox(height: 30,),
      ],
    );
  }

  Widget renderProductInfo() {
    return Column(
      children: [
        Image.asset(widget.productImgKey, width: 148, height: 148, fit: BoxFit.cover,),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(widget.productName, style: defaultStyle),
        )
      ],
    );
  }

  Widget renderBottomButton() {
    final titleStyle = TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: Colors.white
    );

    return Container(
      margin: EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 30),
      height: 40.0,
      child: ElevatedButton(
        onPressed: didTapOrderButton,
        child: Text('판매자에게 요청하기', style: titleStyle,),
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: PURPLE_COLOR,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            )
        ),
      ),
    );
  }

  /// event methods
  void didTapOrderButton() {
    // TODO: 작성된 요청 검토 및 POST
    print("didTapOrderButton");
    print("입력된 이름 -> ${nameController.value.text}");
    print("입력된 URL -> ${urlController.value.text}");
    print("입력된 문의사항 -> ${askController.value.text}");
    print("입력된 요청 상세 설명 -> ${detailController.value.text}");
  }
}
