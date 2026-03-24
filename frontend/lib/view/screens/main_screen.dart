import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/view/screens/nav_screens/Chat_screen.dart';
import 'package:frontend/view/screens/nav_screens/Menu_screen.dart';
import 'package:frontend/view/screens/nav_screens/Notification_screen.dart';
import 'package:frontend/view/screens/nav_screens/Stories_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      const ChatScreen(),
      const StoriesScreen(),
      const NotificationScreen(),
      const MenuScreen(),
    ];
    return Scaffold(
  bottomNavigationBar: Padding(
    padding: const EdgeInsets.all(8.0),
    child: BottomNavigationBar(
      selectedItemColor: Colors.blue.shade400,
      unselectedItemColor: Colors.black54,
      currentIndex: _pageIndex,
      onTap: (value) {
         setState(() {
           _pageIndex = value;
         });
      },  
      type: BottomNavigationBarType.fixed, 

      items: [
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.message),
          label: 'Đoạn Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.fileLines),
          label: 'Tin',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.bell),
          label: 'Thông báo',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.bars),
          label: 'Menu',
        ),
      ],
    ),
  ),
  body: pages[_pageIndex],
);

  }
}
