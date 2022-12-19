import 'package:chatapp/models/chat.dart';
import 'package:dio/dio.dart';

class ChatService {
  static generateConvo(List<ChatModel> chats) {
    final int count = 2;
    String convo = '';
    int start = chats.length > 4 ? chats.length - 2 * count : 0;
    for (; start < chats.length; start++) {
      final chat = chats[start];
      convo += chat.toString();
    }
    convo += 'Yara:';
    return convo;
  }

  static Future<ChatModel> sendMessage(
      List<ChatModel> chats, String name) async {
    final String convo = generateConvo(chats);
    // print(convo);

    // Send message to server
    const String url = 'https://yara-thera.azurewebsites.net/text';
    final dio = Dio();
    final response = await dio.post(url, data: {'convo': convo, 'name': name});
    final data = response.data;

    final message = data['result'];
    return ChatModel(message: message, name: 'Yara');
  }
}
