import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';
import 'package:psr/presenter/shopping/shopping_service.dart';
import 'package:psr/product/view/add_product_screen.dart';
import 'package:psr/product/view/declaration_dialog.dart';

import '../../common/const/colors.dart';
import '../../model/data/shopping/product_model.dart';
import '../../presenter/shopping/kakao_share_with_dynamic_link.dart';

class ProductDetailAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String category;
  final bool isMyProduct;
  final int productId;
  final Product? productData;

  static const double APPBAR_HEIGHT = 50;

  const ProductDetailAppBar({
    required this.category,
    required this.isMyProduct,
    required this.productId,
    required this.productData,
    Key? key
  }) : super(key: key);

  @override
  State<ProductDetailAppBar> createState() => _ProductDetailAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(APPBAR_HEIGHT);
}

class _ProductDetailAppBarState extends State<ProductDetailAppBar> {

  final titleStyle = const TextStyle(
      color: Colors.black,
      fontSize: 17
  );

  @override
  DefaultAppBarLayout build(BuildContext context) {
    return DefaultAppBarLayout(
        titleText: getTrimmedCategory(),
        rightItems: renderRightItems()
    );
  }

  /// rendering methods
  List<Widget> renderRightItems() {
    List<Widget> rightItems = [];
    if (widget.isMyProduct) {
      rightItems.add(
          IconButton(
            icon: SvgPicture.asset("asset/icons/shopping/share.svg", width: 20,),
            onPressed: didTapShareButton,
          )
      );
      rightItems.add(
          IconButton(
            icon: SvgPicture.asset("asset/icons/shopping/more_vertical.svg", width: 20,),
            onPressed: didTapMoreButton,
          )
      );
    } else {
      rightItems.add(
          IconButton(
            icon: SvgPicture.asset("asset/icons/shopping/declaration.svg", width: 23,),
            onPressed: didTapDeclarationButton,
          )
      );
      rightItems.add(
          IconButton(
            icon: SvgPicture.asset("asset/icons/shopping/share.svg", width: 20,),
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
                    child: const Text("수정", style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                    ),
                    ),
                  )
              ),
              const Divider(color: GRAY_0_COLOR, height: 0.1,),
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
                    child: const Text("삭제", style: TextStyle(
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
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) {
          return DeclarationDialog(idx: widget.productId, type: DeclarationType.PRODUCT,);
        }
    );
  }

  void didTapShareButton() async {
    String link = await KakaoShareWithDynamicLink().buildDynamicLink(widget.productId);

    KakaoShareWithDynamicLink()
        .isKakaotalkInstalled()
        .then((isInstalled) {
          if(isInstalled) {
            KakaoShareWithDynamicLink().shareMyCode(widget.productData, link);
          } else {
            Fluttertoast.showToast(msg: '카카오톡이 설치되어 있지 않습니다!', gravity: ToastGravity.BOTTOM);
          }
    });
  }

  void didTapEditButton() {
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (_) => AddProductScreen(
              category: widget.category,
              data: widget.productData,
              productId: widget.productId,
            )
        )
    );
  }

  Future<void> didDeleteEditButton() async {
    final result = await ShoppingService().deleteProduct(widget.productId);
    if (result) {
      Navigator.of(context).popUntil((route) => route.isFirst);
    } else {
      // TODO: response 중 code를 통한 상품 삭제 예외처리 추가
    }
  }
}
