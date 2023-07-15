import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';
import 'package:psr/product/view/declaration_dialog.dart';

import '../../common/const/colors.dart';

class ProductDetailAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String category;
  final bool isMyProduct;

  static const double APPBAR_HEIGHT = 50;

  const ProductDetailAppBar({
    required this.category,
    required this.isMyProduct,
    Key? key
  }) : super(key: key);

  @override
  State<ProductDetailAppBar> createState() => _ProductDetailAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(APPBAR_HEIGHT);
}

class _ProductDetailAppBarState extends State<ProductDetailAppBar> {

  final titleStyle = TextStyle(
      color: Colors.black,
      fontSize: 17
  );

  @override
  DefaultAppBarLayout build(BuildContext context) {
    return DefaultAppBarLayout(
        titleText: getTrimmedCategory(),
        // leftItem: renderleftItem(),
        rightItems: renderRightItems()
    );
  }

  /// rendering methods
  List<Widget> renderRightItems() {
    List<Widget> rightItems = [];
    if (widget.isMyProduct) {
      rightItems.add(
          IconButton(
            icon: SvgPicture.asset("asset/icons/shopping/more_vertical.svg"),
            onPressed: didTapMoreButton,
          )
      );
    } else {
      rightItems.add(
          IconButton(
            icon: SvgPicture.asset("asset/icons/shopping/declaration.svg"),
            onPressed: didTapDeclarationButton,
          )
      );
      rightItems.add(
          IconButton(
            icon: SvgPicture.asset("asset/icons/shopping/share.svg"),
            onPressed: didTapShareButton,
          )
      );
    }

    return rightItems;
  }

  /// helper methods
  String getTrimmedCategory() {
    String category = widget.category;
    if (category.contains('\n')) {
      category = category.replaceAll('\n', ' ');
    }
    return category;
  }

  /// event methods
  void didTapMoreButton() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) {
          return Stack(
            children: [
              Positioned(
                  left: 0, right: 0, bottom: 65.1,
                  height: 65,
                  child: ElevatedButton(
                    onPressed: didTapEditButton,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: Text("수정", style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                    ),
                    ),
                  )
              ),
              Divider(color: GRAY_0_COLOR, height: 0.1,),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  height: 65,
                  child: ElevatedButton(
                    onPressed: didDeleteEditButton,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: Text("삭제", style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.red
                    ),
                    ),
                  )
              ),
            ],
          );
        }
    );
  }

  void didTapDeclarationButton() {
    // TODO: 신고하기 팝업 띄우기
    print("didTapDeclarationButton");
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) {
          return DeclarationDialog();
        }
    );
  }

  void didTapShareButton() {
    print("didTapShareButton");
  }

  void didTapEditButton() {
    print("didTapEditButton");
  }

  void didDeleteEditButton() {
    print("didDeleteEditButton");
  }
}
