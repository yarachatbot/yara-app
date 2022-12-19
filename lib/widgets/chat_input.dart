import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  final void Function(String) onInput;
  final bool? disabled;
  ChatInput({Key? key, required this.onInput, this.disabled}) : super(key: key);

  final TextEditingController _controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              enabled: (disabled == true) ? false : true,
              focusNode: focusNode,
              controller: _controller,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                hintText: '',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          TextButton(
            onPressed: disabled == true
                ? null
                : () {
                    final String input = _controller.text;
                    onInput(input);
                    _controller.clear();
                  },
            child: const Icon(
              Icons.star_rounded,
              color: Colors.yellow,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
