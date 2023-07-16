import 'package:flutter/material.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';
import 'package:psr/common/layout/purple_bottom_button.dart';

import '../../common/layout/custom_title_text.dart';
import '../../common/layout/pick_img_widget.dart';
import '../../common/layout/purple_outlined_text_field.dart';
import '../component/custom_dropdown_button.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {

  List<String> imgKeyList = [];
  String? selectedCategory;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController detailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const DefaultAppBarLayout(titleText: '상품 추가',),
      body: renderBody(),
      bottomNavigationBar: PurpleBottomButton(title: '등록하기', onPressed: didTapAddButton,),
    );
  }

  Widget renderBody() {
    return ListView(
      children: [
        SizedBox(height: 20,),

        const CustomTitleText(title: '상품 카테고리', option: null,),
        Container(
          height: 50,
          child: CustomDropdownButton(width: MediaQuery.of(context).size.width - 40,)
        ),
        const SizedBox(height: 15,),


        const CustomTitleText(title: '상품명', option: null,),
        PurpleOutlinedTextField(
          maxLine: 1,
          hintText: '상품명을 입력해주세요.',
          controller: nameController,
        ),
        const SizedBox(height: 15,),


        const CustomTitleText(title: '상품 가격', option: null,),
        PurpleOutlinedTextField(
          maxLine: 1,
          hintText: '상품 가격을 입력해주세요.',
          controller: priceController,
        ),
        const SizedBox(height: 15,),


        const CustomTitleText(title: '상품 설명', option: null,),
        PurpleOutlinedTextField(
          maxLine: 15,
          maxLength: 5000,
          hintText: '상품 설명을 입력해주세요.',
          controller: detailController,
        ),
        const SizedBox(height: 15,),

        const CustomTitleText(title: '사진을 올려주세요', option: ' (선택)',),
        PickImgView(imgKeyList: imgKeyList,),

        const SizedBox(height: 30,),

      ],
    );
  }


  /// event methods
  void didTapAddButton() {
    print("didTapAddButton");
  }

}
