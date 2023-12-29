import 'package:flutter/material.dart';

import '../../common/const/colors.dart';

class ChatMessageListItem extends StatefulWidget {
  List<dynamic> chatMessageList;

  ChatMessageListItem({required this.chatMessageList, Key? key, required BuildContext context}) : super(key: key);

  @override
  State<ChatMessageListItem> createState() => _ChatMessageListItemState();
}

class _ChatMessageListItemState extends State<ChatMessageListItem> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: GRAY_6_COLOR,
            width: 2.0,
          ),
        ),
      ),
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return Container(height: 4, color: GRAY_6_COLOR);
        },
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: widget.chatMessageList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(

          );
        },
      ),
    );
  }
}