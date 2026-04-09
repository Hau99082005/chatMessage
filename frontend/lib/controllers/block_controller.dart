import 'dart:convert';

import 'package:frontend/services/manage_http_response.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/global_variables.dart';

class BlockController {
  Future<bool> blockUser({
    required String blocker,
    required String blocked,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('${uri}/api/blocks'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: {
          'blocker': blocker,
          'blocked': blocked,
        }
      );
      if(response.statusCode == 200) {
        return true;
      };
      return false;

    }catch(e) {
      return false;
    }
  }
  Future<bool> unblockUser({
    required String blocker,
    required String blocked,
  }) async {
    try {
      final response = await http.delete( 
        Uri.parse('$uri/api/blocks?blocker=$blocker&blocked=$blocked'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: {
          'blocker': blocker,
          'blocked': blocked,
        }
      );
      if(response.statusCode == 200) {
        return true;
      }
      return false;

    }catch(e) {
      return false;
    }
  }
  Future<bool> isBlocked({
    required String blocker,
    required String blocked,
  }) async {
    try {
      final reponse = await http.get(
        Uri.parse('$uri/api/blocks?blocker=$blocker&blocked=$blocked'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        }
      );
      if(reponse.statusCode == 200) {
        return true;
      }
      return false;

    }catch(e) {
      return false;
    }
  }
  Future<List<String>> getBlockedUsers({
    required String blocker,
  }) async {
    try {
      final response = await http.get( 
        Uri.parse('$uri/api/blocks?blocker=$blocker'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        }
      );
      if(response.statusCode == 200) {
        final List data = json.decode(response.body);
        return data.map((e) => e['blocked'] as String).toList();
      }
      return [];

    }catch(e) {
      return[];
    }
  }
  Future<List<String>> getBlockers({
    required String blocked,
  }) async {
    try{
      final response = await http.get( 
        Uri.parse('$uri/api/blocks?blocked=$blocked'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        }
      );
      if(response.statusCode == 200) {
        final List data = json.decode(response.body);
        return data.map((e) => e['blocker'] as String).toList();
      }
      return [];

    }catch(e) {
      return [];
    }
  }  
}
