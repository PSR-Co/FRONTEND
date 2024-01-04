import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:psr/chat/view/chat_room_screen.dart';

import '../../common/const/colors.dart';

class ChatListItem extends StatefulWidget {
  List<dynamic> chatRoomList;

  ChatListItem({required this.chatRoomList, Key? key, required BuildContext context}) : super(key: key);

  @override
  State<ChatListItem> createState() => _ChatListItemState();
}

class _ChatListItemState extends State<ChatListItem> {
  final TextStyle nicknameTextStyle = const TextStyle(
      letterSpacing: -0.6, fontSize: 14.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
  final TextStyle lastMsgTextStyle = const TextStyle(
      letterSpacing: -0.4, fontSize: 14.0, fontWeight: FontWeight.w400, color: GRAY_4_COLOR);
  final TextStyle dateTextStyle = const TextStyle(
      letterSpacing: -0.6, fontSize: 12.0, fontWeight: FontWeight.w400, color: GRAY_2_COLOR);
  final TextStyle numOfUnreadChatsTextStyle = const TextStyle(
      fontSize: 10.0, fontWeight: FontWeight.w400, color: Colors.white);

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
        itemCount: widget.chatRoomList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              goToChatRoom(widget.chatRoomList[index].chatRoomId);
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
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipOval(
                      child: (widget.chatRoomList[index].profileImgUrl == null)
                        ? SvgPicture.asset(
                          'asset/icons/common/default_profile.svg',
                          width: 44,
                          height: 44,
                        )
                        : Image.network(widget.chatRoomList[index].profileImgUrl),
                    ),
                    const SizedBox(
                      width: 14.0,
                    ),
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.chatRoomList[index].nickname,
                              style: nicknameTextStyle,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Spacer(),
                            Text(
                              widget.chatRoomList[index].message,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            /// 날짜(or n분 전) 포맷 처리하기
                            widget.chatRoomList[index].date,
                            style: dateTextStyle,
                          ),
                          const Spacer(),
                          Visibility(
                            visible: (widget.chatRoomList[index].isRead) ? false : true,
                            child: Container(
                              height: 18,
                              padding: const EdgeInsets.symmetric(horizontal: 6.0),
                              decoration: BoxDecoration(
                                color: PINK_COLOR,
                                shape: (widget.chatRoomList[index].numOfUnread < 10) ? BoxShape.circle : BoxShape.rectangle,
                                borderRadius: (widget.chatRoomList[index].numOfUnread < 10) ? null : BorderRadius.circular(8.5),
                              ),
                              child: Text(
                                // chatList[index].numOfUnreadChats
                                (widget.chatRoomList[index].numOfUnread < 100) ? "${widget.chatRoomList[index].numOfUnread}" : "99+",
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
  
  void goToChatRoom(int chatRoomId) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => ChatRoomScreen(id: chatRoomId)
    ));
  }

  void leaveChatRoom(BuildContext context) {
    
  }
}