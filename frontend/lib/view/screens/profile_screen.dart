import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:frontend/view/screens/authentication/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    final dividerColor = Colors.grey.shade200;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Xong',
                style: TextStyle(fontFamily: 'roboto', fontSize: 16,
                fontWeight: FontWeight.w600, fontStyle: FontStyle.normal,
                color: Colors.black),
              ),
            ),
          ),
        ],
      ),
      body: Consumer(
        builder: (context, ref, _) {
          final user = ref.watch(userProvider);
          final name = (user?.username ?? '').trim().isNotEmpty ? user!.username : 'User';
          final email = (user?.email ?? '').trim();
          final avatarUrl = (user?.avatar ?? '').trim();
          final ImageProvider? avatarProvider = avatarUrl.isNotEmpty ? NetworkImage(avatarUrl) : null;

          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              const SizedBox(height: 12),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 136,
                      height: 136,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFF2B74FF), width: 2),
                      ),
                    ),
                    CircleAvatar(
                      radius: 54,
                      backgroundColor: Colors.grey.shade200,
                      backgroundImage: avatarProvider,
                      child: avatarProvider == null
                          ? Icon(Icons.person, size: 44, color: Colors.grey.shade700)
                          : null,
                    ),
                    Positioned(
                      right: 18,
                      bottom: 18,
                      child: Container(
                        width: 34,
                        height: 34,
                        decoration: BoxDecoration(
                          color: const Color(0xFF2B74FF),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                        ),
                        child: const Icon(Icons.edit, size: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              Center(
                child: Text(
                  name,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
                ),
              ),
              const SizedBox(height: 18),
              Container(height: 1, color: dividerColor),
              _SwitchTile(
                icon: Icons.dark_mode,
                iconColor: Colors.black,
                title: 'Chế độ tối',
                value: _darkMode,
                onChanged: (v) => setState(() => _darkMode = v),
              ),
              Container(height: 1, color: dividerColor),
              _NavTile(
                icon: Icons.message,
                iconColor: const Color(0xFF34C759),
                title: 'Trạng thái hoạt động',
                trailingText: 'Bật',
                onTap: () {},
              ),
              Container(height: 1, color: dividerColor),
              _NavTile(
                icon: Icons.alternate_email,
                iconColor: const Color(0xFFFF3B30),
                title: 'Tên người dùng',
                trailingText: name,
                onTap: () {},
              ),
              Container(height: 1, color: dividerColor),
              _NavTile(
                icon: Icons.phone,
                iconColor: const Color(0xFF007AFF),
                title: 'Email',
                trailingText: email.isNotEmpty ? email : null,
                onTap: () {},
              ),
              const SizedBox(height: 16),
              const Text(
                'TUỲ CHỌN',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.6,
                  color: Color(0xFF9E9E9E),
                ),
              ),
              const SizedBox(height: 8),
              Container(height: 1, color: dividerColor),
              _NavTile(
                icon: Icons.notifications,
                iconColor: const Color(0xFFAF52DE),
                title: 'Thông báo và âm thanh',
                onTap: () {},
              ),
              Container(height: 1, color: dividerColor),
              _NavTile(
                icon: Icons.people,
                iconColor: const Color(0xFF00C7BE),
                title: 'Mọi người',
                onTap: () {},
              ),
              Container(height: 1, color: dividerColor),
              _NavTile(
                icon: Icons.chat_bubble,
                iconColor: const Color(0xFF5856D6),
                title: 'Cài đặt nhắn tin',
                onTap: () {},
              ),
              Container(height: 1, color: dividerColor),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(color: Color(0xFFFF3B30), shape: BoxShape.circle),
                  child: const Icon(Icons.logout, color: Colors.white, size: 18),
                ),
                title: const Text('Đăng xuất', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                onTap: () async {
                  await ref.read(userProvider.notifier).clearUser();
                  if (!mounted) return;
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                    (route) => false,
                  );
                },
              ),
              const SizedBox(height: 24),
            ],
          );
        },
      ),
    );
  }
}

class _NavTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String? trailingText;
  final VoidCallback onTap;

  const _NavTile({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.onTap,
    this.trailingText,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(color: iconColor, shape: BoxShape.circle),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
      title: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailingText != null)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Text(trailingText!, style: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 14)),
            ),
          const Icon(Icons.chevron_right, color: Color(0xFFBDBDBD)),
        ],
      ),
      onTap: onTap,
    );
  }
}

class _SwitchTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _SwitchTile({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(color: iconColor, shape: BoxShape.circle),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
      title: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeThumbColor: const Color(0xFF34C759),
      ),
    );
  }
}
