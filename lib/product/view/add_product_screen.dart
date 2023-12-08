import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:psr/common/const/colors.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';
import 'package:psr/common/layout/purple_filled_button.dart';
import 'package:psr/model/data/shopping/product_model.dart';
import 'package:psr/presenter/common/ImageService.dart';
import 'package:psr/presenter/shopping/shopping_service.dart';

import '../../common/const/constants.dart';
import '../../common/layout/custom_title_text.dart';
import '../../common/layout/pick_img_widget.dart';
import '../../common/layout/purple_outlined_text_field.dart';

class AddProductScreen extends StatefulWidget {
  final String? category;
  final Product? data;
  final int? productId;

  const AddProductScreen({
    this.category,
    this.data,
    this.productId,
    Key? key
  }) : super(key: key);

  @override
  State<AddProductScreen> createState() => AddProductScreenState();
}

class AddProductScreenState extends State<AddProductScreen> {

  bool isAllInput = false;
  bool isUploadingImg = false;

  List<String> imgList = [];
  String? selectedCategory = '카테고리를 선택해주세요';

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController detailController = TextEditingController();

  @override
  void initState() {
    configure();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const DefaultAppBarLayout(titleText: '상품 추가',),
      body: renderBody(),
      bottomNavigationBar: PurpleFilledButton(
        title: '등록하기',
        onPressed: ((widget.data != null) || isAllInput && !isUploadingImg)
            ? didTapAddButton
            : null,
      ),
    );
  }

  Widget renderBody() {
    if (isUploadingImg) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 100),
        child: const Center(
          child: Column(
            children: [
              CircularProgressIndicator(color: PURPLE_COLOR,),
              SizedBox(height: 15,),
              Text('이미지 업로드 및 상품 추가 중 입니다.', style: TextStyle(fontSize: 14, color: PURPLE_COLOR),)
            ],
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () { FocusScope.of(context).unfocus(); },
      child: ListView(
        children: [
          const SizedBox(height: 20,),

          const CustomTitleText(title: '상품 카테고리', option: null,),
          const SizedBox(height: 5,),
          Container(
            height: 45,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: PURPLE_COLOR.withOpacity(0.5),
                    width: 1.0,
                  )
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  hint: Row(
                    children: [
                      const SizedBox(width: 12,),
                      Expanded(
                          child: Text(selectedCategory!,
                            style: TextStyle(fontSize: 14, color: (selectedCategory == '카테고리를 선택해주세요') ? GRAY_1_COLOR : Colors.black),
                            overflow: TextOverflow.ellipsis,
                          )
                      )
                    ],
                  ),
                  iconStyleData: const IconStyleData(
                    openMenuIcon: Icon(Icons.arrow_drop_up),
                  ),
                  items: CATEGORY_LIST_FOR_ADD.map((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category, style: const TextStyle(fontSize: 14),),
                    );
                  }).toList(),
                  onChanged: (dynamic value) {
                    setState(() { selectedCategory = value; });
                  },
                  dropdownStyleData: DropdownStyleData(
                    width: MediaQuery.of(context).size.width-40,
                    elevation: 0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: PURPLE_COLOR.withOpacity(0.5),
                        width: 1.0,
                      ),
                    )
                  ),
                ),
              ),
            ),
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
            textInputType: TextInputType.number,
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
    setState(() { isUploadingImg = true; });
    await ImageService().uploadImageList(ImageType.product, imgList).then( (value) => requestAddProduct(value) );
  }

  void requestAddProduct(List<String> uploadedList) async {
    if (widget.data == null) {
      // 상품 등록
      final result = await ShoppingService().requestProduct(
        null,
        selectedCategory!,
        nameController.value.text,
        priceController.value.text,
        detailController.value.text,
        (uploadedList.isEmpty) ? null : uploadedList
      );
      setState(() { isUploadingImg = false; });
      if (result) { Navigator.of(context).pop(); }
      else { Fluttertoast.showToast(msg: '상품 등록에 실패하였습니다.'); }

    } else {
      // 상품 수정
      final result = await ShoppingService().requestProduct(
          widget.productId,
          selectedCategory!,
          nameController.value.text,
          priceController.value.text,
          detailController.value.text,
          (uploadedList.isEmpty) ? null : uploadedList
      );
      if (result) { Navigator.of(context).pop(); }
      else { Fluttertoast.showToast(msg: '상품 수정에 실패하였습니다.'); }
    }
  }

  /// helper methods
  void configure(){
    if (widget.category != null) { selectedCategory = widget.category!; }
    if (widget.data != null) {
      nameController.text = widget.data!.name;
      priceController.text = widget.data!.price.toString();
      detailController.text = widget.data!.description;
      imgList = widget.data!.imgList;
    }
  }
}
