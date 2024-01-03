import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:psr/chat/view/chat_sending_screen.dart';

import '../../common/const/colors.dart';
import '../../common/const/constants.dart';
import '../../presenter/chat/chat_service.dart';
import '../component/chat_message_list_item.dart';

class ChatRoomScreen extends StatefulWidget {
  const ChatRoomScreen({Key? key, required int id}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final TextStyle nicknameTextStyle = const TextStyle(
      fontSize: 15.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  final TextStyle reportTextStyle = const TextStyle(
      fontSize: 15.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  final TextStyle leaveTextStyle = const TextStyle(
      fontSize: 15.0, fontWeight: FontWeight.w500, color: RED_COLOR);
  final TextStyle headerTextStyle = const TextStyle(
      letterSpacing: -0.1, fontSize: 14.0, fontWeight: FontWeight.w400, color: GRAY_4_COLOR);
  final TextStyle dialogTitleTextStyle = const TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.bold, color: GRAY_4_COLOR);
  final TextStyle selectReasonTextStyle = const TextStyle(
      fontSize: 11.0, fontWeight: FontWeight.w400, color: GRAY_2_COLOR);
  final TextStyle reasonTextStyle = const TextStyle(
      letterSpacing: -0.4, fontSize: 14.0, fontWeight: FontWeight.w400, color: GRAY_4_COLOR);
  final TextStyle reportButtonTextStyle = const TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.white);

  List<dynamic> chatMessageList = [
    [false, "닉네임이 들어갑니다", "24/01/01 02:37", "새해복 많이 받으세용~!~! 해피 뉴이어입니다🌅"],
    [true, "나", "24/01/03 02:37", "오랜만이에요~ 잘 지내셨어요?"],
    [false, "보라돌이 뚜비 나나 뽀", "24/01/03 02:37", "그럼요~ 이번에 텍스트 길이 테스트 좀 해볼게요 길어져도 괜찮죠?\n지금 테일러 스위프트 노래 듣는 중\n그럼요~ 이번에 텍스트 길이 테스트 좀 해볼게요 그럼요~ 이번에 텍스트 길이 테스트 좀 해볼게요"],
    [true,"나", "24/01/03 02:37", "네 알겠습니당"],
    [false, "엄청 나게 긴 닉네임일 경우 테스트해볼게요 엄청 나게 긴 닉네임일 경우 테스트입니다", "24/01/01 02:37", "네 알겠습니다"],
    [true,"나", "24/01/03 02:37", "뭘 알겠다는 거예용?"],
    [false, "닉네임", "24/01/01 02:37", "제가 알겠다고 하면 그냥 알겠는 줄 아세요.. 더 묻지 마시길 ㅋ"],
    [true,"나", "24/01/03 02:37", "눼"],
    [false, "두번째 테스트 닉네임 두번째 텍스트 닉네임 들어가유", "24/01/01 02:37", "그럼 이번 주말에 봬요^^~"],
    [true,"나", "24/01/03 02:37", "넹..🩵 첫눈 같이 보면 좋겠다."],
  ];

  Future<dynamic> fetchData() async {
    return await ChatService().getChat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder(
                future: fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    print("chat: ${snapshot.error.toString()}");
                    // return const CircularProgress();
                  } else if (snapshot.hasData) {
                    // data = List<ChatModel>.fromJson(snapshot.data);
                  } else {
                    // return const CircularProgress();
                  }
                  return renderBody();
                }
            )
        ),
      ),
    );
  }

  Widget renderBody() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(48.0),
        child: chatRoomAppBar(),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: chatContentView(),
            ),
          ),
        ],
      )
    );
  }

  Widget chatRoomAppBar() {
    return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0.0,
        leading: IconButton(
          iconSize: 24,
          icon: SvgPicture.asset('asset/icons/common/chevron.backward.svg'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          "닉네임",
          style: nicknameTextStyle,
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              'asset/icons/chat/send.svg',
              width: 20,
              height: 20,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const ChatSendingScreen(), fullscreenDialog: true
              ));
            },
          ),
          IconButton(
            icon: SvgPicture.asset('asset/icons/shopping/more_vertical.svg'),
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: Colors.white,
                barrierColor: BLACK_COLOR_70,
                context: context,
                builder: (context) {
                  return Container(
                    color: Colors.white,
                    child: SafeArea(
                      top: false,
                      child: Container(
                        color: Colors.white,
                        height: 133,
                        child: ListView(
                          children: [
                            GestureDetector(
                              onTap: () {
                                showReportDialog();
                              },
                              child: SizedBox(
                                height: 66,
                                child: Center(
                                  child: Text(
                                    "신고하기",
                                    style: reportTextStyle,
                                  ),
                                )
                              ),
                            ),
                            const Divider(
                              height: 1,
                              color: GRAY_0_COLOR,
                            ),
                            GestureDetector(
                              onTap: () {
                                showConfirmationDialog();
                              },
                              child:SizedBox(
                                height: 66,
                                child: Center(
                                  child: Text(
                                    "나가기",
                                    style: leaveTextStyle,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
    );
  }

  Widget chatContentView() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
            child: chatRoomHeader(),
          ),
          ChatMessageListItem(context: context, chatMessageList: chatMessageList),
        ],
      ),
    );
  }

  Widget chatRoomHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 20.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        boxShadow: [
          BoxShadow(color: PURPLE_COLOR_50, blurRadius: 4.0),
        ],
      ),
      child: Center(
        child: Text(
          "'[상품명]' 상품에서부터 시작된 쪽지입니다.",
          style: headerTextStyle,
          textAlign: TextAlign.center,
        ),
      )
    );
  }

  Widget reportDialog() {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(left: 16.0, right: 16.0),
        padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 32.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  iconSize: 24,
                  icon: SvgPicture.asset('asset/icons/custom_dialog/x_black.svg'),
                  style: IconButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: const EdgeInsets.all(5.0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ],
            ),
            DefaultTextStyle(
              style: dialogTitleTextStyle,
              child: const Text(
                "신고하기",
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            DefaultTextStyle(
              style: selectReasonTextStyle,
              child: const Text(
                SELECT_REASON,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 18.0,
            ),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textButtonWithIcon(ReasonForReporting.spam),
                      const SizedBox(height: 12.0,),
                      textButtonWithIcon(ReasonForReporting.harmful),
                      const SizedBox(height: 12.0,),
                      textButtonWithIcon(ReasonForReporting.inappropriate),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textButtonWithIcon(ReasonForReporting.profanity),
                      const SizedBox(height: 12.0,),
                      textButtonWithIcon(ReasonForReporting.fraud),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            SizedBox(
              width: double.infinity,
              height: 40.0,
              child: ElevatedButton(
                onPressed: () {
                  reportChat();
                },
                style: TextButton.styleFrom(
                  elevation: 0,
                  backgroundColor: PURPLE_COLOR,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: Text(
                  "신고하기",
                  style: reportButtonTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textButtonWithIcon(ReasonForReporting reason) {
    return TextButton.icon(
      onPressed: () {
        /// 체크박스 선택/해제 되고, 현재 선택한 신고사유 변수에 저장
        tapReasonForReportingCheckbox();
      },
      icon: SvgPicture.asset('asset/icons/custom_dialog/circle_check_off.svg'),
      label: Text(
        reason.korean,
        style: reasonTextStyle,
      ),
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: const EdgeInsets.all(6.0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }

  void showReportDialog() {
    /// 신고하면 자동으로 채팅방 나가지는 거면 코드 약간 수정 필요
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return reportDialog();
        }
    );
  }

  void showConfirmationDialog() {
    /// pop해서 기존 채팅방 화면에 나간다는 정보를 전달해야 되나?
  }

  void tapReasonForReportingCheckbox() {
    /// 체크박스 탭
  }

  void reportChat() {

  }
}
