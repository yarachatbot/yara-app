import 'package:flutter/material.dart';

class ChatBox extends StatelessWidget {
  final String message;
  final bool self;
  const ChatBox({Key? key, required this.message, required this.self})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: (!self ? Alignment.topLeft : Alignment.topRight),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
              topLeft: self ? Radius.circular(30) : Radius.zero,
              topRight: self ? Radius.zero : Radius.circular(30),
            ),
          ),
          child: Text(message),
        ),
      ),
    );
  }
}
