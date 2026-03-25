import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/services/manage_http_response.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/models/Message.dart';
import 'package:frontend/global_variables.dart';

class MessafeController {
  Future<List<Message>> getMessagesNoUsers({required String chat}) async {
    try {
      final response = await http.get(
        Uri.parse('$uri/api/messages/$chat'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        }
      );
      if(response.statusCode == 200) {
        final List data = json.decode(response.body);
        return data.map((e) => Message.fromMap(e)).toList();
      }
      return [];

    }catch(e) {
      return [];
    }
  } 
  Future<List<Message>> getMessages({ required String chat, required BuildContext context}) async {
    try {
      final response = await http.get( 
        Uri.parse('$uri/api/messages/$chat'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        }
      );
      if(response.statusCode == 200) {
        final List data = json.decode(response.body);
        return data.map((e) => Message.fromMap(e)).toList();
      }
      manageHttpResponse(response: response, context: context, 
      onSuccess: () {});
      return [];
    }catch(e) {
      return [];
    }
  }

  Future<Message?> sendMessage({ required String chat, required String sender, required String text, required BuildContext context}) async {
    try {
      final response = await http.post(
        Uri.parse('$uri/api/messages'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        }
      );
      if(response.statusCode == 200) {
        return Message.fromMap(json.decode(response.body));
      }
      return null;
    }catch(e) {
      return null;
    }
  }

  Future<bool> deleteMessage({ required String message, required BuildContext context}) async {
    try {
      final response = await http.delete(
        Uri.parse('$uri/api/messages/$message'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        }
      );
      if(response.statusCode == 200) {
        return true;
      }
      manageHttpResponse(response: response, context: context, onSuccess: () {});
      return false;

    }catch(e) {
      return false;
    }
  }

  Future<Message?> editMessage({ required String message, required String text, required BuildContext context}) async {
    try {
      final response = await http.put( 
        Uri.parse('$uri/api/messages/$message'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        }
      );
      if(response.statusCode == 200) {
        return Message.fromMap(json.decode(response.body));
      }
      return null;
    }catch(e) {
      return null;
    }
   }

   Future<bool> reactToMessage({ required String message, required String reaction, required BuildContext context}) async { 
    try {
      final response = await http.post(
        Uri.parse('$uri/api/messages/$message/reactions'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        }
      );
      if(response.statusCode == 200) {
        return true;
      }
      manageHttpResponse(response: response, context: context, onSuccess: (){});
      return false;

    }catch(e) {
      return false;
    }
   }

   Future<bool> deleteReaction({ required String message, required String reaction, required BuildContext context}) async {
    try {
     final response = await http.delete(
        Uri.parse('$uri/api/messages/$message/reactions'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        }
     );
     if(response.statusCode == 200) {
      return true;
     }
     manageHttpResponse(response: response, context: context, onSuccess: () {});
     return false;

    }catch(e) {
      return false;
    }
   }

   Future<bool> reportMessage({ required String message, required String reason, required BuildContext context}) async {
    try {
      final response = await http.post(
        Uri.parse('$uri/api/messages/$message/report'), 
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        }
      );
      if(response.statusCode == 200) {
        return true;
      }
      manageHttpResponse(response: response, context: context, onSuccess: () {});
      return false;

    }catch(e) {
      return false;
    }
   }
}