import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatListWidget extends StatelessWidget {
  const ChatListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> chats = [
      {'name': 'Tâm', 'msg': "You: Dạo này bạn sao rồi?", 'time': '9:40 AM', 'read': false},
      {'name': 'Thiên Minh', 'msg': 'You: cảm ơn mày', 'time': '9:25 AM', 'read': true},
      {'name': 'Casino', 'msg': 'You: Ok, vào kèo!', 'time': 'Fri', 'read': true},
      {'name': 'Khang', 'msg': 'Như cc!', 'time': 'Fri', 'read': true},
      {'name': 'Hậu', 'msg': 'Tuổi', 'time': 'Thu', 'read': true},
      {'name': 'Tâm', 'msg': "You: Dạo này bạn sao rồi?", 'time': '9:40 AM', 'read': false},
      {'name': 'Thiên Minh', 'msg': 'You: cảm ơn mày', 'time': '9:25 AM', 'read': true},
      {'name': 'Casino', 'msg': 'You: Ok, vào kèo!', 'time': 'Fri', 'read': true},
      {'name': 'Khang', 'msg': 'Như cc!', 'time': 'Fri', 'read': true},
      {'name': 'Hậu', 'msg': 'Tuổi', 'time': 'Thu', 'read': true},
    ];

    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          leading: CircleAvatar(
            radius: 28,
            backgroundColor: Colors.grey.shade300,
            child: Icon(Icons.person, size: 28, color: Colors.grey.shade600),
          ),
          title: Text(
            chat['name'],
            style: GoogleFonts.roboto(fontWeight: FontWeight.w700, fontSize: 16, fontStyle: FontStyle.normal, color: Colors.black),
          ),
          subtitle: Text(
            '${chat['msg']} · ${chat['time']}',
            style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Icon(
            chat['read'] ? Icons.check_circle_outline : Icons.radio_button_unchecked,
            color: Colors.grey.shade400,
            size: 20,
          ),
        );
      },
    );
  }
}
