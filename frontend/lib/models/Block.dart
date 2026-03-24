import 'dart:convert';

class Block {
  final String id;
  final String blocker;
  final String blocked;

  Block({required this.id, required this.blocker, required this.blocked});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{"id": id, "blocker": blocker, "blocked": blocked};
  }

  String toJson() => json.encode(toMap());

  factory Block.fromMap(Map<String, dynamic> map) {
    return Block(
      id: map['_id'] as String? ?? "",
      blocker: map['blocker'] as String? ?? "",
      blocked: map['blocked'] as String? ?? "",
    );
  }

  factory Block.fromJson(String source) =>
      Block.fromMap(json.decode(source) as Map<String, dynamic>);
}
