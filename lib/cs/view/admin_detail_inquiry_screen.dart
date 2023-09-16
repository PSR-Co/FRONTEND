import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:psr/common/const/colors.dart';
import 'package:psr/common/layout/circular_progress_indicator.dart';
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          bottom: false,
          child: FutureBuilder(
              future: fetchData(widget.inquiryId),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  if (kDebugMode) {
                    print('inquiry detail error: ${snapshot.error.toString()}');
                  }
                  return const CircularProgress();
                } else if (snapshot.hasData) {
                  data = InquiryDetailModel.fromJson(snapshot.data);
                  if (data?.data == null) {
                    if (kDebugMode) {
                      print('inquiry detail error: 해당 문의를 찾을 수 없습니다.');
                    }
                    return const CircularProgress();
                  }
                } else if (!snapshot.hasData) {
                  return const CircularProgress();
                } else {
                  return const CircularProgress();
                }
                return SingleChildScrollView(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(children: [
                      DefaultAppBarLayout(
                        titleText: '문의하기',
                        rightItems: [menuBar()],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 17.0),
                        child: inquiryContainer(
                            data!.data!.title, data!.data!.content),
                      ),
                      Expanded(child: answerContainer(data?.data?.answer))
                    ]),
                  ),
                );
              }),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 17.0, right: 17.0, bottom: 20.0),
          child: CompleteBtn(
              btnTitle: '답변하기',
              isVisible: isActivated,
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (_) {
                    if(controller.text == ""){
                      return resultDialog('답변을 입력해주세요.', '');
                    }else {
                      return FutureBuilder(
                          future: addInquiryAnswer(
                              widget.inquiryId, controller.text),
                          builder: (context, snapshot) {
                            if (kDebugMode) {
                              print("admin: ${widget.inquiryId}, ${controller.text}");
                            }
                            if (snapshot.hasError) {
                              if (kDebugMode) {
                                print("admin err : ${snapshot.data}, ${snapshot.error}");
                              }
                              return resultDialog("답변 등록에 실패하셨습니다!", "등록");
                            } else if (snapshot.hasData) {
                              addInquiryAnswerData =
                                  AddInquiryAnswerModel.fromJson(
                                      snapshot.data);
                              if (data?.data == null) {
                                if (kDebugMode) {
                                  print("admin in : ${data?.message}");
                                }
                                return resultDialog("답변 등록에 실패하셨습니다!", "등록");
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
                            return resultDialog("답변 등록에 성공하셨습니다!", "등록");
                          });}
                    });
              })
        ),
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
                    textInputAction: TextInputAction.done,
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
      alignment: Alignment.bottomCenter,
      backgroundColor: Colors.white,
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      insetPadding: const EdgeInsets.all(0.0),
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
      alignment: Alignment.center,
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
