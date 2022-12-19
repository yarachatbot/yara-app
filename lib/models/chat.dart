class ChatModel {
  final String message;
  final String name;
  final bool self;

  ChatModel({
    required this.message,
    required this.name,
    this.self = false,
  });

  @override
  String toString() {
    return '$name: $message\n';
  }
}
