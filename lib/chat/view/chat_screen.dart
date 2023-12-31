import 'package:flutter/material.dart';
import 'package:psr/common/const/colors.dart';

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
  /// 더미데이터(사진/닉네임/마지막 채팅/날짜/안 읽은 채팅 수)
  List<dynamic> chatList = [
    [null, "슈크림붕어빵", "안녕하시와요", "오후 10:11", 1],
    [null, "뽀로로", "아아 알겠습니다!", "3시간 전", 0],
    [null, "겨울엔고구마라떼", "넵", "어제", 0],
    [null, "밤빵", "괜찮습니다~^^ 수고하세요.", "12월 1일", 0],
    [null, "새벽근무중", "에효", "12월 1일", 54],
    [null, "123", "?", "11월 31일", 1],
    [null, "긴 문자열 테스트 중----긴 문자열 테스트 중----긴 문자열 테스트 중----", "여기도 테스트 중입니다. 지나갑니당..여기도 테스트 중입니다. 지나갑니당..", "1월 1일", 10],
    [null, "놀러오세요 개발의숲", "머리 쥐어뜯는중 ㅋㅋ", "2022.11.12", 1],
    [null, "ㅇㅇ", "저 13살인데요?", "2022.10.31", 2],
    [null, "홍길동", "저 안읽씹 싫어하는데...", "2022.10.22", 100],
    [null, "온새미로", "인소 여주 아닙니다", "2022.09.01", 3],
  ];

  Future<dynamic> fetchData() async {
    return await ChatService().getChatList();
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
                  } else if (!snapshot.hasData) {
                    /* 채팅 emptyView 필요 */
                    // return const CircularProgress();
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
    return Column(
      children: [
        chatHeader(),
        Expanded(
            child: SingleChildScrollView(
              child: ChatListItem(context: context, chatList: chatList),
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