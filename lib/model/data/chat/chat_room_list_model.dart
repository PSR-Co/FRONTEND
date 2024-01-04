import 'package:json_annotation/json_annotation.dart';
import 'package:psr/model/data/general_model.dart';

part 'chat_room_list_model.g.dart';

@JsonSerializable()
class ChatRoomListModel extends GeneralModel {
  final ChatRoomList? data;

  ChatRoomListModel({required super.code, required super.message, required this.data});
  factory ChatRoomListModel.fromJson(Map<String, dynamic> json) => _$ChatRoomListModelFromJson(json);
}

@JsonSerializable()
class ChatRoomList {
  final List<ChatRoom> noticeLists;

  ChatRoomList({required this.noticeLists});
  factory ChatRoomList.fromJson(Map<String, dynamic> json) => _$ChatRoomListFromJson(json);
}

@JsonSerializable()
class ChatRoom {
  final int chatRoomId;
  final String profileImgUrl;
  final String nickname;
  final String message;
  final String date;
  final bool isRead;
  final int numOfUnread;

  ChatRoom({
    required this.chatRoomId,
    required this.profileImgUrl,
    required this.nickname,
    required this.message,
    required this.date,
    required this.isRead,
    required this.numOfUnread,
  });

  factory ChatRoom.fromJson(Map<String, dynamic> json) => _$ChatRoomFromJson(json);
}
