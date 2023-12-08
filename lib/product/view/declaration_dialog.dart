import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:psr/common/const/colors.dart';
import 'package:psr/model/network/cutsom_interceptor.dart';
import 'package:psr/presenter/review/review_service.dart';
import 'package:psr/presenter/shopping/shopping_service.dart';
import 'package:psr/product/view/success_declaration_screen.dart';

enum DeclarationType { PRODUCT, REVIEW }

class DeclarationDialog extends StatefulWidget {
  final int idx;
  final DeclarationType type;

  const DeclarationDialog({
    required this.idx,
    required this.type,
    Key? key
  }) : super(key: key);

  @override
  State<DeclarationDialog> createState() => _DeclarationDialogState();
}

class _DeclarationDialogState extends State<DeclarationDialog> {
  String? selectedReason;

  List<String> reasonList = [
    "스팸홍보/도배", "욕설/혐오/차별", "음란물/유해한 정보", "사기/불법정보", "게시글에 부적합함"
  ];

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: Container(
        height: 400,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            renderXButton(),
            renderTopView(),
            renderDeclarationButton(),
          ],
        ),
      ),
    );
  }

  /// rendering methods
  Widget renderXButton() {
    return Positioned(
      top: 5, right: 10,
      child: IconButton(
          onPressed: (){ Navigator.pop(context); },
          icon: const Icon(Icons.close, color: Colors.black,)
      ),
    );
  }

  Widget renderTopView() {
    return Positioned(
      top: 45, right: 0, left: 0,
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          renderTitle(),
          renderGuide(),
          renderReasonGridView(),
        ],
      ),
    );
  }

  Widget renderTitle() {
    const TextStyle titleStyle = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 18,
      color: GRAY_4_COLOR,
    );
    return const Text("신고하기", style: titleStyle,);
  }

  Widget renderGuide() {
    const TextStyle guideStyle = TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 12,
      color: GRAY_2_COLOR,
    );

    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        "타당한 신고 사유를 선택해주세요.\n신고 사유에 맞지 않는 신고를 하시 경우,\n해당 신고는 처리되지 않습니다.",
        style: guideStyle,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget renderReasonGridView() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          childAspectRatio: 130/40, // 가로/세로 비율
          children: reasonList.map((e) =>
              Row(
                  children: [
                    TextButton.icon(
                      onPressed: (){ selectReason(e); },
                      icon: (selectedReason == e)
                          ? SvgPicture.asset('asset/icons/custom_dialog/circle_check.fill.svg', width: 20,)
                          : SvgPicture.asset('asset/icons/custom_dialog/circle_check.svg', width: 20,),
                      label: Text(e, style: const TextStyle(
                          fontSize: 12,
                          color: GRAY_4_COLOR
                      ),),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(left: 10),
                        iconColor: GRAY_1_COLOR,
                      ),
                    )
                  ]
              )
          ).toList(),
        ),
      ),
    );
  }

  Widget renderDeclarationButton() {
    const TextStyle declarationBtnStyle = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 14,
      color: Colors.white,
    );

    return Positioned(
      bottom: 20, right: 5, left: 5,
      height: 40,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: ElevatedButton(
          onPressed: (selectedReason == null) ? null : didTapDeclarationButton,
          style: ElevatedButton.styleFrom(
            backgroundColor: PURPLE_COLOR,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
          ),
          child: const Text("신고하기", style: declarationBtnStyle,),
        ),
      ),
    );
  }

  /// event methods
  void selectReason(String selected) {
    setState(() { selectedReason = selected; });
  }

  Future<void> didTapDeclarationButton() async {
    if (selectedReason != null) {
      switch (widget.type) {
        case DeclarationType.PRODUCT:
          if (selectedReason! == reasonList[4]) { selectedReason = '게시글 성격에 부적합함'; }
          final result = await ShoppingService().declareProduct('${widget.idx}', selectedReason!)
              .catchError((error) {
                debugPrint('error : ${error}');
                Fluttertoast.showToast(
                    msg: CustomInterceptor().errorMsg ?? "게시물 신고에 실패하였습니다.",
                    gravity: ToastGravity.CENTER
                );
              });

          if (result) { Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SuccessDeclarationScreen())); }

        case DeclarationType.REVIEW:
          final result = await ReviewService().declareReview('${widget.idx}', selectedReason!)
              .catchError((error) {
                debugPrint('error : ${error}');
                Fluttertoast.showToast(
                    msg: CustomInterceptor().errorMsg ?? "리뷰 신고에 실패하였습니다.",
                    gravity: ToastGravity.CENTER
                );
              });

          if (result) { Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SuccessDeclarationScreen())); }
      }
    }
  }
}
