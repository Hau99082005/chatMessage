import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/global_variables.dart';
import 'package:frontend/models/user.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:frontend/services/manage_http_response.dart';
import 'package:frontend/view/screens/authentication/login_screen.dart';
import 'package:frontend/view/screens/main_screen.dart';
import 'package:http/http.dart' as http;

class AuthController {
  Future<void> Register({
    required context,
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      User user = User(
        id: '',
        firebaseUid: '',
        username: username,
        email: email,
        password: password,
        token: '',
        avatar: '',
        bio: '',
      );
      http.Response response = await http.post(
        Uri.parse('${uri}/api/register'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      manageHttpResponse(
        response: response,
        context: context,
        onSuccess: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
          showSnackbar(context, 'Đăng ký thành công!');
        },
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> Login({
    required BuildContext context,
    required WidgetRef ref,
    required String email,
    required String password,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse('${uri}/api/login'),
        body: jsonEncode({'email': email, 'password': password}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      manageHttpResponse(
        response: response,
        context: context,
        onSuccess: () async {
          final data = jsonDecode(response.body);
          final user = User.fromMap(data['user']);
          await ref.read(userProvider.notifier).setUser(user);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const MainScreen()), (route) => false);
          showSnackbar(context, "Đăng nhập thành công!");
        },
      );
    } catch (e) {
      print(e);
    }
  }
}
