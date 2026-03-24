import 'dart:convert';

class Chat {
  final String id;
  final String participants;
  final String lastMessage;
  final DateTime lastMessageAt;
  final String name;
  final String type;

  Chat({
    required this.id,
    required this.participants,
    required this.lastMessage,
    required this.lastMessageAt,
    required this.name,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "participants": participants,
      "lastMessage": lastMessage,
      "lastMessageAt": lastMessageAt.millisecondsSinceEpoch,
      "name": name,
      "type": type,
    };
  }

  String toJson() => json.encode(toMap());

  factory Chat.fromMap(Map<String, dynamic> map) {
    return Chat(
      id: map['_id'] as String? ?? "",
      participants: map['participants'] as String? ?? "",
      lastMessage: map['lastMessage'] as String? ?? "",
      lastMessageAt: DateTime.fromMicrosecondsSinceEpoch(
        (map['lastMessageAt']) as int? ?? 0,
      ).toLocal(),
      name: map['name'] as String? ?? "",
      type: map['type'] as String? ?? "",
    );
  }
  factory Chat.fromJson(String source) =>
      Chat.fromMap(json.decode(source) as Map<String, dynamic>);
}
