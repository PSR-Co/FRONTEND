import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/const/colors.dart';

class ChatListItem extends StatefulWidget {
  List<dynamic> chatList;

  ChatListItem({required this.chatList, Key? key}) : super(key: key);

  @override
  State<ChatListItem> createState() => _ChatListItemState();
}

class _ChatListItemState extends State<ChatListItem> {
  final TextStyle nicknameTextStyle = const TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  final TextStyle lastMsgTextStyle = const TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.w400, color: GRAY_4_COLOR);
  final TextStyle dateTextStyle = const TextStyle(
      fontSize: 12.0, fontWeight: FontWeight.w400, color: GRAY_2_COLOR);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 4);
        },
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: widget.chatList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              tapChatItem(widget.chatList[index].id);
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 80.0,
              margin: EdgeInsets.only(bottom: (index == widget.chatList.length-1) ? 4 : 0),
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: LIGHT_SHADOW_COLOR, blurRadius: 4.0),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipOval(
                    // 상대방 프로필 이미지(기본 프로필 이미지)
                    child: (widget.chatList[0] == null)
                        ? SvgPicture.asset(
                            'asset/icons/common/default_profile.svg',
                            width: 44,
                            height: 44,
                          )
                        : Image.network(widget.chatList[0]),
                  ),
                  const SizedBox(
                    width: 14.0,
                  ),
                  Expanded(
                    child: Column(
                      // 닉네임, 마지막 채팅 텍스트(길어지면 말줄임표)
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          // widget.chatList[index].nickname,
                          "나나",
                          style: nicknameTextStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          // "${chatList[index].lastMessage}"
                          "안녕하세요! 문의사항이 있어 채팅 남깁니다. 확인하시면 연락주세요!",
                          style: lastMsgTextStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    )
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  SizedBox(
                    child: Column(
                      // 날짜(or n분 전), 안 읽은 채팅 수(없을 수도 있음, 100개부터 99+로?)
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "방금 전",
                          style: dateTextStyle,
                        ),
                      ]
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  
  void tapChatItem(int chatRoomId) {

  }
}