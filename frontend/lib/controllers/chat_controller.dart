import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend/global_variables.dart';
import 'package:frontend/models/chat.dart';
import 'package:frontend/services/manage_http_response.dart';
import 'package:http/http.dart' as http;

class ChatController {
  Future<List<Chat>> getUserChatsNoContext({required String userId}) async {
    try {
      final response = await http.get(
        Uri.parse('$uri/api/chats/user/$userId'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      );
      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        return data.map((e) => Chat.fromMap(e)).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<List<Chat>> getUserChats({
    required BuildContext context,
    required String userId,
  }) async {
    try {
      final response = await http.get(
        Uri.parse('$uri/api/chats/user/$userId'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      );
      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        return data.map((e) => Chat.fromMap(e)).toList();
      } else {
        manageHttpResponse(
          response: response,
          context: context,
          onSuccess: () {},
        );
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<Chat?> getChatById({
    required BuildContext context,
    required String chatId,
  }) async {
    try {
      final response = await http.get(
        Uri.parse('$uri/api/chats/$chatId'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      );
      if (response.statusCode == 200) {
        return Chat.fromMap(json.decode(response.body));
      } else {
        manageHttpResponse(response: response, context: context, onSuccess: () {});
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<Chat?> createChat({
    required BuildContext context,
    required List<String> participants,
    String type = 'private',
    String name = '',
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$uri/api/chats'),
        body: json.encode({
          'participants': participants,
          'type': type,
          'name': name,
          'lastMessageAt': DateTime.now().toIso8601String(),
        }),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      );
      Chat? created;
      manageHttpResponse(
        response: response,
        context: context,
        onSuccess: () {
          created = Chat.fromMap(json.decode(response.body));
        },
      );
      return created;
    } catch (e) {
      return null;
    }
  }

  Future<void> deleteChat({
    required BuildContext context,
    required String chatId,
  }) async {
    try {
      final response = await http.delete(
        Uri.parse('$uri/api/chats/$chatId'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      );
      manageHttpResponse(response: response, context: context, onSuccess: () {});
    } catch (e) {}
  }
}
