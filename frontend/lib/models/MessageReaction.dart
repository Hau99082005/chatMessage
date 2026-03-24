import 'dart:convert';

class Messagereaction {
  final String id;
  final String message;
  final String user;
  final String reaction;

  Messagereaction({
    required this.id,
    required this.message,
    required this.user,
    required this.reaction,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "message": message,
      "user": user,
      "reaction": reaction,
    };
  }

  String toJson() => json.encode(toMap());

  factory Messagereaction.fromMap(Map<String, dynamic> map) {
    return Messagereaction(
      id: map['_id'] as String? ?? "",
      message: map['message'] as String? ?? "",
      user: map['user'] as String? ?? "",
      reaction: map['reaction'] as String? ?? "",
    );
  }

  factory Messagereaction.fromJson(String source) =>
      Messagereaction.fromMap(json.decode(source) as Map<String, dynamic>);
}
