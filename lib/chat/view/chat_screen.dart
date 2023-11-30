import 'package:flutter/material.dart';

import '../../presenter/chat/chat_service.dart';
import '../component/chat_list_item.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextStyle chatTitleTextStyle = const TextStyle(
      fontSize: 16.0, fontWeight: FontWeight.w700, color: Colors.black);

  // late List<ChatModel?> chatList;
  List<dynamic> chatList = [null, "a", "b", "c", "d"]; // 더미데이터

  Future<dynamic> fetchData() async {
    return await ChatService().getChatList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
                  } else if (!snapshot.hasData) {
                    /* 채팅 emptyView 필요 */
                    // return const CircularProgress();
                  } else {
                    // return const CircularProgress();
                  }
                  return renderBody();
                }
        )),
      ),
    );
  }

  Widget renderBody() {
    return Column(
      children: [
        chatHeader(),
        SingleChildScrollView(
            child: ChatListItem(chatList: chatList)
        ),
      ],
    );
  }

  Widget chatHeader() {
    return Container(
      height: 48,
      padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "채팅",
            style: chatTitleTextStyle,
          ),
          const Spacer()
        ],
      )
    );
  }
}