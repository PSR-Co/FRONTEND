import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
      letterSpacing: -0.6, fontSize: 14.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  final TextStyle lastMsgTextStyle = const TextStyle(
      letterSpacing: -0.3, fontSize: 14.0, fontWeight: FontWeight.w400, color: GRAY_4_COLOR);
  final TextStyle dateTextStyle = const TextStyle(
      letterSpacing: -0.6, fontSize: 12.0, fontWeight: FontWeight.w400, color: GRAY_2_COLOR);
  final TextStyle numOfUnreadChatsTextStyle = const TextStyle(
      fontSize: 10.0, fontWeight: FontWeight.w400, color: Colors.white);

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
            child: Slidable(
                endActionPane: ActionPane(
                  extentRatio: 0.25,
                  motion: const DrawerMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (BuildContext context) => leaveChatRoom(context),
                      backgroundColor: PINK_COLOR,
                      foregroundColor: Colors.white,
                      label: '나가기',
                    ),
                  ],
                ),
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
                      child: (widget.chatList[index][0] == null)
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
                              widget.chatList[index][1],
                              style: nicknameTextStyle,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Spacer(),
                            Text(
                              widget.chatList[index][2],
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
                        // 날짜(or n분 전), 안 읽은 채팅 수(없을 수도 있음, 100개부터 99+로)
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            widget.chatList[index][3],
                            style: dateTextStyle,
                          ),
                          const Spacer(),
                          Visibility(
                            visible: (widget.chatList[index][4] == 0) ? false : true,
                            child: Container(
                              height: 18,
                              padding: const EdgeInsets.symmetric(horizontal: 6.0),
                              decoration: BoxDecoration(
                                color: PINK_COLOR,
                                shape: (widget.chatList[index][4] < 10) ? BoxShape.circle : BoxShape.rectangle,
                                borderRadius: (widget.chatList[index][4] < 10) ? null : BorderRadius.circular(8.5),
                              ),
                              child: Text(
                                // chatList[index].numOfUnreadChats
                                (widget.chatList[index][4] < 100) ? "${widget.chatList[index][4]}" : "99+",
                                style: numOfUnreadChatsTextStyle,
                              ),
                            ),
                          )
                        ]
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  
  void tapChatItem(int chatRoomId) {

  }

  void leaveChatRoom(BuildContext context) {
    
  }
}