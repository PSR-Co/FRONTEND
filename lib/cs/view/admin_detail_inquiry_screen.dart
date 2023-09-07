import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:psr/common/const/colors.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';
import 'package:psr/model/data/inquiry/add_inquiry_answer_model.dart';
import 'package:psr/model/data/inquiry/delete_inquiry_answer_model.dart';
import 'package:psr/model/data/inquiry/inquiry_detail_model.dart';
import 'package:psr/myinfo/component/complete_btn.dart';
import 'package:psr/presenter/inquiry/inquiry_service.dart';

class AdminDetailInquiryScreen extends StatefulWidget {
  final int inquiryId;

  const AdminDetailInquiryScreen({required this.inquiryId, Key? key})
      : super(key: key);

  @override
  State<AdminDetailInquiryScreen> createState() =>
      _AdminDetailInquiryScreenState();
}

class _AdminDetailInquiryScreenState extends State<AdminDetailInquiryScreen> {
  final TextStyle titleTextStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  final TextStyle contentTextStyle = const TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: GRAY_4_COLOR,
      height: 1.1);
  final TextStyle answerTextStyle = const TextStyle(
      fontSize: 15.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  final TextStyle removeTextStyle = const TextStyle(
      fontSize: 15.0, fontWeight: FontWeight.w500, color: ERROR_COLOR);

  bool readOnly = true;
  bool isActivated = false;

  InquiryDetailModel? data;
  AddInquiryAnswerModel? addInquiryAnswerData;
  DeleteInquiryAnswerModel? deleteInquiryAnswerData;

  TextEditingController controller = TextEditingController();

  Future<dynamic> fetchData(int inquiryId) async {
    return await InquiryService().getDetailInquiry(inquiryId);
  }

  Future<dynamic> addInquiryAnswer(int inquiryId, String answer) async {
    return await InquiryService().addInquiryAnswer(inquiryId, answer);
  }

  Future<dynamic> deleteInquiryAnswer(int inquiryId) async {
    return await InquiryService().deleteInquiryAnswer(inquiryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: FutureBuilder(
            future: fetchData(widget.inquiryId),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                // print('inquiry detail error: ${snapshot.error.toString()}');
                return const Center(
                  child: Text('문의 : 에러가 있습니다'),
                );
              } else if (snapshot.hasData) {
                data = InquiryDetailModel.fromJson(snapshot.data);
                if (data?.data == null) {
                  return const Center(
                    child: Text('해당 문의를 찾을 수 없습니다.'),
                  );
                }
              } else if (!snapshot.hasData) {
                return const Center(
                  child: Text('해당 문의 내역을 불러올 수 없습니다.'),
                );
              } else {
                return Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator());
              }
              return Column(children: [
                DefaultAppBarLayout(
                  titleText: '문의하기',
                  rightItems: [menuBar()],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17.0),
                  child:
                      inquiryContainer(data!.data!.title, data!.data!.content),
                ),
                Expanded(child: answerContainer(data?.data?.answer))
              ]);
            }),
      ),
    );
  }

  Widget inquiryContainer(String title, String content) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: titleTextStyle,
                )),
            Container(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                alignment: Alignment.centerLeft,
                child: Text(content, style: contentTextStyle))
          ],
        ));
  }

  Widget answerContainer(String? answer) {
    return Container(
        width: MediaQuery.of(context).size.width,
        color: PURPLE_COLOR_20,
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.only(top: 20.0, left: 17.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  '관리자 답변',
                  style: titleTextStyle,
                )),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset("asset/icons/common/answer.svg"),
                  padding: const EdgeInsets.only(left: 30.0, right: 6.0),
                  constraints: const BoxConstraints(),
                ),
                Expanded(
                  child: TextField(
                    maxLines: 30,
                    controller: controller,
                    decoration: InputDecoration(
                        hintText: answer ?? '아직 답변이 완료되지 않은 문의입니다.',
                        hintStyle: contentTextStyle,
                        border: InputBorder.none),
                    style: contentTextStyle,
                    readOnly: readOnly,
                  ),
                ),
              ],
            ),
            Expanded(child: Container()),
            Padding(
                padding: const EdgeInsets.only(
                    left: 17.0, right: 17.0, bottom: 40.0),
                child: CompleteBtn(
                    btnTitle: '답변하기',
                    isVisible: isActivated,
                    onPressed: () {
                      showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (_) {
                            return FutureBuilder(
                                future: addInquiryAnswer(
                                    widget.inquiryId, controller.text),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    return resultDialog(
                                        "답변 등록에 실패하셨습니다!", "등록");
                                  } else if (snapshot.hasData) {
                                    addInquiryAnswerData =
                                        AddInquiryAnswerModel.fromJson(
                                            snapshot.data);
                                    if (data?.data == null) {
                                      return resultDialog(
                                          "답변 등록에 실패하셨습니다!", "등록");
                                    }
                                  } else {
                                    return Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      alignment: Alignment.center,
                                      child: const SizedBox(
                                          width: 30,
                                          height: 30,
                                          child: CircularProgressIndicator(
                                            backgroundColor: PURPLE_COLOR,
                                            color: GRAY_0_COLOR,
                                          )),
                                    );
                                  }
                                  return resultDialog("답변 등록에 성공하셨습니다!", "등록");
                                });
                          });
                    }))
          ],
        ));
  }

  Widget menuBar() {
    return IconButton(
        onPressed: () {
          showDialog(
              barrierDismissible: true,
              context: context,
              builder: (_) {
                return menuDialog();
              });
        },
        icon: SvgPicture.asset("asset/icons/common/menu.svg"));
  }

  Widget menuDialog() {
    return AlertDialog(
      backgroundColor: Colors.white,
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      insetPadding: const EdgeInsets.only(top: 600.0),
      titlePadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      elevation: 0.0,
      actions: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 150.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {
                    changeEditable();
                    activateBtn();
                    Navigator.pop(context);
                  },
                  child: Text(
                    "답변",
                    style: answerTextStyle,
                  )),
              Container(
                height: 1,
                color: GRAY_0_COLOR,
              ),
              TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (_) {
                          return FutureBuilder(
                              future: deleteInquiryAnswer(widget.inquiryId),
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  return resultDialog("답변 삭제에 실패하셨습니다!", "삭제");
                                } else if (snapshot.hasData) {
                                  deleteInquiryAnswerData =
                                      DeleteInquiryAnswerModel.fromJson(
                                          snapshot.data);
                                  if (data?.data == null) {
                                    return resultDialog(
                                        "답변 삭제에 실패하셨습니다!", "삭제");
                                  }
                                } else {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    alignment: Alignment.center,
                                    child: const SizedBox(
                                        width: 30,
                                        height: 30,
                                        child: CircularProgressIndicator(
                                          backgroundColor: PURPLE_COLOR,
                                          color: GRAY_0_COLOR,
                                        )),
                                  );
                                }
                                return resultDialog("답변 삭제에 성공하셨습니다!", "삭제");
                              });
                        });
                  },
                  child: Text(
                    "삭제",
                    style: removeTextStyle,
                  ))
            ],
          ),
        )
      ],
    );
  }

  Widget resultDialog(String result, String type) {
    return AlertDialog(
      backgroundColor: Colors.white,
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      titlePadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      elevation: 0.0,
      content: Container(
        height: MediaQuery.of(context).size.height / 10,
        alignment: Alignment.center,
        child: Text(result, style: answerTextStyle),
      ),
      actions: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: TextButton(
              onPressed: () {
                changeEditable();
                activateBtn();
                Navigator.of(context).pop();
                if (type == '삭제') {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                }
              },
              child: Text(
                "확인",
                style: titleTextStyle,
              )),
        )
      ],
    );
  }

  void changeEditable() {
    setState(() {
      readOnly = !readOnly;
    });
  }

  void activateBtn() {
    setState(() {
      isActivated = !isActivated;
    });
  }
}
