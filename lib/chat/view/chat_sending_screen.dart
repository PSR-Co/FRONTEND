import 'package:flutter/material.dart';

import '../../common/const/colors.dart';

class ChatSendingScreen extends StatefulWidget {
  const ChatSendingScreen({Key? key}) : super(key: key);

  @override
  State<ChatSendingScreen> createState() => _ChatSendingScreenState();
}

class _ChatSendingScreenState extends State<ChatSendingScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextStyle titleTextStyle = const TextStyle(
      fontSize: 15.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  final TextStyle messageTextStyle = const TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.w400, color: GRAY_4_COLOR);
  final TextStyle hintTextStyle = const TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.w400, color: GRAY_1_COLOR);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(48.0),
        child: chatSendingScreenAppBar(),
      ),
      body: messageInputView(),
    );
  }

  Widget chatSendingScreenAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0.0,
      title: Text(
        "쪽지 보내기",
        style: titleTextStyle,
      ),
      actions: [
        /// 전송 버튼
      ],
    );
  }

  Widget messageInputView() {
    return Scrollbar(
      controller: _scrollController,
      child: TextField(
        scrollController: _scrollController,
        autocorrect: false,
        keyboardType: TextInputType.multiline,
        style: messageTextStyle,
        minLines: null,
        maxLines: null,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 24.0),
          border: InputBorder.none,
          hintText: "메시지를 입력하세요.",
          hintStyle: hintTextStyle,
        ),
      ),
    );
  }
}