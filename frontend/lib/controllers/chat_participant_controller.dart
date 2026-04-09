import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend/global_variables.dart';
import 'package:frontend/models/ChatParticipant.dart';
import 'package:frontend/services/manage_http_response.dart';
import 'package:http/http.dart' as http;

class ChatParticipantController {
  Future<List<Chatparticipant>> getChatParticipants({required BuildContext context}) async {
    try {
      final response = await http.get(Uri.parse('$uri/api/chatparticipants'),
          headers: {'Content-Type': 'application/json; charset=UTF-8'});
      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        return data.map((e) => Chatparticipant.fromMap(e)).toList();
      }
      manageHttpResponse(response: response, context: context, onSuccess: () {});
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<Chatparticipant?> getChatParticipantById({required String id, required BuildContext context}) async {
    try {
      final response = await http.get(Uri.parse('$uri/api/chatparticipants/$id'),
          headers: {'Content-Type': 'application/json; charset=UTF-8'});
      if (response.statusCode == 200) return Chatparticipant.fromMap(json.decode(response.body));
      manageHttpResponse(response: response, context: context, onSuccess: () {});
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<Chatparticipant?> createChatParticipant({
    required String chat,
    required String user,
    required String role,
    required BuildContext context,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$uri/api/chatparticipants'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: json.encode({'chat': chat, 'user': user, 'role': role}),
      );
      Chatparticipant? result;
      manageHttpResponse(
        response: response,
        context: context,
        onSuccess: () => result = Chatparticipant.fromMap(json.decode(response.body)),
      );
      return result;
    } catch (e) {
      return null;
    }
  }

  Future<bool> deleteChatParticipant({required String id, required BuildContext context}) async {
    try {
      final response = await http.delete(Uri.parse('$uri/api/chatparticipants/$id'),
          headers: {'Content-Type': 'application/json; charset=UTF-8'});
      if (response.statusCode == 200) return true;
      manageHttpResponse(response: response, context: context, onSuccess: () {});
      return false;
    } catch (e) {
      return false;
    }
  }
}
