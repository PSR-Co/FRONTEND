import 'package:flutter/material.dart';
import 'package:psr/common/layout/circular_progress_indicator.dart';
import 'package:psr/presenter/myinfo/myinfo_service.dart';
import '../../auth/view/login_screen.dart';
import '../../common/const/colors.dart';
import '../../model/data/myinfo/myinfo_model.dart';
import '../component/common_dialog.dart';
import '../component/second_dialog.dart';

class LogoutDialog extends StatefulWidget {
  const LogoutDialog({super.key});

  @override
  State<LogoutDialog> createState() => _LogoutDialogState();
}

class _LogoutDialogState extends State<LogoutDialog> {
  final TextStyle headerTextStyle = const TextStyle(
      fontSize: 15.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  final TextStyle askLogoutTextStyle = const TextStyle(
      fontSize: 15.0, fontWeight: FontWeight.w400, color: GRAY_3_COLOR);
  final TextStyle answerTextStyle = const TextStyle(
      fontSize: 15.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  final TextStyle titleTextStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);

  AccountModel? data;

  Future<dynamic> fetchData() async {
    final response = await MyInfoService().logout();
    print("logout fetch: $response");
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "로그아웃",
            style: headerTextStyle,
          ),
          IconButton(
            onPressed: () {
              showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (_) {
                    return CommonDialog(
                        askTitle:
                            Text('로그아웃 하시겠어요?', style: askLogoutTextStyle),
                        alert: '로그아웃',
                        onDidTap: didLogout());
                  });
            },
            icon: const Icon(
              Icons.arrow_forward_ios,
              size: 16.0,
            ),
            padding: const EdgeInsets.only(right: 17.0, bottom: 5.0),
            constraints: const BoxConstraints(),
          )
        ],
      ),
    );
  }

  Widget didLogout() {
    return FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          print("snapshot.data : ${snapshot.data}");
          if (snapshot.hasError) {
            return const SecondDialog(result: "로그아웃에 실패했습니다.");
          } else if (snapshot.hasData) {
            data = AccountModel.fromJson(snapshot.data);
            if (data?.code != 200) {
              return const SecondDialog(result: "로그아웃에 실패했습니다.");
            }
          } else if (!snapshot.hasData) {
            return CircularProgress();
          }
          return const SecondDialog(result: "로그아웃에 성공했습니다!");
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
  //               if (result == "로그아웃에 성공했습니다!") {
  //                 Navigator.of(context).pushAndRemoveUntil(
  //                     MaterialPageRoute(builder: (_) => const LoginScreen()),
  //                     (route) => false);
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
