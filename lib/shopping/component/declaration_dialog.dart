import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:psr/common/const/colors.dart';

class DeclarationDialog extends StatefulWidget {
  const DeclarationDialog({Key? key}) : super(key: key);

  @override
  State<DeclarationDialog> createState() => _DeclarationDialogState();
}

class _DeclarationDialogState extends State<DeclarationDialog> {
  String? selectedReason;

  @override
  Widget build(BuildContext context) {
    List<String> reasonList = [
      "스팸홍보/도배", "욕설/혐오/차별", "음란물/유해한 정보", "사기/불법정보", "게시글에 부적합함"
    ];


    final TextStyle titleStyle = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 18,
      color: GRAY_4_COLOR,
    );

    final TextStyle guideStyle = TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 12,
      color: GRAY_2_COLOR,
    );

    final TextStyle declarationBtnStyle = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 14,
      color: Colors.white,
    );




    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: Container(
        height: 400,
        width: MediaQuery.of(context).size.width ,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 5, right: 10,
              child: IconButton(
                  onPressed: (){ Navigator.pop(context); },
                  icon: Icon(Icons.close, color: Colors.black,)
              ),
            ),
            Positioned(
              top: 50, right: 0, left: 0,
              height: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("신고하기", style: titleStyle,),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Text(
                      "타당한 신고 사유를 선택해주세요.\n신고 사유에 맞지 않는 신고를 하시 경우,\n해당 신고는 처리되지 않습니다.",
                      style: guideStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      child: GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        childAspectRatio: 130/40, /// 가로/세로 비율
                        children: reasonList.map((e) =>
                            Row(
                                children: [
                                  TextButton.icon(
                                    onPressed: (){ selectReason(e); },
                                    icon: (selectedReason == e)
                                        ? SvgPicture.asset('asset/icons/custom_dialog/circle_check.fill.svg', width: 20,)
                                        : SvgPicture.asset('asset/icons/custom_dialog/circle_check.svg', width: 20,),
                                    label: Text(e, style: TextStyle(
                                        fontSize: 12,
                                        color: GRAY_4_COLOR
                                    ),),
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.only(left: 10),
                                      iconColor: GRAY_1_COLOR,

                                    ),
                                  )
                                ]
                            )
                        ).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),


            Positioned(
              bottom: 20, right: 5, left: 5,
              height: 40,
              child: Container(
                // width: MediaQuery.of(context).size.width - 30,
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: ElevatedButton(
                  onPressed: didTapDeclarationButton,
                  child: Text("신고하기", style: declarationBtnStyle,),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PURPLE_COLOR,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// event methods
  void selectReason(String selected) {
    setState(() {
      selectedReason = selected;
    });
  }

  void didTapDeclarationButton() {
    if (selectedReason != null) {
      print("신고하기 버튼 탭 -> 선택된 신고 사유 : ${selectedReason}");
      Navigator.pop(context);
    } else {
      print("신고하기 버튼 탭 -> 선택된 신고 사유 없음");
    }
  }
}
