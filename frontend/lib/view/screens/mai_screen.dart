import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MaiScreen extends StatefulWidget {
  const MaiScreen({super.key});

  @override
  State<MaiScreen> createState() => _MaiScreenState();
}

class _MaiScreenState extends State<MaiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  bottomNavigationBar: Padding(
    padding: const EdgeInsets.all(8.0),
    child: BottomNavigationBar(
      selectedItemColor: Colors.black,       
      unselectedItemColor: Colors.black54,   
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
);

  }
}
