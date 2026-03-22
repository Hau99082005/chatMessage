import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void manageHttpResponse({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  String extracMessage(String body) {
    try {
     final dynamic decoded = json.decode(body);
      if (decoded is Map<String, dynamic>) {
        final dynamic msg = decoded['msg'] ??
            decoded['message'] ??
            decoded['error'] ??
            decoded['errors'];
        if (msg == null) return '';
        return msg.toString();
      }
      return decoded?.toString() ?? '';
    }catch(e) {
      return body;
    }
  }
  switch(response.statusCode) {
    case 200:
    case 201:
      onSuccess();
      break;
    case 400:
    case 401:
    case 403:
    case 404:
    case 409:
    case 422:
      final String message = extracMessage(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(
          message.isNotEmpty ? message : 'Yêu cầu không hợp lệ. Vui lòng thử lại.',
          style: GoogleFonts.lato(fontSize: 16,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal
          ),
        ))
      );
      break;
    case 500:
      final msg = extracMessage(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(
          msg.isNotEmpty ? msg : 'Đã xảy ra lỗi server. vui lòng thử lại sau.',
          style: GoogleFonts.lato(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal
          )
        ))
      );
      break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(
            'Đã xảy ra lỗi không xác định. vui lòng thử lại sau.',
            style: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal
            )
          ))
        );
        break;
  }
}

void showSnackbar(BuildContext context, String title) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      margin: const EdgeInsets.all(10),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.green.shade400,
      content: Text(title, style: GoogleFonts.roboto(
        fontStyle: FontStyle.normal,
        fontSize: 16,
        fontWeight: FontWeight.w600
      ),)));
  
}
