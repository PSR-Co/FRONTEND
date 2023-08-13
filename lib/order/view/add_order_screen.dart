import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:psr/common/const/colors.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';
import 'package:psr/common/layout/purple_filled_button.dart';
import 'package:psr/order/component/order_info_input_widget.dart';
import 'package:psr/presenter/shopping/shopping_service.dart';

class AddOrderScreen extends StatefulWidget {
  final int productId;
  final String? productImgUrl;
  final String productName;

  const AddOrderScreen({
    required this.productId,
    required this.productImgUrl,
    required this.productName,
    Key? key
  }) : super(key: key);

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {

  bool isAllInput = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController urlController = TextEditingController();
  final TextEditingController inquiryController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final defaultStyle = const TextStyle(
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
      bottomNavigationBar: PurpleFilledButton(
        title: '판매자에게 요청하기',
        onPressed: (isAllInput) ? didTapOrderButton : null,),
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
          onChanged: onChanged,
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
          controller: inquiryController,
          onChanged: onChanged,
        ),

        OrderInfoInputView(
          title: '요청 상세 설명',
          hintText: '요청 상세 설명을 입력해주세요.',
          maxLine: 5,
          controller: descriptionController,
          onChanged: onChanged,
        ),

        const SizedBox(height: 30,),
      ],
    );
  }

  Widget renderProductInfo() {
    return Column(
      children: [
        (widget.productImgUrl == null)
        ? Image.asset('/asset/images/product_sample.png')
        : Image.asset(widget.productImgUrl!, width: 148, height: 148, fit: BoxFit.cover,),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(widget.productName, style: defaultStyle),
            )
      ],
    );
  }

  void onChanged() {
    setState(() {
      isAllInput = (
          nameController.value.text.isNotEmpty
          && inquiryController.value.text.isNotEmpty
          && descriptionController.value.text.isNotEmpty
      );
    });
  }

  /// event methods
  void didTapOrderButton() async {
    final result = await ShoppingService().requestOrder(
        widget.productId,
        nameController.value.text,
        urlController.value.text,
        inquiryController.value.text,
        descriptionController.value.text
    );
    if (result) { Navigator.of(context).pop(); }
    else { Fluttertoast.showToast(msg: '요청에 실패하였습니다.'); }
  }
}
