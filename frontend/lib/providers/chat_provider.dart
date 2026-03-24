import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/chat.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:frontend/controllers/chat_controller.dart';

final chatListProvider = FutureProvider<List<Chat>>((ref) async {
  final user = ref.watch(userProvider);
  if (user == null || user.id.isEmpty) return [];
  return ChatController().getUserChatsNoContext(userId: user.id);
});
