import 'package:flutter/material.dart';
import 'package:psr/common/const/colors.dart';
import 'package:psr/model/data/chat/chat_room_list_model.dart';

import '../../common/layout/circular_progress_indicator.dart';
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
  final TextStyle emptyListTextStyle = const TextStyle(
      fontSize: 15.0, fontWeight: FontWeight.w500, color: GRAY_2_COLOR);
  final TextStyle sendMessageTextStyle = const TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.w500, color: GRAY_1_COLOR);

  late Future myFuture;
  ChatRoomListModel? data;
  List<ChatRoom> chatRoomList = [];

  Future<dynamic> fetchData() async {
    final result = await ChatService().getChatRoomList();
    print("${result}");
    return result;
  }

  @override
  void initState() {
    myFuture = fetchData();
    super.initState();
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
                future: myFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    data = ChatRoomListModel.fromJson(snapshot.data);
                    if (data!.data != null) {
                      print("chatRoomList: ✅");
                      chatRoomList = data!.data!.noticeLists;
                      return renderBody();
                    } else {
                      print("chatRoomList: ❎");
                      return emptyView();
                    }
                  } else if (snapshot.hasError) {
                    /// 에러 - 데이터를 불러올 수 없다고 띄우기
                    print("chat: ${snapshot.error.toString()}");
                    return const CircularProgress();
                  } else if (!snapshot.hasData) {
                    print("chatRoomList: ❌");
                    return const CircularProgress();
                  } else {
                    return const CircularProgress();
                  }
                }
            )
        ),
      ),
    );
  }

  Widget emptyView() {
    return Column(
      children: [
        chatHeader(),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "쪽지함이 비어있어요!",
                style: emptyListTextStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 4.0,
              ),
              Text(
                "쪽지는 상품 게시글에서 작성자에게 보낼 수 있습니다",
                style: sendMessageTextStyle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget renderBody() {
    return Column(
      children: [
        chatHeader(),
        Expanded(
            child: SingleChildScrollView(
              child: ChatListItem(context: context, chatRoomList: chatRoomList),
            ),
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
            "쪽지",
            style: chatTitleTextStyle,
          ),
          const Spacer()
        ],
      )
    );
  }
}