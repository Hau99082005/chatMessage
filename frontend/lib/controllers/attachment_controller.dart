import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend/global_variables.dart';
import 'package:frontend/models/Attachment.dart';
import 'package:frontend/services/manage_http_response.dart';
import 'package:http/http.dart' as http;

class AttachmentController {
  Future<List<Attachment>> getAttachments({required BuildContext context}) async {
    try {
      final response = await http.get(Uri.parse('$uri/api/atachments'),
          headers: {'Content-Type': 'application/json; charset=UTF-8'});
      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        return data.map((e) => Attachment.fromMap(e)).toList();
      }
      manageHttpResponse(response: response, context: context, onSuccess: () {});
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<Attachment?> getAttachmentById({required String id, required BuildContext context}) async {
    try {
      final response = await http.get(Uri.parse('$uri/api/atachments/$id'),
          headers: {'Content-Type': 'application/json; charset=UTF-8'});
      if (response.statusCode == 200) return Attachment.fromMap(json.decode(response.body));
      manageHttpResponse(response: response, context: context, onSuccess: () {});
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<Attachment?> createAttachment({
    required String message,
    required String fileUrl,
    required String fileName,
    required String fileType,
    required int fileSize,
    required BuildContext context,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$uri/api/atachments'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: json.encode({
          'message': message,
          'file_url': fileUrl,
          'file_name': fileName,
          'file_type': fileType,
          'file_size': fileSize,
        }),
      );
      Attachment? result;
      manageHttpResponse(
        response: response,
        context: context,
        onSuccess: () => result = Attachment.fromMap(json.decode(response.body)),
      );
      return result;
    } catch (e) {
      return null;
    }
  }

  Future<bool> deleteAttachment({required String id, required BuildContext context}) async {
    try {
      final response = await http.delete(Uri.parse('$uri/api/atachments/$id'),
          headers: {'Content-Type': 'application/json; charset=UTF-8'});
      if (response.statusCode == 200) return true;
      manageHttpResponse(response: response, context: context, onSuccess: () {});
      return false;
    } catch (e) {
      return false;
    }
  }
}
