import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  /// 이벤트 메소드 정의
  void didTapBackItem() {
    Navigator.of(context).pop();
  }
}