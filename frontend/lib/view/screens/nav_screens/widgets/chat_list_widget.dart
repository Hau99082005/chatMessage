import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/chat.dart';
import 'package:frontend/providers/chat_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatListWidget extends ConsumerWidget {
  const ChatListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatAsync = ref.watch(chatListProvider);

    return chatAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Lỗi: $e')),
      data: (chats) {
        if (chats.isEmpty) {
          return const Center(child: Padding(
            padding: EdgeInsets.all(24),
            child: Text('Chưa có cuộc trò chuyện nào'),
          ));
        }
        return ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: chats.length,
          itemBuilder: (context, index) => _ChatTile(chat: chats[index]),
        );
      },
    );
  }
}

class _ChatTile extends StatelessWidget {
  final Chat chat;
  const _ChatTile({required this.chat});

  String _formatTime(DateTime dt) {
    final now = DateTime.now();
    final diff = now.difference(dt);
    if (diff.inDays == 0) {
      return '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
    } else if (diff.inDays < 7) {
      const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
      return days[dt.weekday - 1];
    }
    return '${dt.day}/${dt.month}';
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: CircleAvatar(
        radius: 28,
        backgroundColor: Colors.grey.shade300,
        child: Icon(Icons.person, size: 28, color: Colors.grey.shade600),
      ),
      title: Text(
        chat.name.isNotEmpty ? chat.name : 'Chat',
        style: GoogleFonts.roboto(fontWeight: FontWeight.w700, fontSize: 16),
      ),
      subtitle: Text(
        _formatTime(chat.lastMessageAt),
        style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Icon(
        Icons.check_circle_outline,
        color: Colors.grey.shade400,
        size: 20,
      ),
    );
  }
}
