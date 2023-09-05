import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/const/colors.dart';
import '../../common/layout/default_appbar_layout.dart';
import '../../presenter/review/review_service.dart';
import '../view/add_review_screen.dart';

class ReviewDetailAppbar extends StatefulWidget implements PreferredSizeWidget {
  final int? reviewId;
  static const double APPBAR_HEIGHT = 50;

  const ReviewDetailAppbar({
    required this.reviewId,
    Key? key
  }) : super(key: key);

  @override
  State<ReviewDetailAppbar> createState() => _ReviewDetailAppbarState();

  @override
  Size get preferredSize => Size.fromHeight(APPBAR_HEIGHT);
}

class _ReviewDetailAppbarState extends State<ReviewDetailAppbar> {
  @override
  DefaultAppBarLayout build(BuildContext context) {
    return DefaultAppBarLayout(
        titleText: getTitle(),
        rightItems: renderRightItems()
    );
  }

  String getTitle() {
    return (widget.reviewId == null) ? '리뷰 작성' : '리뷰';
  }

  List<Widget> renderRightItems() {
    List<Widget> rightItems = [];
    if (widget.reviewId != null) {
        rightItems.add(
            IconButton(
              icon: SvgPicture.asset("asset/icons/shopping/more_vertical.svg"),
              onPressed: didTapMoreButton,
            )
        );
    }
    return rightItems;
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

  void didTapEditButton() {
    AddReviewScreenState? parent = context.findAncestorStateOfType<AddReviewScreenState>();
    parent?.setEditMode();
    Navigator.of(context).pop();
  }

  Future<void> didDeleteEditButton() async {
    final result = await ReviewService().deleteReview(widget.reviewId!);
    if (result) {
      Navigator.of(context).popUntil((route) => route.isFirst);
    } else {
      // TODO: response 중 code를 통한 상품 삭제 예외처리 추가
    }
  }
}
