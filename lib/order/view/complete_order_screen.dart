import 'package:flutter/material.dart';
import 'package:psr/auth/component/complete_widget.dart';
import 'package:psr/mypage/view/order_list_screen.dart';
import 'package:psr/product/view/product_detail_screen.dart';
import 'package:psr/shopping/view/shopping_screen.dart';
import '../../common/const/colors.dart';

class CompleteOrderScreen extends StatelessWidget {
  const CompleteOrderScreen({Key? key}) : super(key: key);

  final BUTTON_HEIGHT = 40.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
          child: Column(
            children: [
              const Icon(Icons.check_circle, color: PURPLE_COLOR, size: 40.0,),
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text(
                    '요청이 완료되었습니다!\n감사합니다.',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: GRAY_4_COLOR
                    ),
                    textAlign: TextAlign.center,)
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width - 30) / 2,
                      height: 45,
                      padding: const EdgeInsets.only(left: 10, right: 5),
                      child: ElevatedButton(
                          onPressed: (){ didTapConfirmButton(context); },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22),
                              side: const BorderSide(color: GRAY_1_COLOR)
                            )
                          ),
                          child: const Text('확인', style: TextStyle(color: GRAY_2_COLOR, fontWeight: FontWeight.w700),)
                      ),
                    ),
                    Container(
                      width: (MediaQuery.of(context).size.width - 30) / 2,
                      height: 45,
                      padding: const EdgeInsets.only(left: 5, right: 10),
                      child: ElevatedButton(
                          onPressed: (){ didTapOrderList(context); },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: PURPLE_COLOR,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22)
                            )
                          ),
                          child: const Text('요청목록', style: TextStyle(fontWeight: FontWeight.w700),)
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void didTapConfirmButton(BuildContext context) {
    Navigator.popUntil(context, ModalRoute.withName('/productDetail'));
  }

  void didTapOrderList(BuildContext context) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const OrderListScreen(isComplete: true)));
  }
}
