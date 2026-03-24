import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StoryWidget extends StatelessWidget {
  const StoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> stories = [
      {'name': 'Thiện Tâm', 'online': true},
      {'name': 'Hậu', 'online': true},
      {'name': 'Lê Hậu', 'online': true},
      {'name': 'Thiên Minh', 'online': false},
      {'name': 'Đức', 'online': true},
      {'name': 'Quốc', 'online': true},
      {'name': 'Hưng', 'online': false},
      {'name': 'Hải', 'online': false}
    ];

    return SizedBox(
      height: 110,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        children: [
          _buildAddStory(),
          ...stories.map((s) => _buildStoryItem(s['name'], s['online'])),
        ],
      ),
    );
  }

  Widget _buildAddStory() {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.add, size: 28, color: Colors.black),
          ),
          const SizedBox(height: 6),
          Text('Tin của bạn', 
          style: GoogleFonts.roboto(fontWeight: FontWeight.w500, 
          fontSize: 14,
          fontStyle: FontStyle.normal,
          color: Colors.black)),
        ],
      ),
    );
  }

  Widget _buildStoryItem(String name, bool online) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey.shade300,
                child: Icon(Icons.person, size: 30, color: Colors.grey.shade600),
              ),
              if (online)
                Positioned(
                  bottom: 2,
                  right: 2,
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 6),
          Text(name, style: GoogleFonts.roboto(
            fontStyle: FontStyle.normal,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          )),
        ],
      ),
    );
  }
}
