import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psr/model/data/cs/faq_model.dart';
import 'package:psr/presenter/cs/cs_service.dart';

import '../../common/const/colors.dart';

class DetailFAQScreen extends StatefulWidget {
  int faqId;
  DetailFAQScreen({required this.faqId, Key? key}):super(key: key);

  @override
  State<DetailFAQScreen> createState() => _DetailFAQScreenState();
}

class _DetailFAQScreenState extends State<DetailFAQScreen> {

  DetailFAQModel? data;
  Future<dynamic> fetchData(int faqId) async {
    return await CSService().getFAQDetailData(faqId);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchData(widget.faqId),
      builder: (context, snapshot) {
        if(snapshot.hasError){
          return const Center(
            child: Text('에러가 있습니다'),
          );
        }else if(snapshot.hasData){
          data = DetailFAQModel.fromJson(snapshot.data);

        }else if(!snapshot.hasData){
          if(data?.code == 404) {
            return const Center(
              child: Text('질문을 찾을 수 없습니다.'),
            );
          }
          return const Center(
            child: Text('질문이 없습니다.'),
          );
        }else {
          return Container(width: 30, height: 30, alignment: Alignment.center, child: CircularProgressIndicator());
        }
        return Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 30.0),
            alignment: Alignment.centerLeft,
            color: PURPLE_COLOR_10,
            child: Text(data!.data.content)
        );
      }
    );
  }
}
