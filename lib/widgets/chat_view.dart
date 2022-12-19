import 'package:chatapp/models/chat.dart';
import 'package:chatapp/widgets/chat_box.dart';
import 'package:flutter/material.dart';

// This is my test message for you bot

class ChatView extends StatelessWidget {
  final List<ChatModel> chats;
  final ScrollController controller;
  const ChatView({Key? key, required this.chats, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 60),
      child: ListView.builder(
        // shrinkWrap: true,
        controller: controller,
        itemCount: chats.length,
        itemBuilder: (ctx, index) {
          final chat = chats[index];
          return ChatBox(
            message: chat.message,
            self: chat.self,
          );
        },
      ),
    );
  }
}
