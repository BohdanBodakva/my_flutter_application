import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:my_flutter_application/instances/user.dart';

class BackendService{
  static const MAIN_URI = 'http://10.129.148.53:8080/api';

  static Future<dynamic> login(User user) async {
    final response = await http.post(
      Uri.parse('${MAIN_URI}/users/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      return (true, User.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>
      )!);
    } else {
      return (false, response.body);
    }
  }

  static Future<dynamic> register(User user) async {
    final response = await http.post(
      Uri.parse('${MAIN_URI}/users/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );

    debugPrint('YYYYYYY: ${response.body}');

    if (response.statusCode == 200) {
      return (true, User.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>
      )!);
    } else {
      return (false, response.body);
    }
  }

  static Future<dynamic> autoLogin(String username) async {
    final response = await http.get(
      Uri.parse('${MAIN_URI}/users/auto-login'),
    );

    if (response.statusCode == 200) {
      return (true, User.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>
      )!);
    } else {
      return (false, response.body);
    }
  }
}
