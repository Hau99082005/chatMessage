import 'dart:convert';

class Chat {
  final String id;
  final List<String> participants;
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
      '_id': id,
      'participants': participants,
      'lastMessage': lastMessage,
      'lastMessageAt': lastMessageAt.toIso8601String(),
      'name': name,
      'type': type,
    };
  }

  String toJson() => json.encode(toMap());

  factory Chat.fromMap(Map<String, dynamic> map) {
    return Chat(
      id: map['_id'] as String? ?? '',
      participants: List<String>.from(map['participants'] ?? []),
      lastMessage: map['lastMessage'] as String? ?? '',
      lastMessageAt: map['lastMessageAt'] != null
          ? DateTime.parse(map['lastMessageAt'].toString())
          : DateTime.now(),
      name: map['name'] as String? ?? '',
      type: map['type'] as String? ?? 'private',
    );
  }

  factory Chat.fromJson(String source) =>
      Chat.fromMap(json.decode(source) as Map<String, dynamic>);
}
