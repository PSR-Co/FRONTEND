import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psr/myinfo/component/second_dialog.dart';

import '../../auth/view/login_screen.dart';
import '../../common/const/colors.dart';
import '../../common/layout/circular_progress_indicator.dart';
import '../../model/data/myinfo/myinfo_model.dart';
import '../../presenter/myinfo/myinfo_service.dart';
import '../component/common_dialog.dart';

class WithdrawalDialog extends StatefulWidget {
  const WithdrawalDialog({super.key});

  @override
  State<WithdrawalDialog> createState() => _WithdrawalDialogState();
}

class _WithdrawalDialogState extends State<WithdrawalDialog> {
  final TextStyle alertWithdrawalTextStyle = const TextStyle(
      fontSize: 11.0, fontWeight: FontWeight.w400, color: GRAY_3_COLOR);
  final TextStyle answerWithdrawalTextStyle = const TextStyle(
      fontSize: 15.0, fontWeight: FontWeight.w500, color: GRAY_3_COLOR);
  final TextStyle answerTextStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w700, color: Colors.white);
  final TextStyle withdrawalTextStyle = const TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: GRAY_3_COLOR,
      decoration: TextDecoration.underline);
  final TextStyle titleTextStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);

  AccountModel? data;

  Future<dynamic> fetchData() async {
    final response = await MyInfoService().withdrawal();
    print("withdrawal fetch: $response");
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.centerLeft,
        child: TextButton(
            onPressed: () {
              showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (_) {
                    return CommonDialog(
                        askTitle: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '회원탈퇴시 모든 정보를 잃게 됩니다.',
                                  style: alertWithdrawalTextStyle,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    '그래도 탈퇴하시겠어요?',
                                    style: answerWithdrawalTextStyle,
                                  ),
                                ),
                              ],
                            )),
                        alert: '탈퇴',
                        onDidTap: onDidWithdrawal());
                  });
            },
            child: Text("회원탈퇴", style: withdrawalTextStyle)
        )
    );
  }

  Widget onDidWithdrawal() {
    return FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          print("withdrawal data : ${snapshot.data}");
          if (snapshot.hasError) {
            return const SecondDialog(result: "회원탈퇴에 실패했습니다.");
          } else if (snapshot.hasData) {
            data = AccountModel.fromJson(snapshot.data);
            if (data?.code != 200) {
              return const SecondDialog(result: "회원탈퇴에 실패했습니다.");
            }
          } else if (!snapshot.hasData) {
            return const CircularProgress();
          }
          return const SecondDialog(result: "회원탈퇴가 완료되었습니다.");
        });
  }

  // AlertDialog alertDialog(String result) {
  //   return AlertDialog(
  //     backgroundColor: Colors.white,
  //     actionsAlignment: MainAxisAlignment.spaceEvenly,
  //     titlePadding: EdgeInsets.zero,
  //     shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
  //     elevation: 0.0,
  //     content: Container(
  //       height: 100,
  //       alignment: Alignment.center,
  //       child: Text(result, style: answerTextStyle),
  //     ),
  //     actions: <Widget>[
  //       SizedBox(
  //         width: MediaQuery.of(context).size.width,
  //         child: TextButton(
  //             onPressed: () {
  //               if (result == "회원탈퇴에 성공했습니다!") {
  //                 Navigator.of(context).pushAndRemoveUntil(
  //                     MaterialPageRoute(builder: (_) => const LoginScreen()),
  //                         (route) => false);
  //               } else {
  //                 Navigator.of(context).pop();
  //               }
  //             },
  //             child: Text(
  //               "확인",
  //               style: titleTextStyle,
  //             )),
  //       )
  //     ],
  //   );
  // }
}
