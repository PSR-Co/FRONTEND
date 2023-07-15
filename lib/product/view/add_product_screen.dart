import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';
import 'package:psr/common/layout/purple_bottom_button.dart';

import '../../common/const/colors.dart';
import '../../common/layout/purple_outlined_text_field.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {

  List<String> imgKeyList = [];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController detailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBarLayout(titleText: '상품 추가',),
      body: renderBody(),
      bottomNavigationBar: PurpleBottomButton(title: '등록하기', onPressed: didTapAddButton,),
    );
  }

  Widget renderBody() {
    return ListView(
      children: [
        SizedBox(height: 20,),

        renderTitleText('상품 카테고리', null),
        // 카테고리 드롭다운
        SizedBox(height: 15,),


        renderTitleText('상품명', null),
        PurpleOutlinedTextField(
          maxLine: 1,
          hintText: '상품명을 입력해주세요.',
          controller: nameController,
        ),
        SizedBox(height: 15,),

        renderTitleText('상품 가격', null),
        PurpleOutlinedTextField(
          maxLine: 1,
          hintText: '상품 가격을 입력해주세요.',
          controller: nameController,
        ),
        SizedBox(height: 15,),

        renderTitleText('상품 설명', null),
        PurpleOutlinedTextField(
          maxLine: 5,
          hintText: '상품 설명을 입력해주세요.',
          controller: nameController,
        ),
        SizedBox(height: 15,),

        renderTitleText('사진을 올려주세요', ' (선택)'),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  // IconButton(onPressed: (){}, icon: icon),
                  SvgPicture.asset('asset/icons/shopping/pick_img_icon.svg', width: 90, height: 90,)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Text('상품과 무관한 사진을 첨부하면 노출 제한 처리 될 수 있습니다. \n사진 첨부시 개인 정보가 노출되지 않게 유의해주세요.', style: TextStyle(
                fontSize: 11,
                color: GRAY_1_COLOR,
              )),
            )
          ],
        ),
        SizedBox(height: 30,),

      ],
    );
  }

  Widget renderTitleText(String title, String? option) {
    final titleStyle = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 17,
      color: GRAY_4_COLOR,
    );

    final optionStyle = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 17,
      color: GRAY_2_COLOR,
    );

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: RichText(
        text: TextSpan(
            text: title, style: titleStyle,
            children: [
              TextSpan(text: option, style: optionStyle,)
            ]
        ),
      ),
    );
  }

  /// event methods
  void didTapAddButton() {
    print("didTapAddButton");
  }

}
