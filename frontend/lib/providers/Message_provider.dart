import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart' show StateProvider;
import 'package:frontend/controllers/Messafe_controller.dart';
import 'package:frontend/models/Message.dart';

final selectedChatIdProvider = StateProvider<String?>((ref) => null);

final messageListProvider = FutureProvider<List<Message>>((ref) async {
   final chatId = ref.watch(selectedChatIdProvider);
   if(chatId == null || chatId.isEmpty) return [];
   return MessafeController().getMessagesNoUsers(chat: chatId);
});