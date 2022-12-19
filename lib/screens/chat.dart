import 'package:chatapp/utils/snack_bars.dart';
import 'package:flutter/material.dart';

import 'package:chatapp/models/chat.dart';
import 'package:chatapp/services/chat.dart';
import 'package:chatapp/widgets/chat_input.dart';
import 'package:chatapp/widgets/chat_view.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  const ChatScreen({Key? key, required this.name}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool _loading = false;
  final List<ChatModel> _chats = [];
  final ScrollController _scrollController = ScrollController();

  _scrollDown() async {
    await Future.delayed(const Duration(milliseconds: 300));
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  _sendMessage() async {
    setState(() {
      _loading = true;
    });
    try {
      final response = await ChatService.sendMessage([], widget.name);
      // _scrollDown();
      setState(() {
        _chats.add(response);
      });
      _scrollDown();
    } catch (error) {
      // print(error);
      // show a snackbar
      showErrorBar(context, 'Something went wrong!');
    }
    setState(() {
      _loading = false;
    });
  }

  _onInput(String input) async {
    if (input.isEmpty) return;
    // _scrollDown();
    setState(() {
      _loading = true;
      _chats.add(ChatModel(message: input, name: widget.name, self: true));
    });
    _scrollDown();

    try {
      final response = await ChatService.sendMessage(_chats, widget.name);
      // _scrollDown();
      setState(() {
        _chats.add(response);
      });
      _scrollDown();
    } catch (error) {
      // print(error);
      _chats.removeLast();
      showErrorBar(context, 'Something went wrong!');
    }

    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _sendMessage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ChatView(
                chats: _chats,
                controller: _scrollController,
              ),
              ChatInput(
                onInput: _onInput,
                disabled: _loading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
