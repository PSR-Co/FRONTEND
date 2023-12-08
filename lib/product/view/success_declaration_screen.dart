import 'package:flutter/material.dart';
import 'package:psr/common/const/colors.dart';

class SuccessDeclarationScreen extends StatefulWidget {
  const SuccessDeclarationScreen({Key? key}) : super(key: key);

  @override
  State<SuccessDeclarationScreen> createState() => _SuccessDeclarationScreenState();
}

class _SuccessDeclarationScreenState extends State<SuccessDeclarationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: renderBody(),
    );
  }

  Widget renderBody() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 4,),
          const Icon(Icons.check_circle, color: PURPLE_COLOR, size: 40,),
          const SizedBox(height: 10,),
          const Text('신고가 완료되었습니다!\n감사합니다.', style: TextStyle(fontSize: 16, color: Colors.black), textAlign: TextAlign.center,),
          SizedBox(height: MediaQuery.of(context).size.height / 13,),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 42,
            child: ElevatedButton(
              onPressed: (){ Navigator.of(context).pop(); Navigator.of(context).pop(); },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.white,
                side: const BorderSide(color: GRAY_1_COLOR, width: 1,),
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(21)))
              ),
              child: const Text('확인', style: TextStyle(fontSize: 13, color: GRAY_3_COLOR),),
            ),
          )
        ],
      ),
    );
  }
}
