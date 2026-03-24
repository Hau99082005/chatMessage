import 'dart:convert';

class Chatparticipant {
  final String id;
  final String chat;
  final String user;
  final String role;
  final DateTime joinedAt;

  Chatparticipant({
    required this.id,
    required this.chat,
    required this.user,
    required this.role,
    required this.joinedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "chat": chat,
      "user": user,
      "role": role,
      "joinedAt": joinedAt.microsecondsSinceEpoch,
    };
  }

  String toJson() => json.encode(toMap());

  factory Chatparticipant.fromMap(Map<String, dynamic> map) {
    return Chatparticipant(
      id: map['_id'] as String? ?? "",
      chat: map['chat'] as String? ?? "",
      user: map['user'] as String? ?? "",
      role: map['role'] as String? ?? "",
      joinedAt: DateTime.fromMicrosecondsSinceEpoch(
        (map['joinedAt']) as int? ?? 0,
      ),
    );
  }

  factory Chatparticipant.fromJson(String source) =>
      Chatparticipant.fromMap(json.decode(source) as Map<String, dynamic>);
}
