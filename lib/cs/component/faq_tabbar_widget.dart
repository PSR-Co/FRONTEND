import 'package:flutter/material.dart';
import 'package:psr/cs/view/detail_faq_screen.dart';
import 'package:toggle_list/toggle_list.dart';

import '../../common/const/colors.dart';
import '../../model/data/cs/faq_model.dart';
import '../../presenter/cs/cs_service.dart';

class FAQTabBarWidget extends StatefulWidget {
  final String type;

  const FAQTabBarWidget({required this.type, Key? key}) : super(key: key);

  @override
  State<FAQTabBarWidget> createState() => _FAQTabBarWidgetState();
}

class _FAQTabBarWidgetState extends State<FAQTabBarWidget> {
  final TextStyle faqCategoryTextStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w500, color: GRAY_2_COLOR);
  final TextStyle faqTitleTextStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  final TextStyle faqContentTextStyle = const TextStyle(
      fontSize: 12.0, fontWeight: FontWeight.w400, color: GRAY_4_COLOR);
  FAQModel? data;

  List<FAQ> faqList = [];

  Future<dynamic> fetchData() async {
    Map<String, String>? type;
    if (widget.type != '전체') {
      type = {'type': widget.type};
    }
    return await CSService().getFAQData(type);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('에러가 있습니다'),
            );
          } else if (snapshot.hasData) {
            data = FAQModel.fromJson(snapshot.data);
            if (data?.data.faqLists == null) {
              return const Center(
                child: Text('질문이 없습니다.'),
              );
            } else {
              faqList = data!.data.faqLists;
            }
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text('질문이 없습니다.'),
            );
          } else {
            return Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                child: const CircularProgressIndicator());
          }
          return mainFAQView(faqList);
        });
  }

  Widget mainFAQView(List<FAQ> faqList) {
    return ToggleList(
        innerPadding: EdgeInsets.zero,
        divider: Container(
          width: MediaQuery.of(context).size.width,
          height: 1,
          color: GRAY_0_COLOR,
        ),
        toggleAnimationDuration: const Duration(milliseconds: 10),
        trailing: const Text(""),
        children: faqList
            .map(
              (e) => ToggleListItem(
                  title: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 17.0),
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.centerLeft,
                    height: 65.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            width: 60.0,
                            alignment: Alignment.center,
                            child: Text(
                              e.type,
                              style: faqCategoryTextStyle,
                            )),
                        Container(
                          width: 1,
                          height: 16,
                          color: PURPLE_COLOR,
                          margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        ),
                        Expanded(
                          child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                e.title,
                                style: faqTitleTextStyle,
                              )),
                        ),
                      ],
                    ),
                  ),
                  content: DetailFAQScreen(faqId: e.faqId)),
            )
            .toList()
    );
  }
}
