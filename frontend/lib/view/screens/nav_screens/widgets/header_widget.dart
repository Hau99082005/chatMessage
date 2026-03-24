import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:frontend/view/screens/profile_screen.dart';

class HeaderWidget extends ConsumerWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final avatarUrl = (user?.avatar ?? '').trim();
    final ImageProvider? avatarProvider = avatarUrl.isNotEmpty ? NetworkImage(avatarUrl) : null;

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const ProfileScreen(),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey.shade300,
                    backgroundImage: avatarProvider,
                    child: avatarProvider == null
                        ? Icon(Icons.person, size: 26, color: Colors.grey.shade700)
                        : null,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  'Chats',
                  style: GoogleFonts.roboto(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.camera_alt_outlined, size: 20),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    constraints:
                        const BoxConstraints(),
                    splashRadius: 20, 
                    icon: const Icon(Icons.edit_note_rounded, size: 20),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 4, thickness: 1, color: Color(0xFFE0E0E0)),
          SizedBox(
            width: double.infinity,
            height: 80,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Tìm kiếm',
                  hintStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.grey.shade600,
                    fontStyle: FontStyle.normal,
                    fontFamily: GoogleFonts.roboto().fontFamily,
                  ),
                  prefixIcon: const Icon(Icons.search, size: 25),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
