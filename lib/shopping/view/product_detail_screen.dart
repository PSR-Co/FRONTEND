import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:psr/common/const/colors.dart';

class ProductDetailScreen extends StatefulWidget {
  final String category;

  const ProductDetailScreen({required this.category, Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      body: Center(
        child: Text("상품 상세 메인"),
      ),
      bottomNavigationBar: renderBottomButtons(),
    );
  }

  AppBar renderAppBar() {
    final titleStyle = TextStyle(
        color: Colors.black,
        fontSize: 17
    );
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(getTrimmedCategory(), style: titleStyle,),
      centerTitle: true,
      leading: renderleftItem(),
      actions: renderRightItems(),
      elevation: 0,
    );
  }

  String getTrimmedCategory() {
    String category = widget.category;
    if (category.contains('\n')) {
      category = category.replaceAll('\n', ' ');
    }
    return category;
  }

  Widget renderleftItem() {
    return Container(
      child: IconButton(
        icon: SvgPicture.asset("asset/icons/common/chevron.backward.svg"),
        onPressed: didTapBackItem,
      ),
    );
  }

  List<Widget> renderRightItems() {
    List<Widget> rightItems = [];
    rightItems.add(
        IconButton(
          icon: SvgPicture.asset("asset/icons/shopping/declaration.svg"),
          onPressed: didTapBackItem,
        ));
    rightItems.add(
        IconButton(
          icon: SvgPicture.asset("asset/icons/shopping/share.svg"),
          onPressed: didTapBackItem,
        ));
    return rightItems;
  }

  Widget renderBottomButtons() {


    return Container(
      padding: EdgeInsets.only(bottom: 20),
      height: 90,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          renderLikeButton(),
          renderOrderButton(),
        ],
      ),
    );
  }

  Widget renderLikeButton() {
    final likeCntStyle = TextStyle(
        fontSize: 12,
        color: PINK_COLOR,
        fontWeight: FontWeight.w500
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 35,
          width: 40,
          child: IconButton(
              onPressed: didTapLikeButton,
              icon: SvgPicture.asset("asset/icons/common/favorite_border.fill.svg")
          ),
        ),
        Text('23', style: likeCntStyle,),
      ],
    );
  }

  Widget renderOrderButton() {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 8),
      margin: EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      width: MediaQuery.of(context).size.width-90,
      child: ElevatedButton(
        onPressed: didTapOrderButton,
        child: Text("1:1 요청하기", style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14
        ),),
        style: ElevatedButton.styleFrom(
            backgroundColor: PURPLE_COLOR,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            elevation: 0
        ),
      ),
    );
  }

  /// 이벤트 메소드 정의
  void didTapBackItem() {
    Navigator.of(context).pop();
  }

  void didTapLikeButton() {
    print("didTapLikeButton");
  }

  void didTapOrderButton() {
    print("didTapOrderButton");
  }
}