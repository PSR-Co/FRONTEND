import 'package:flutter/material.dart';

class AgreeToTerms extends StatefulWidget {
  const AgreeToTerms({Key? key}) : super(key: key);

  @override
  State<AgreeToTerms> createState() => _AgreeToTermsState();
}

class _AgreeToTermsState extends State<AgreeToTerms> {

  final List<List<String>> terms = [
    ['개인정보 수집 동의', 'www.naver.com',]
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 45.0 * terms.length,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: terms.map(
                (e) => getTermButton(e.elementAt(0), e.elementAt(1)))
            .toList(),

      ),
    );
  }

  Widget getTermButton(String title, String url) {
    return ElevatedButton(
        onPressed: (){ print('${url}로 이동하는 웹뷰 띄우기'); },
        style: ElevatedButton.styleFrom(

        ),
        child: Text(title)
    );
  }
}
