import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:psr/common/const/colors.dart';
import 'package:psr/common/view/web_view_screen.dart';

class AgreeToTerms extends StatefulWidget {
  const AgreeToTerms({Key? key}) : super(key: key);

  @override
  State<AgreeToTerms> createState() => _AgreeToTermsState();
}

class _AgreeToTermsState extends State<AgreeToTerms> {

  bool isAgree = false;
  
  final List<List<String>> terms = [
    // TODO: 약관 링크 제공받을 경우 수정할 예정
    ['개인정보 수집 동의', 'https://www.naver.com',]
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0 * terms.length,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: terms.map(
                (e) => getTermButton(e.elementAt(0), e.elementAt(1)))
            .toList(),

      ),
    );
  }

  Widget getTermButton(String title, String url) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: GRAY_1_COLOR.withOpacity(0.3),
            blurRadius: 3.0,
            spreadRadius: 1.0,
          ),
        ]
      ),
      child: ElevatedButton(
          onPressed: (){ didTapTermButton(title, url); },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Colors.white),
            )
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [


                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: IconButton(
                    onPressed: (){
                      setState(() {
                        isAgree = !isAgree;
                      });
                    },
                    icon: isAgree
                        // ? SvgPicture.asset('asset/icons/common/check_purple_icon.svg', width: 30, height: 30,)
                        ? const Icon(Icons.check_circle_outline, color: PURPLE_COLOR,size: 30,)
                        : const Icon(Icons.check_circle_sharp, color: GRAY_0_COLOR,size: 30,),
                    padding: EdgeInsets.zero,
                  ),
                ),


                Text(title, style: const TextStyle(fontSize: 16, color: GRAY_3_COLOR),),
                Expanded(child: Container()),
                Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: const Icon(Icons.arrow_forward_ios, color: GRAY_4_COLOR, size: 18,)
                )
              ],
            ),
          )
      ),
    );
  }

  void didTapTermButton(String title, String url) {
    setState(() {
      isAgree = true;
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => WebViewScreen(appbarTitle: title, url: url)));
    });
  }
}
