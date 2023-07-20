import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/const/colors.dart';
import '../../common/layout/default_appbar_layout.dart';

class TermsOfUseScreen extends StatefulWidget {
  const TermsOfUseScreen({super.key});

  @override
  State<TermsOfUseScreen> createState() => _TermsOfUseScreenState();
}

class _TermsOfUseScreenState extends State<TermsOfUseScreen> {
  final TextStyle contentTextStyle = const TextStyle(fontSize: 11.5, fontWeight: FontWeight.w400, color: GRAY_4_COLOR);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    DefaultAppBarLayout(titleText: "약관안내"),
                    Expanded(child: privacyPolicyView())
                  ],
                )
            )
        )
    );
  }

  Widget privacyPolicyView(){
    return Container(
      margin: EdgeInsets.fromLTRB(17.0, 5.0, 17.0, 60.0),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: GRAY_0_COLOR)
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text("< 냉집사 >('http://icebutler.shop'이하 '냉집사')은(는) 「개인정보 보호법」 제30조에 따라 정보주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리방침을 수립·공개합니다."
              "\n○ 이 개인정보처리방침은 2023년 4월 15부터 적용됩니다."
              "\n 제1조(개인정보의 처리 목적)< 냉집사 >('http://icebutler.shop'이하 '냉집사')은(는) 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며 이용 목적이 변경되는 경우에는 「개인정보 보호법」 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다."
              "\n1. 홈페이지 회원가입 및 관리회원 가입의사 확인 목적으로 개인정보를 처리합니다.\n\n"

              "\n제2조(개인정보의 처리 및 보유 기간)① < 냉집사 >은(는) 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의받은 개인정보 보유·이용기간 내에서 개인정보를 처리·보유합니다.② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다."
              "\n<홈페이지 회원가입 및 관리>"
              "\n<홈페이지 회원가입 및 관리>와 관련한 개인정보는 수집.이용에 관한 동의일로부터<지체없이 파기>까지 위 이용목적을 위하여 보유.이용됩니다."
              "\n제3조(처리하는 개인정보의 항목)① < 냉집사 >은(는) 다음의 개인정보 항목을 처리하고 있습니다."
              "\n< 홈페이지 회원가입 및 관리 >"
              "\n필수항목 : 이름, 로그인ID, 비밀번호, 이메일\n\n"
              "\n제4조(개인정보의 파기절차 및 파기방법)"
              "\n① < 냉집사 > 은(는) 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.② 정보주체로부터 동의받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 계속 보존하여야 하는 경우에는, 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다.③ 개인정보 파기의 절차 및 방법은 다음과 같습니다.1. 파기절차< 냉집사 > 은(는) 파기 사유가 발생한 개인정보를 선정하고, < 냉집사 > 의 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다."
              "\n2. 파기방법"
              "\n전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용합니다"
              "\n "
              "\n제5조(개인정보의 안전성 확보조치에 관한 사항)< 냉집사 >은(는) 개인정보의 안전성 확보를 위해 다음과 같은 조치를 취하고 있습니다."
              "\n1. 개인정보 취급 직원의 최소화 및 교육개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화 하여 개인정보를 관리하는 대책을 시행하고 있습니다.2. 개인정보에 대한 접근 제한개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.3. 개인정보의 암호화이용자의 개인정보는 비밀번호는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다."

              "\n\n제6조(개인정보 처리방침 변경)"

              "\n① 이 개인정보처리방침은 2023년 4월 15부터 적용됩니다."
          ,style: contentTextStyle,),
        ),
      ),
    );
  }
}
