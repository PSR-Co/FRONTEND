import 'package:flutter/material.dart';
import 'package:psr/common/const/colors.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';

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
        // 제품 이미지, 이름
        Column(
          children: [
            Image.asset(widget.productImgKey, width: 148, height: 148, fit: BoxFit.cover,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(widget.productName, style: defaultStyle),
            )
          ],
        ),

        // 이름, 텍스트 필드
        renderTitleText('이름'),
        renderCustomTextField('이름을 입력해주세요.', nameController),

        SizedBox(height: 20,),

        // URL, 텍스트 필드
        renderTitleText('사업자/쇼핑몰 URL (선택)'),
        renderCustomTextField('URL을 입력해주세요.', urlController),

        SizedBox(height: 20,),

        // 문의사항, 텍스트 필드
        renderTitleText('문의사항'),

        SizedBox(height: 20,),

        // 요청상세, 텍스트 필드
        renderTitleText('요청 상세 설명'),

      ],
    );
  }


  
  Widget renderTitleText(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      // child: Text('사업자/쇼핑몰 URL (선택)', style: defaultStyle,),  // TODO: RichText로 변경
      child: Text(title, style: defaultStyle,),  // TODO: RichText로 변경
    );
  }

  Widget renderCustomTextField(String hintText, TextEditingController controller) {
    final defaultStyle = OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(
          color: PURPLE_COLOR.withOpacity(0.5),
          width: 1.0,
        )
    );

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      width: MediaQuery.of(context).size.width - 40,
      height: 45.0,
      child: TextField(
        controller: controller,
        scrollPhysics: NeverScrollableScrollPhysics(),
        showCursor: false,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: GRAY_1_COLOR
          ),
          contentPadding: EdgeInsets.only(left: 15),
          enabledBorder: defaultStyle,
          border: defaultStyle,
          focusedBorder: defaultStyle,
        ),
      ),
    );
  }

  Widget renderBottomButton() {
    final titleStyle = TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: Colors.white
    );

    return Container(
      margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
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
  }
}
