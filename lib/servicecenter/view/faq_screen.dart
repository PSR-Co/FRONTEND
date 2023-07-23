import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psr/common/const/constants.dart';
import 'package:psr/common/view/body_tab.dart';
import 'package:psr/servicecenter/component/faq_list.dart';
import 'package:toggle_list/toggle_list.dart';

import '../../common/const/colors.dart';
import '../../common/layout/default_appbar_layout.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  final TextStyle faqCategoryTextStyle = const TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500, color: GRAY_2_COLOR);
  final TextStyle faqTitleTextStyle = const TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  final TextStyle faqContentTextStyle = const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: GRAY_4_COLOR);
  ///임시데이터
  List<FAQ> faqList = [
    FAQ(DetailFAQ('계정관리', '질문은 질문이에요?',
  '잘못 송금한 경우 아래 내용을 확인해주세요.\n\n1. 돈을 송금받은 수취인에게 당근마켓 채팅방을 통해 직접 연락을 부탁드려요.\n\n■ 수취인이 당근페이에 가입하지 않은 경우 아래의 방법으로 반환을 요청해 주세요.\n- 채팅 > 반환할 사용자의 채팅방 진입 > 송금 받은 메시지의 ${'되돌려 주기'} 버튼 선택 > 한 번 더 확인되는 ${'되돌려 주기'} 선택\n■ 수취인이 당근페이에 가입한 경우 아래의 방법으로 반환을 요청해 주세요.\n- 채팅 > 반환할 사용자의 채팅방 진입 > 좌측 하단의 '+' 버튼 선택 > ${'송금'} 선택\n※ 한 번 송금하면 회수할 수 없으니 금액을 잘 확인해 주세요.\n\n2. 연락이 불가하거나 해결이 되지 않을 경우, 당근페이 고객센터 문의를 접수해주세요.\n\n3. 고객센터에서 송금받은 수취인에게 알림 발송/연락 등 반환 동의를 구하기 위해 노력할게요.'),),
    FAQ(DetailFAQ('계정관리', '질문은 질문이에요?',
        '잘못 송금한 경우 아래 내용을 확인해주세요.\n\n1. 돈을 송금받은 수취인에게 당근마켓 채팅방을 통해 직접 연락을 부탁드려요.\n\n■ 수취인이 당근페이에 가입하지 않은 경우 아래의 방법으로 반환을 요청해 주세요.\n- 채팅 > 반환할 사용자의 채팅방 진입 > 송금 받은 메시지의 ${'되돌려 주기'} 버튼 선택 > 한 번 더 확인되는 ${'되돌려 주기'} 선택\n■ 수취인이 당근페이에 가입한 경우 아래의 방법으로 반환을 요청해 주세요.\n- 채팅 > 반환할 사용자의 채팅방 진입 > 좌측 하단의 '+' 버튼 선택 > ${'송금'} 선택\n※ 한 번 송금하면 회수할 수 없으니 금액을 잘 확인해 주세요.\n\n2. 연락이 불가하거나 해결이 되지 않을 경우, 당근페이 고객센터 문의를 접수해주세요.\n\n3. 고객센터에서 송금받은 수취인에게 알림 발송/연락 등 반환 동의를 구하기 위해 노력할게요.')),
    FAQ(DetailFAQ('계정관리', '질문은 질문이에요?',
        '잘못 송금한 경우 아래 내용을 확인해주세요.\n\n1. 돈을 송금받은 수취인에게 당근마켓 채팅방을 통해 직접 연락을 부탁드려요.\n\n■ 수취인이 당근페이에 가입하지 않은 경우 아래의 방법으로 반환을 요청해 주세요.\n- 채팅 > 반환할 사용자의 채팅방 진입 > 송금 받은 메시지의 ${'되돌려 주기'} 버튼 선택 > 한 번 더 확인되는 ${'되돌려 주기'} 선택\n■ 수취인이 당근페이에 가입한 경우 아래의 방법으로 반환을 요청해 주세요.\n- 채팅 > 반환할 사용자의 채팅방 진입 > 좌측 하단의 '+' 버튼 선택 > ${'송금'} 선택\n※ 한 번 송금하면 회수할 수 없으니 금액을 잘 확인해 주세요.\n\n2. 연락이 불가하거나 해결이 되지 않을 경우, 당근페이 고객센터 문의를 접수해주세요.\n\n3. 고객센터에서 송금받은 수취인에게 알림 발송/연락 등 반환 동의를 구하기 위해 노력할게요.'),),
    FAQ(DetailFAQ('컨설팅', '질문은 질문이에요?',
        '잘못 송금한 경우 아래 내용을 확인해주세요.\n\n1. 돈을 송금받은 수취인에게 당근마켓 채팅방을 통해 직접 연락을 부탁드려요.\n\n■ 수취인이 당근페이에 가입하지 않은 경우 아래의 방법으로 반환을 요청해 주세요.\n- 채팅 > 반환할 사용자의 채팅방 진입 > 송금 받은 메시지의 ${'되돌려 주기'} 버튼 선택 > 한 번 더 확인되는 ${'되돌려 주기'} 선택\n■ 수취인이 당근페이에 가입한 경우 아래의 방법으로 반환을 요청해 주세요.\n- 채팅 > 반환할 사용자의 채팅방 진입 > 좌측 하단의 '+' 버튼 선택 > ${'송금'} 선택\n※ 한 번 송금하면 회수할 수 없으니 금액을 잘 확인해 주세요.\n\n2. 연락이 불가하거나 해결이 되지 않을 경우, 당근페이 고객센터 문의를 접수해주세요.\n\n3. 고객센터에서 송금받은 수취인에게 알림 발송/연락 등 반환 동의를 구하기 위해 노력할게요.'),),
    FAQ(DetailFAQ('컨설팅', '질문은 질문이에요?',
        '잘못 송금한 경우 아래 내용을 확인해주세요.\n\n1. 돈을 송금받은 수취인에게 당근마켓 채팅방을 통해 직접 연락을 부탁드려요.\n\n■ 수취인이 당근페이에 가입하지 않은 경우 아래의 방법으로 반환을 요청해 주세요.\n- 채팅 > 반환할 사용자의 채팅방 진입 > 송금 받은 메시지의 ${'되돌려 주기'} 버튼 선택 > 한 번 더 확인되는 ${'되돌려 주기'} 선택\n■ 수취인이 당근페이에 가입한 경우 아래의 방법으로 반환을 요청해 주세요.\n- 채팅 > 반환할 사용자의 채팅방 진입 > 좌측 하단의 '+' 버튼 선택 > ${'송금'} 선택\n※ 한 번 송금하면 회수할 수 없으니 금액을 잘 확인해 주세요.\n\n2. 연락이 불가하거나 해결이 되지 않을 경우, 당근페이 고객센터 문의를 접수해주세요.\n\n3. 고객센터에서 송금받은 수취인에게 알림 발송/연락 등 반환 동의를 구하기 위해 노력할게요.'),),
    FAQ(DetailFAQ('상품', '질문은 질문이에요?',
        '잘못 송금한 경우 아래 내용을 확인해주세요.\n\n1. 돈을 송금받은 수취인에게 당근마켓 채팅방을 통해 직접 연락을 부탁드려요.\n\n■ 수취인이 당근페이에 가입하지 않은 경우 아래의 방법으로 반환을 요청해 주세요.\n- 채팅 > 반환할 사용자의 채팅방 진입 > 송금 받은 메시지의 ${'되돌려 주기'} 버튼 선택 > 한 번 더 확인되는 ${'되돌려 주기'} 선택\n■ 수취인이 당근페이에 가입한 경우 아래의 방법으로 반환을 요청해 주세요.\n- 채팅 > 반환할 사용자의 채팅방 진입 > 좌측 하단의 '+' 버튼 선택 > ${'송금'} 선택\n※ 한 번 송금하면 회수할 수 없으니 금액을 잘 확인해 주세요.\n\n2. 연락이 불가하거나 해결이 되지 않을 경우, 당근페이 고객센터 문의를 접수해주세요.\n\n3. 고객센터에서 송금받은 수취인에게 알림 발송/연락 등 반환 동의를 구하기 위해 노력할게요.'),),
  ];
  List<DetailFAQ> totalList = [];
  List<DetailFAQ> accountList = [];
  List<DetailFAQ> consultList = [];
  List<DetailFAQ> productList = [];

  @override
  Widget build(BuildContext context) {
    checkCategory(); //카테고리 확인 후 각 리스트에 담기

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: BodyTab(
          titleList: FAQ_LIST_TAP, tabBarViewChild: [mainFAQView(totalList), mainFAQView(accountList),mainFAQView(consultList),mainFAQView(productList)], tabTitle: DefaultAppBarLayout(titleText: "자주 묻는 질문"),
        ),
      ),
    );
  }

  Widget mainFAQView(List<DetailFAQ> detailList){
    return ToggleList(
        innerPadding: EdgeInsets.zero,
        divider: Container(width:MediaQuery.of(context).size.width , height:1, color: GRAY_0_COLOR,),
        toggleAnimationDuration: Duration(milliseconds: 10),
        trailing: Text(""),
        children: detailList.map((e) =>
            ToggleListItem(
              title: Container(
                margin: EdgeInsets.symmetric(horizontal: 17.0),
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                height: 65.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: 60.0, alignment: Alignment.center,
                        child: Text(e.faqType, style: faqCategoryTextStyle,)),
                    Container(width: 1, height: 16, color: PURPLE_COLOR, margin: EdgeInsets.symmetric(horizontal: 20.0),),
                    Expanded(
                      child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(e.title, style: faqTitleTextStyle,)),
                    ),
                  ],
                ),
              ),
              content: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 17.0, vertical: 30.0),
                alignment: Alignment.centerLeft,
                color: PURPLE_COLOR_10,
                child: Text(CONTENT) ),
            ),
        ).toList()
    );
  }

  checkCategory(){
    for(var faq in faqList){
      totalList.add(faq.faqType);
      if(faq.faqType.faqType == '계정관리'){accountList.add(faq.faqType); }
      else if(faq.faqType.faqType == '컨설팅'){consultList.add(faq.faqType);}
      else if(faq.faqType.faqType == '상품'){productList.add(faq.faqType);}
      print('account : ${accountList.toString()}');
      print('consult : ${consultList.toString()}');
      print('product : ${productList.toString()}');
    }
  }
}
