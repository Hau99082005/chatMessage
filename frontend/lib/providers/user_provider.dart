import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

final userProvider = NotifierProvider<UserNotifier, User?>(() => UserNotifier());

class UserNotifier extends Notifier<User?> {
  @override
  User? build() {
    _loadFromPrefs();
    return null;
  }

  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('user');
    if (data != null) {
      state = User.fromJson(data);
    }
  }

  Future<void> setUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', user.toJson());
    state = user;
  }

  Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
    state = null;
  }
}
