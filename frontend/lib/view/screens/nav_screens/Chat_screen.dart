import 'package:flutter/material.dart';
import 'package:frontend/view/screens/nav_screens/widgets/chat_list_widget.dart';
import 'package:frontend/view/screens/nav_screens/widgets/header_widget.dart';
import 'package:frontend/view/screens/nav_screens/widgets/story_widget.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HeaderWidget(),
            StoryWidget(),
            Divider(height: 16, thickness: 1, color: Color(0xFFE0E0E0)),
            ChatListWidget(),
          ],
        ),
      ),
    );
  }
}
