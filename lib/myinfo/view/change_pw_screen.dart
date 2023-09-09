import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:psr/common/layout/default_appbar_layout.dart';
import 'package:psr/model/data/myinfo/myinfo_model.dart';
import 'package:psr/myinfo/component/complete_btn.dart';
import 'package:psr/presenter/myinfo/myinfo_service.dart';

import '../../common/const/colors.dart';

class ChangePWScreen extends StatefulWidget {
  const ChangePWScreen({super.key});

  @override
  State<ChangePWScreen> createState() => _ChangePWScreenState();
}

class _ChangePWScreenState extends State<ChangePWScreen> {
  final TextStyle pwTitleTextStyle = const TextStyle(
      fontSize: 16.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  final TextStyle pwHintTextStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w400, color: GRAY_1_COLOR);
  final TextStyle newPWTextStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w400, color: GRAY_4_COLOR);
  final TextStyle completeBtnTextStyle = const TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.w700, color: Colors.white);
  final TextStyle errorTextStyle = const TextStyle(
      fontSize: 11.0, fontWeight: FontWeight.w400, color: ERROR_COLOR);
  final TextStyle answerTextStyle = const TextStyle(
      fontSize: 15.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  final TextStyle titleTextStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  final TextStyle contentTextStyle = const TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: GRAY_4_COLOR,
      height: 1.1);

  bool isHided1 = true;
  bool isHided2 = true;
  bool isHided3 = true;

  bool isValidated = true;

  TextEditingController pwController = TextEditingController();
  TextEditingController newPwController = TextEditingController();
  TextEditingController checkController = TextEditingController();

  ChangePWModel? data;

  Future<dynamic> fetchData(String currentPassword, String password) async {
    dynamic result = await MyInfoService().changePW(currentPassword, password);
    return result;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const DefaultAppBarLayout(titleText: "비밀번호 변경"),
      body: changePWView(),
      bottomNavigationBar:
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 30),
        child: CompleteBtn(
            btnTitle: '완료',
            isVisible: true,
            onPressed: () {
              if (pwController.text.isNotEmpty &&
                  newPwController.text.isNotEmpty &&
                  checkController.text.isNotEmpty) {
                if (newPwController.text == checkController.text) {
                  showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (_) {
                        return resultDialog();
                      });
                } else {
                  Fluttertoast.showToast(msg: "비밀번호가 일치해야 합니다");
                }
              } else {
                Fluttertoast.showToast(msg: "값을 모두 입력해주세요");
              }
            }),
      ),
    );
  }

  Widget changePWView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            currentPW(),
            newPW(),
            checkNewPW(),
          ],
        ),
      ),
    );
  }

  Widget currentPW() {
    return changeViewForm(
      "현재 비밀번호",
      TextFormField(
        controller: pwController,
        obscureText: isHided1,
        maxLength: 15,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            counterText: '',
            hintText: "현재 비밀번호를 입력해주세요.",
            hintStyle: pwHintTextStyle,
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: SizedBox(
                width: 20.0,
                height: 20.0,
                child: IconButton(
                    icon: isHided1
                        ? SvgPicture.asset("asset/icons/common/eyes_off.svg")
                        : const Icon(CupertinoIcons.eye_fill,
                        color: PURPLE_COLOR),
                    isSelected: false,
                    onPressed: updateHideState1),
              ),
            ),
            focusedBorder: textFieldOutlineColor(),
            enabledBorder: textFieldOutlineColor(),
            border: textFieldOutlineColor(),
            contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0)),
        style: newPWTextStyle,
      ),
    );
  }

  Widget newPW() {
    return Column(
      children: [
        changeViewForm(
          "새 비밀번호",
          TextFormField(
            controller: newPwController,
            obscureText: isHided2,
            maxLength: 15,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                counterText: '',
                hintText: "새 비밀번호를 입력해주세요.",
                hintStyle: pwHintTextStyle,
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: SizedBox(
                    width: 20.0,
                    height: 20.0,
                    child: IconButton(
                        icon: isHided2
                            ? SvgPicture.asset(
                            "asset/icons/common/eyes_off.svg")
                            : const Icon(CupertinoIcons.eye_fill,
                            color: PURPLE_COLOR),
                        isSelected: false,
                        onPressed: updateHideState2),
                  ),
                ),
                focusedBorder: textFieldOutlineColor(),
                enabledBorder: textFieldOutlineColor(),
                border: textFieldOutlineColor(),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0)),
            style: newPWTextStyle,
            onChanged: (value) {
              setState(() {
                if (checkController.text != value) {
                  isValidated = false;
                } else {
                  isValidated = true;
                }
              });
            },
            onTap: () {
              setState(() {
                if (newPwController.text != checkController.text) {
                  isValidated = false;
                } else {
                  isValidated = true;
                }
              });
            },
          ),
        ),
        alertMessage("영문, 숫자, 특수문자만 입력해주세요. (8자)")
      ],
    );
  }

  Widget alertMessage(String message) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        padding: const EdgeInsets.only(left: 10.0),
        alignment: Alignment.centerLeft,
        child: Text(
          message,
          style: errorTextStyle,
        ));
  }

  Widget checkNewPW() {
    return Column(
      children: [
        changeViewForm(
          "비밀번호 확인",
          TextFormField(
            controller: checkController,
            obscureText: isHided3,
            maxLength: 15,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
                counterText: '',
                hintText: "비밀번호를 다시 입력해주세요.",
                hintStyle: pwHintTextStyle,
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: SizedBox(
                    width: 20.0,
                    height: 20.0,
                    child: IconButton(
                        icon: isHided3
                            ? SvgPicture.asset(
                            "asset/icons/common/eyes_off.svg")
                            : const Icon(CupertinoIcons.eye_fill,
                            color: PURPLE_COLOR),
                        isSelected: false,
                        onPressed: updateHideState3),
                  ),
                ),
                focusedBorder: textFieldOutlineColor(),
                enabledBorder: textFieldOutlineColor(),
                border: textFieldOutlineColor(),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0)),
            style: newPWTextStyle,
            onChanged: (value) {
              setState(() {
                if (newPwController.text != value) {
                  isValidated = false;
                } else {
                  isValidated = true;
                }
              });
            },
            onTap: () {
              setState(() {
                if (newPwController.text != checkController.text) {
                  isValidated = false;
                } else {
                  isValidated = true;
                }
              });
            },
          ),
        ),
        if (newPwController.text != checkController.text)
          alertMessage("비밀번호가 일치하지 않습니다.")
      ],
    );
  }

  Widget changeViewForm(String title, Widget textField) {
    return Container(
      margin: const EdgeInsets.only(top: 30.0),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(bottom: 10.0),
            child: Text(title, style: pwTitleTextStyle),
          ),
          Container(
            child: textField,
          )
        ],
      ),
    );
  }

  void updateHideState1() {
    setState(() {
      isHided1 = !isHided1;
    });
  }

  void updateHideState2() {
    setState(() {
      isHided2 = !isHided2;
    });
  }

  void updateHideState3() {
    setState(() {
      isHided3 = !isHided3;
    });
  }

  OutlineInputBorder textFieldOutlineColor() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(color: PURPLE_COLOR_50, width: 1));
  }

  Widget resultDialog() {
    return FutureBuilder(
        future: fetchData(pwController.text, newPwController.text),
        builder: (context, snapshot) {
          print("snapshot.data : ${snapshot.data}");
          if (snapshot.hasError) {
            return alertDialog("비밀번호 변경을 실패했습니다.\n올바른 정보를 입력해주세요.");
          } else if (snapshot.hasData) {
            data = ChangePWModel.fromJson(snapshot.data);
            if (data?.code != 200) {
              return alertDialog(data!.message);
            }
          } else if (!snapshot.hasData) {
            return Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                child: const CircularProgressIndicator());
          }
          return alertDialog("성공적으로 비밀번호를 변경했습니다!");
        });
  }

  Widget alertDialog(String result) {
    return AlertDialog(
      backgroundColor: Colors.white,
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      titlePadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      elevation: 0.0,
      content: Container(
        height: 100,
        alignment: Alignment.center,
        child: Text(result, style: answerTextStyle),
      ),
      actions: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (result == "성공적으로 비밀번호를 변경했습니다!") {
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



  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.white,
  //     body: SafeArea(
  //       child: SizedBox(
  //         width: MediaQuery.of(context).size.width,
  //         height: MediaQuery.of(context).size.height,
  //         child: Column(
  //           children: [
  //             Container(
  //                 margin: const EdgeInsets.only(bottom: 10.0),
  //                 child: const DefaultAppBarLayout(titleText: "비밀번호 변경")),
  //             Expanded(child: changePWView())
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
  //
  // Widget changePWView() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 17.0),
  //     child: Column(
  //       children: [
  //         currentPW(),
  //         newPW(),
  //         checkNewPW(),
  //         Expanded(child: Container()),
  //         CompleteBtn(
  //             btnTitle: '완료',
  //             isVisible: true,
  //             onPressed: () {
  //               if (pwController.text.isNotEmpty &&
  //                   newPwController.text.isNotEmpty &&
  //                   checkController.text.isNotEmpty) {
  //                 if (newPwController.text == checkController.text) {
  //                   showDialog(
  //                       context: context,
  //                       barrierDismissible: true,
  //                       builder: (_) {
  //                         return resultDialog();
  //                       });
  //                 } else {
  //                   Fluttertoast.showToast(msg: "비밀번호가 일치해야 합니다");
  //                 }
  //               } else {
  //                 Fluttertoast.showToast(msg: "값을 모두 입력해주세요");
  //               }
  //             })
  //       ],
  //     ),
  //   );
  // }
  //
  // Widget currentPW() {
  //   return changeViewForm(
  //     "현재 비밀번호",
  //     TextFormField(
  //       controller: pwController,
  //       obscureText: isHided1,
  //       maxLength: 15,
  //       decoration: InputDecoration(
  //           counterText: '',
  //           hintText: "현재 비밀번호를 입력해주세요.",
  //           hintStyle: pwHintTextStyle,
  //           suffixIcon: Padding(
  //             padding: const EdgeInsets.only(right: 5.0),
  //             child: SizedBox(
  //               width: 20.0,
  //               height: 20.0,
  //               child: IconButton(
  //                   icon: isHided1
  //                       ? SvgPicture.asset("asset/icons/common/eyes_off.svg")
  //                       : const Icon(CupertinoIcons.eye_fill,
  //                           color: PURPLE_COLOR),
  //                   isSelected: false,
  //                   onPressed: updateHideState1),
  //             ),
  //           ),
  //           focusedBorder: textFieldOutlineColor(),
  //           enabledBorder: textFieldOutlineColor(),
  //           border: textFieldOutlineColor(),
  //           contentPadding:
  //               const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0)),
  //       style: newPWTextStyle,
  //     ),
  //   );
  // }
  //
  // Widget newPW() {
  //   return Column(
  //     children: [
  //       changeViewForm(
  //         "새 비밀번호",
  //         TextFormField(
  //           controller: newPwController,
  //           obscureText: isHided2,
  //           maxLength: 15,
  //           decoration: InputDecoration(
  //               counterText: '',
  //               hintText: "새 비밀번호를 입력해주세요.",
  //               hintStyle: pwHintTextStyle,
  //               suffixIcon: Padding(
  //                 padding: const EdgeInsets.only(right: 5.0),
  //                 child: SizedBox(
  //                   width: 20.0,
  //                   height: 20.0,
  //                   child: IconButton(
  //                       icon: isHided2
  //                           ? SvgPicture.asset(
  //                               "asset/icons/common/eyes_off.svg")
  //                           : const Icon(CupertinoIcons.eye_fill,
  //                               color: PURPLE_COLOR),
  //                       isSelected: false,
  //                       onPressed: updateHideState2),
  //                 ),
  //               ),
  //               focusedBorder: textFieldOutlineColor(),
  //               enabledBorder: textFieldOutlineColor(),
  //               border: textFieldOutlineColor(),
  //               contentPadding: const EdgeInsets.symmetric(
  //                   vertical: 10.0, horizontal: 10.0)),
  //           style: newPWTextStyle,
  //           onChanged: (value) {
  //             setState(() {
  //               if (checkController.text != value) {
  //                 isValidated = false;
  //               } else {
  //                 isValidated = true;
  //               }
  //             });
  //           },
  //           onTap: () {
  //             setState(() {
  //               if (newPwController.text != checkController.text) {
  //                 isValidated = false;
  //               } else {
  //                 isValidated = true;
  //               }
  //             });
  //           },
  //         ),
  //       ),
  //       alertMessage("영문, 숫자, 특수문자만 입력해주세요. (8자)")
  //     ],
  //   );
  // }
  //
  // Widget alertMessage(String message) {
  //   return Container(
  //       margin: const EdgeInsets.symmetric(vertical: 5.0),
  //       padding: const EdgeInsets.only(left: 10.0),
  //       alignment: Alignment.centerLeft,
  //       child: Text(
  //         message,
  //         style: errorTextStyle,
  //       ));
  // }
  //
  // Widget checkNewPW() {
  //   return Column(
  //     children: [
  //       changeViewForm(
  //         "비밀번호 확인",
  //         TextFormField(
  //           controller: checkController,
  //           obscureText: isHided3,
  //           maxLength: 15,
  //           decoration: InputDecoration(
  //               counterText: '',
  //               hintText: "비밀번호를 다시 입력해주세요.",
  //               hintStyle: pwHintTextStyle,
  //               suffixIcon: Padding(
  //                 padding: const EdgeInsets.only(right: 5.0),
  //                 child: SizedBox(
  //                   width: 20.0,
  //                   height: 20.0,
  //                   child: IconButton(
  //                       icon: isHided3
  //                           ? SvgPicture.asset(
  //                               "asset/icons/common/eyes_off.svg")
  //                           : const Icon(CupertinoIcons.eye_fill,
  //                               color: PURPLE_COLOR),
  //                       isSelected: false,
  //                       onPressed: updateHideState3),
  //                 ),
  //               ),
  //               focusedBorder: textFieldOutlineColor(),
  //               enabledBorder: textFieldOutlineColor(),
  //               border: textFieldOutlineColor(),
  //               contentPadding: const EdgeInsets.symmetric(
  //                   vertical: 10.0, horizontal: 10.0)),
  //           style: newPWTextStyle,
  //           onChanged: (value) {
  //             setState(() {
  //               if (newPwController.text != value) {
  //                 isValidated = false;
  //               } else {
  //                 isValidated = true;
  //               }
  //             });
  //           },
  //           onTap: () {
  //             setState(() {
  //               if (newPwController.text != checkController.text) {
  //                 isValidated = false;
  //               } else {
  //                 isValidated = true;
  //               }
  //             });
  //           },
  //         ),
  //       ),
  //       if (newPwController.text != checkController.text)
  //         alertMessage("비밀번호가 일치하지 않습니다.")
  //     ],
  //   );
  // }
  //
  // Widget changeViewForm(String title, Widget textField) {
  //   return Container(
  //     margin: const EdgeInsets.only(top: 30.0),
  //     child: Column(
  //       children: [
  //         Container(
  //           alignment: Alignment.centerLeft,
  //           margin: const EdgeInsets.only(bottom: 10.0),
  //           child: Text(title, style: pwTitleTextStyle),
  //         ),
  //         Container(
  //           child: textField,
  //         )
  //       ],
  //     ),
  //   );
  // }
  //
  // void updateHideState1() {
  //   setState(() {
  //     isHided1 = !isHided1;
  //   });
  // }
  //
  // void updateHideState2() {
  //   setState(() {
  //     isHided2 = !isHided2;
  //   });
  // }
  //
  // void updateHideState3() {
  //   setState(() {
  //     isHided3 = !isHided3;
  //   });
  // }
  //
  // OutlineInputBorder textFieldOutlineColor() {
  //   return const OutlineInputBorder(
  //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
  //       borderSide: BorderSide(color: PURPLE_COLOR_50, width: 1));
  // }
  //
  // Widget resultDialog() {
  //   return FutureBuilder(
  //       future: fetchData(pwController.text, newPwController.text),
  //       builder: (context, snapshot) {
  //         print("snapshot.data : ${snapshot.data}");
  //         if (snapshot.hasError) {
  //           return alertDialog("비밀번호 변경을 실패했습니다.\n올바른 정보를 입력해주세요.");
  //         } else if (snapshot.hasData) {
  //           data = ChangePWModel.fromJson(snapshot.data);
  //           if (data?.code != 200) {
  //             return alertDialog(data!.message);
  //           }
  //         } else if (!snapshot.hasData) {
  //           return Container(
  //               width: 30,
  //               height: 30,
  //               alignment: Alignment.center,
  //               child: const CircularProgressIndicator());
  //         }
  //         return alertDialog("성공적으로 비밀번호를 변경했습니다!");
  //       });
  // }
  //
  // Widget alertDialog(String result) {
  //   return AlertDialog(
  //     backgroundColor: Colors.white,
  //     actionsAlignment: MainAxisAlignment.spaceEvenly,
  //     titlePadding: EdgeInsets.zero,
  //     shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
  //     elevation: 0.0,
  //     content: Container(
  //       height: 100,
  //       alignment: Alignment.center,
  //       child: Text(result, style: answerTextStyle),
  //     ),
  //     actions: <Widget>[
  //       SizedBox(
  //         width: MediaQuery.of(context).size.width,
  //         child: TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //               if (result == "성공적으로 비밀번호를 변경했습니다!") {
  //                 Navigator.of(context).pop();
  //               }
  //             },
  //             child: Text(
  //               "확인",
  //               style: titleTextStyle,
  //             )),
  //       )
  //     ],
  //   );
  // }
}
