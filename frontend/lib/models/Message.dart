import 'dart:convert';

class Message {
  final String id;
  final String chat;
  final String sender;
  final String text;
  final String message_type;
  final String reply_to;
  final bool is_edited;

  Message({
    required this.id,
    required this.chat,
    required this.sender,
    required this.text,
    required this.message_type,
    required this.reply_to,
    required this.is_edited,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "chat": chat,
      "sender": sender,
      "text": text,
      "message_type": message_type,
      "reply_to": reply_to,
      "is_edited": is_edited,
    };
  }

  String toJson() => json.encode(toMap());

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      id: map['_id'] as String? ?? "",
      chat: map['chat'] as String? ?? "",
      sender: map['sender'] as String? ?? "",
      text: map['text'] as String? ?? "",
      message_type: map['message_type'] as String? ?? "",
      reply_to: map['reply_to'] as String? ?? "",
      is_edited: map['is_edited'] as bool? ?? false,
    );
  }

  factory Message.fromJson(String source) =>
      Message.fromMap(json.decode(source) as Map<String, dynamic>);
}
