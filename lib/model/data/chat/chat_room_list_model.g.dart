// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRoomListModel _$ChatRoomListModelFromJson(Map<String, dynamic> json) =>
    ChatRoomListModel(
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : ChatRoomList.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatRoomListModelToJson(ChatRoomListModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

ChatRoomList _$ChatRoomListFromJson(Map<String, dynamic> json) => ChatRoomList(
      noticeLists: (json['noticeLists'] as List<dynamic>)
          .map((e) => ChatRoom.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChatRoomListToJson(ChatRoomList instance) =>
    <String, dynamic>{
      'noticeLists': instance.noticeLists,
    };

ChatRoom _$ChatRoomFromJson(Map<String, dynamic> json) => ChatRoom(
      chatRoomId: json['chatRoomId'] as int,
      profileImgUrl: json['profileImgUrl'] as String?,
      nickname: json['nickname'] as String,
      message: json['message'] as String,
      date: json['date'] as String,
      isRead: json['isRead'] as bool,
      numOfUnread: json['numOfUnread'] as int,
    );

Map<String, dynamic> _$ChatRoomToJson(ChatRoom instance) => <String, dynamic>{
      'chatRoomId': instance.chatRoomId,
      'profileImgUrl': instance.profileImgUrl,
      'nickname': instance.nickname,
      'message': instance.message,
      'date': instance.date,
      'isRead': instance.isRead,
      'numOfUnread': instance.numOfUnread,
    };
