import '../../model/network/api_manager.dart';

class ChatService {
  final CHAT_ROOM_LIST = '/chat/rooms';

  static final ChatService _chatService = ChatService._();
  ChatService._();
  factory ChatService() => _chatService;

  Future<dynamic> getChatRoomList() async {
    final response = APIManager().request(RequestType.GET, CHAT_ROOM_LIST, null, null, null);
    print('response: $response');
    return response;
  }

  getChat() {}
}