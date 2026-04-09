import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend/global_variables.dart';
import 'package:frontend/models/MessageReaction.dart';
import 'package:frontend/services/manage_http_response.dart';
import 'package:http/http.dart' as http;


class MessageReactionController {
  Future<List<Messagereaction>> getMessageReactions({ required BuildContext context, required String messageId}) async {
    try {
      final response = await http.get(Uri.parse('$uri/api/messagereactions/$messageId'), 
      headers: {
        'Content-Type': 'application/json; charset=UTF-8'
      });
      if(response.statusCode == 200) {
        final List data = json.decode(response.body);
        return data.map((e) => Messagereaction.fromMap(e)).toList();
      }
      manageHttpResponse(response: response, context: context, onSuccess: () {});
      return [];
    }catch(e) {
      return[];
    }
  }
  Future<Messagereaction?> createMessage({ required BuildContext context, required String messageId, required String reaction }) async {
    try {
      final response = await http.post(Uri.parse('$uri/api/messagereactions'), 
      headers: {
        'Content-Type': 'application/json; charset=UTF-8'
      }, body: json.encode({
        'message_id': messageId,
        'reaction': reaction,
      }));
      Messagereaction? result;
      manageHttpResponse(response: response, context: context, onSuccess: 
      () => result = Messagereaction.fromMap(json.decode(response.body))); 
       return result;
    }catch(e) {
      return null;
    }
  }
  Future<bool> deleteMessageReaction({ required BuildContext context, required String messageReactionId}) async {
    try {
      final response = await http.delete(Uri.parse('$uri/api/messagereactions/$messageReactionId'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },);
      manageHttpResponse(response: response, context: context, onSuccess: () {});
      if(response.statusCode == 200) {
        return true;
      }
      return false;
    }catch(e) {
      return false;
    }
  }
  Future<bool> deleteMessageReactions({ required BuildContext context, required String messageId}) async {
    try {
      final response = await http.delete(Uri.parse('$uri/api/messagereactions/message/$messageId'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      });
      if(response.statusCode == 200) {
        return true;
      };
      manageHttpResponse(response: response, context: context, onSuccess: () {});
      if(response.statusCode == 200) {
        return true;
      }else {
        return false;
      }
    }catch(e) {
      return false;
    }
  }
  Future<bool> deleteUserMessageReactions({ required BuildContext context, required String messageId}) async {
    try {
      final response = await http.delete(Uri.parse('$uri/api/messagereactions/message/$messageId/user'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      });
      if(response.statusCode == 200) {
        return true;
      }
      manageHttpResponse(response: response, context: context, onSuccess: () {});
      if(response.statusCode == 200) {
        return true;
      }else {
        return false;
      }

    }catch(e) {
      return false;
    }
  }
  Future<bool> deleteReaction({ required BuildContext context, required String messageId, required String reaction}) async {
    try {
      final reponse = await http.delete(Uri.parse('$uri/api/messagereactions/message/$messageId/reaction/$reaction'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      });
      if(reponse.statusCode == 200) {
        return true;
      }
      manageHttpResponse(response: reponse, context: context, onSuccess: () {});
      if(reponse.statusCode == 200) {
        return true;
      }else {
        return false;
      }

    }catch(e) {
      return false;
    }
  }
  Future<bool> updatedMessageReaction({ required BuildContext context, required String messageReactionId, required String reaction}) async {
    try {
      final response = await http.put(Uri.parse('$uri/api/messagereactions/$messageReactionId'), headers:  {
        'Context-Type': 'application/json; charset=UTF-8',
      });
      if(response.statusCode == 200) {
        return true;
      }
      manageHttpResponse(response: response, context: context, onSuccess: () {});
      if(response.statusCode == 200) {
        return true;
      }else {
        return false;
      }

    }catch(e) {
      return false;
    }
  }
}