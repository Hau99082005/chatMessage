import 'dart:convert';

class Attachment {
  final String id;
  final String message;
  final String file_url;
  final String file_name;
  final String file_type;
  final int file_size;

  Attachment({
    required this.id,
    required this.message,
    required this.file_url,
    required this.file_name,
    required this.file_type,
    required this.file_size,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "message": message,
      "file_url": file_url,
      "file_name": file_name,
      "file_type": file_type,
      "file_size": file_size,
    };
  }

  String toJson() => json.encode(toMap());

  factory Attachment.fromMap(Map<String, dynamic> map) {
    return Attachment(
      id: map['_id'] as String? ?? "",
      message: map['message'] as String? ?? "",
      file_url: map['file_url'] as String? ?? "",
      file_name: map['file_name'] as String? ?? "",
      file_type: map['file_type'] as String? ?? "",
      file_size: map['file_size'] as int? ?? 0,
    );
  }

  factory Attachment.fromJson(String source) =>
      Attachment.fromMap(json.decode(source) as Map<String, dynamic>);
}
