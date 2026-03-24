import 'dart:convert';

class User {
  final String id;
  final String firebaseUid;
  final String username;
  final String email;
  final String password;
  final String avatar;
  final String bio;
  final String token;

  User({
    required this.id,
    required this.firebaseUid,
    required this.username,
    required this.email,
    required this.password,
    required this.avatar,
    required this.bio,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic> {
       "id": id,
       "firebaseUid": firebaseUid,
       "username": username,
       "email": email,
       "password": password,
       "avatar": avatar,
       "bio": bio,
       "token": token,
    };
  }

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> map) {
    return User(id: map['_id'] as String? ?? "", 
    firebaseUid: map['firebaseUid'] as String? ?? "", 
    username: map['username'] as String? ?? "", 
    email: map['email'] as String? ?? "",
    password: map['password'] as String? ?? "", 
    avatar: map['avatar'] as String? ?? "", 
    bio: map['bio'] as String? ?? "",
    token: map['token'] as String? ?? "",);
  }
  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);
  
}
