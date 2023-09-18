import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:psr/common/const/colors.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';
import 'package:psr/common/layout/purple_filled_button.dart';
import 'package:psr/order/component/order_info_input_widget.dart';
import 'package:psr/order/view/complete_order_screen.dart';
import 'package:psr/presenter/shopping/shopping_service.dart';

import 'complete_order_screen.dart';

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
      appBar: const DefaultAppBarLayout(titleText: '요청하기',),
      body: renderBody(),
      bottomNavigationBar: PurpleFilledButton(
        title: '판매자에게 요청하기',
        onPressed: (isAllInput) ? didTapOrderButton : null,),
    );
  }

  /// rendering methods
  Widget renderBody() {

    return GestureDetector(
      onTap: () { FocusScope.of(context).unfocus(); },
      child: ListView(
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
            hintText: '서비스 및 물품 판매 의뢰 시기와 기간, 추가적으로 요청하고 싶은 부분 외에 판매자에게 요청하고 싶은 내용을 자세하세 작성해주세요.',
            maxLine: 5,
            controller: descriptionController,
            onChanged: onChanged,
          ),

          const SizedBox(height: 30,),
        ],
      ),
    );
  }

  Widget renderProductInfo() {
    double imgSize = MediaQuery.of(context).size.width / 3 + 15;
    return Column(
      children: [
        SizedBox(
          height: imgSize,
          width: imgSize,
          child: (widget.productImgUrl == null)
            ? Container(
                color: Colors.grey.withOpacity(0.2),
                width: imgSize,
                height: imgSize,
                child: const Center(
                    child: Text('이미지 없음', style: TextStyle(fontSize: 14, color: Colors.grey),)
                ),
              )
            : renderProductImg(widget.productImgUrl!),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(widget.productName, style: defaultStyle),
        )
      ],
    );
  }

  Widget renderProductImg(String imgUrl) {
    if (imgUrl.contains('asset')) {
      return Image.asset('/asset/images/product_sample.png',);
    } else {
      return Image.network(imgUrl, fit: BoxFit.cover,);
    }
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
        (urlController.value.text.isEmpty) ? null : urlController.value.text,
        inquiryController.value.text,
        descriptionController.value.text
    );
    if (result) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const CompleteOrderScreen()));
    }
    else { Fluttertoast.showToast(msg: '요청에 실패하였습니다.'); }
  }
}
