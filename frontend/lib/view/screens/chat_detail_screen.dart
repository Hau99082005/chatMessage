import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/chat.dart';
import 'package:frontend/models/Message.dart';
import 'package:frontend/providers/Message_provider.dart';
import 'package:frontend/providers/user_provider.dart';

class ChatDetailScreen extends ConsumerStatefulWidget {
  final Chat chat;
  const ChatDetailScreen({super.key, required this.chat});

  @override
  ConsumerState<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends ConsumerState<ChatDetailScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(selectedChatIdProvider.notifier).state = widget.chat.id;
    });
  }

  @override
  Widget build(BuildContext context) {
    final me = ref.watch(userProvider);
    final messagesAsync = ref.watch(messageListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.chat.name.isNotEmpty ? widget.chat.name : 'Chat'),
      ),
      body: messagesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Lỗi: $e')),
        data: (messages) {
          if (messages.isEmpty) {
            return const Center(child: Text('Chưa có tin nhắn'));
          }
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final m = messages[index];
              final isMe = me != null && me.id.isNotEmpty && m.sender == me.id;
              return _MessageBubble(message: m, isMe: isMe);
            },
          );
        },
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  final Message message;
  final bool isMe;
  const _MessageBubble({required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    final bg = isMe ? Colors.lightBlueAccent.shade100 : Colors.grey.shade200;
    final align = isMe ? Alignment.centerRight : Alignment.centerLeft;

    return Align(
      alignment: align,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        constraints: const BoxConstraints(maxWidth: 280),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Text(
          message.text,
          style: const TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
