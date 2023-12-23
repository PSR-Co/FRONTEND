import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/const/colors.dart';
import '../../presenter/chat/chat_service.dart';

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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(48.0),
        child: chatRoomHeader(),
      ),
      body: Column(
        children: [
          SizedBox(
            child: SingleChildScrollView(
              child: chatContentView(),
            ),
          ),
          chatInputBar(),
        ],
      ),
    );
  }

  Widget chatRoomHeader() {
    return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          iconSize: 24,
          icon: SvgPicture.asset('asset/icons/common/chevron.backward.svg'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "닉네임",
          style: nicknameTextStyle,
        ),
        actions: [
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
                                /// 신고하면 자동으로 채팅방 나가지나? 상대방 차단되나? 아님 신고해도 그대로?
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
                                /// pop해서 기존 채팅방 화면에 나간다는 정보를 전달해야 되나?
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

    );
  }

  Widget chatInputBar() {
    return Container(
      height: 51,
      child: Row(

      ),
    );
  }

  void showReportDialog() {

  }

  void showConfirmationDialog() {

  }
}
