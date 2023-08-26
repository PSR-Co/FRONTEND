import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';
import 'package:psr/common/layout/purple_filled_button.dart';
import 'package:psr/presenter/common/ImageService.dart';
import 'package:psr/presenter/shopping/shopping_service.dart';

import '../../common/layout/custom_title_text.dart';
import '../../common/layout/pick_img_widget.dart';
import '../../common/layout/purple_outlined_text_field.dart';
import '../../order/view/complete_order_screen.dart';
import '../component/custom_dropdown_button.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => AddProductScreenState();
}

class AddProductScreenState extends State<AddProductScreen> {

  bool isAllInput = false;

  List<String> imgList = [];
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
      bottomNavigationBar: PurpleFilledButton(title: '등록하기', onPressed: (isAllInput) ? didTapAddButton : null,),
    );
  }

  Widget renderBody() {
    return GestureDetector(
      onTap: () { FocusScope.of(context).unfocus(); },
      child: ListView(
        children: [
          const SizedBox(height: 20,),

          const CustomTitleText(title: '상품 카테고리', option: null,),
          SizedBox(
            height: 50,
            child: CustomDropdownButton(width: MediaQuery.of(context).size.width - 40,)
          ),
          const SizedBox(height: 15,),


          const CustomTitleText(title: '상품명', option: null,),
          PurpleOutlinedTextField(
            maxLine: 1,
            hintText: '상품명을 입력해주세요.',
            controller: nameController,
            onChanged: onChanged,
          ),
          const SizedBox(height: 15,),


          const CustomTitleText(title: '상품 가격', option: null,),
          PurpleOutlinedTextField(
            maxLine: 1,
            hintText: '상품 가격을 입력해주세요.',
            controller: priceController,
            onChanged: onChanged,
          ),
          const SizedBox(height: 15,),


          const CustomTitleText(title: '상품 설명', option: null,),
          PurpleOutlinedTextField(
            maxLine: 15,
            maxLength: 5000,
            hintText: '상품 설명을 입력해주세요.',
            controller: detailController,
            onChanged: onChanged,
          ),
          const SizedBox(height: 15,),

          const CustomTitleText(title: '사진을 올려주세요', option: ' (선택)',),
          PickImgView(
            isEditing: true,
            imgKeyList: imgList,
          ),

          const SizedBox(height: 30,),

        ],
      ),
    );
  }

  /// helper methods
  void onChanged() {
    setState(() {
      isAllInput = (
          (selectedCategory != null)
          && nameController.value.text.isNotEmpty
          && priceController.value.text.isNotEmpty
          && detailController.value.text.isNotEmpty
      );
    });
  }


  /// event methods
  Future<void> didTapAddButton() async {
    List<String> uploadedList = await ImageService().uploadImageList(ImageType.product, imgList);

    final result = await ShoppingService().addProduct(
        selectedCategory!,
        nameController.value.text,
        priceController.value.text,
        detailController.value.text,
        // (imgList.isEmpty) ? null : imgList
        (uploadedList.isEmpty) ? null : uploadedList
    );

    if (result) { Navigator.of(context).pop(); }
    else { Fluttertoast.showToast(msg: '상품 등록에 실패하였습니다.'); }
  }

}
