import 'package:flutter/material.dart';

import '../../common/const/colors.dart';

class ChatMessageListItem extends StatefulWidget {
  List<dynamic> chatMessageList;

  ChatMessageListItem({required this.chatMessageList, Key? key, required BuildContext context}) : super(key: key);

  @override
  State<ChatMessageListItem> createState() => _ChatMessageListItemState();
}

class _ChatMessageListItemState extends State<ChatMessageListItem> {
  final TextStyle myNameTextStyle = const TextStyle(
      letterSpacing: -0.6, fontSize: 14.0, fontWeight: FontWeight.w500, color: SKY_COLOR);
  final TextStyle yourNameTextStyle = const TextStyle(
      letterSpacing: -0.6, fontSize: 14.0, fontWeight: FontWeight.w500, color: PINK_COLOR);
  final TextStyle messageTextStyle = const TextStyle(
      letterSpacing: -0.4, fontSize: 14.0, fontWeight: FontWeight.w400, color: GRAY_4_COLOR);
  final TextStyle dateTextStyle = const TextStyle(
      letterSpacing: -0.6, fontSize: 12.0, fontWeight: FontWeight.w400, color: GRAY_2_COLOR);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 100.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: GRAY_6_COLOR,
            width: 2.0,
          ),
        ),
      ),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        separatorBuilder: (BuildContext context, int index) {
          return Container(height: 2, color: GRAY_6_COLOR);
        },
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: widget.chatMessageList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        widget.chatMessageList[index][1],
                        style: widget.chatMessageList[index][0] ? myNameTextStyle : yourNameTextStyle,
                      )
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      widget.chatMessageList[index][2],
                      style: dateTextStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Text(
                  widget.chatMessageList[index][3],
                  style: messageTextStyle,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}