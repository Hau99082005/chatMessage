import 'dart:convert';

class Messageread {
  final String id;
  final String message;
  final String user;
  final DateTime readAt;

  Messageread({
    required this.id,
    required this.message,
    required this.user,
    required this.readAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "message": message,
      "user": user,
      "readAt": readAt.millisecondsSinceEpoch,
    };
  }

  String toJson() => json.encode(toMap());

  factory Messageread.fromMap(Map<String, dynamic> map) {
    return Messageread(
      id: map['_id'] as String? ?? "",
      message: map['message'] as String? ?? "",
      user: map['user'] as String? ?? "",
      readAt: DateTime.fromMicrosecondsSinceEpoch((map['readAt']) as int? ?? 0),
    );
  }

  factory Messageread.fromJson(String source) =>
      Messageread.fromMap(json.decode(source) as Map<String, dynamic>);
}
