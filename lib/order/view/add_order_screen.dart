import 'package:flutter/material.dart';
import 'package:psr/common/const/colors.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';

class AddOrderScreen extends StatefulWidget {
  const AddOrderScreen({Key? key}) : super(key: key);

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarLayout(titleText: '요청하기',),
      body: renderBody(),
      bottomNavigationBar: renderBottomButton(),
    );
  }

  Widget renderBody() {
    return Column(

    );
  }

  Widget renderBottomButton() {
    final titleStyle = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w700,
      color: Colors.white
    );

    return Container(
      margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
      height: 40.0,
      child: ElevatedButton(
        onPressed: didTapOrderButton,
        child: Text('판매자에게 요청하기', style: titleStyle,),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: PURPLE_COLOR,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )
        ),
      ),
    );
  }

  /// event methods
  void didTapOrderButton() {
    // TODO: 작성된 요청 검토 및 POST
    print("didTapOrderButton");
  }
}
