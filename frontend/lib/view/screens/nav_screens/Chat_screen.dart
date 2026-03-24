import 'package:flutter/material.dart';
import 'package:frontend/view/screens/nav_screens/widgets/header_widget.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(),
          ],
        ),
      )
    );
  }
}