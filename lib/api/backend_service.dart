import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:my_flutter_application/instances/user.dart';
import 'package:my_flutter_application/localstore/MyController.dart';

class BackendService{
  static const MAIN_URI = 'http://192.168.1.13:8080/api';

  static Future<dynamic> login(User user) async {
    final response = await http.post(
      Uri.parse('${MAIN_URI}/users/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );

    debugPrint('lets go: $response');

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
    var response;

    try{
      response = await http.get(
        Uri.parse('${MAIN_URI}/users/auto-login?username=$username'),
      ).timeout(const Duration(seconds: 1), onTimeout: (){
        throw TimeoutException('Time out!'); 
      },);

      debugPrint('C-REAL: ${(jsonDecode(response.body as String) as Map).keys.first}');

      if (response.statusCode == 200) {
        return (true, (jsonDecode(response.body as String) as Map).keys.first);
      } else {
        return (false, (jsonDecode(response.body as String) as Map).keys.first);
      }


    } on TimeoutException catch (e){
      String date = (await MyController.getCurrentTimeLoggedIn()).toString();
      var date1 = DateTime.parse(date);
      final diff = DateTime.now().difference(date1).inSeconds;
      debugPrint('DIFFERENCE: $diff');

      var initialRoute = true;

      if (diff <= 30){
        return (true, true);
      } else {
        return (false, false);
      }
    }

    

    
  }
}
