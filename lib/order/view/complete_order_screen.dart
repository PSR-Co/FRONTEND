import 'package:flutter/material.dart';
import 'package:psr/auth/component/complete_widget.dart';

import '../../common/const/colors.dart';

class CompleteOrderScreen extends StatelessWidget {
  const CompleteOrderScreen({Key? key}) : super(key: key);

  final BUTTON_HEIGHT = 40.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: renderBody(context),
    );
  }

  Widget renderBody(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height/2 - 250,),
        const CompleteWidget(mainText: '요청이 완료되었습니다!\n감사합니다.'),
        const SizedBox(height: 70,),
        Row(
          children: [
            getConfirmButton(context),
            getOrderListButton(context),
          ],
        )

      ],
    );
  }

  Widget getConfirmButton(BuildContext context) {
    return Expanded(
        child: Container(
          margin: const EdgeInsets.only(left: 20),
          height: BUTTON_HEIGHT,
          child: ElevatedButton(
            onPressed: () { Navigator.of(context).pop(); },
            style: ElevatedButton.styleFrom(
              foregroundColor: GRAY_3_COLOR,
              elevation: 0,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: GRAY_1_COLOR,width: 1.0),
                borderRadius: BorderRadius.circular(25),
              )
            ),
            child: const Text('확인',)
          ),
        )
    );
  }

  Widget getOrderListButton(BuildContext context) {
    const buttonTitleStyle = TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500
    );

    return Expanded(
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 20),
          height: BUTTON_HEIGHT,
          child: ElevatedButton(
            onPressed: () {
              // TODO: 요청목록 화면으로 전환
            },
            style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: PURPLE_COLOR,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                )
            ),
            child: const Text('요청목록', style: buttonTitleStyle,)
          ),
        )
    );
  }
}
