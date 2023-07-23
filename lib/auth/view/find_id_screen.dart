import 'package:flutter/material.dart';

import '../../common/layout/default_appbar_layout.dart';
import '../../common/layout/purple_filled_button.dart';
import '../component/input_user_info.dart';
import 'show_user_id_screen.dart';

class FindIDScreen extends StatefulWidget {
  const FindIDScreen({Key? key}) : super(key: key);

  @override
  State<FindIDScreen> createState() => _FindIDScreenState();
}

class _FindIDScreenState extends State<FindIDScreen> {
  bool isFounded = false;
  bool isInputValid = true; // for test

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumController = TextEditingController();
  final TextEditingController validCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const DefaultAppBarLayout(titleText: '아이디 찾기',),
      body: renderBody(),
      bottomNavigationBar: PurpleFilledButton(
        title: '다음',
        onPressed: didTapNextButton,
        height: 40,
      ),
    );
  }

  Widget renderBody() {
    return ListView(
      children: [
        const SizedBox(height: 50,),
        InputUserInfo(
          nameController: nameController,
          phoneNumController: phoneNumController,
          validCodeController: validCodeController,
        ),
      ],
    );
  }


  /// event methods
  void didTapNextButton() {
    setState(() {
      if (isInputValid) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => const ShowUserIDScreen()), (route) => false
        );
      }
    });
  }

}
