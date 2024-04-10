import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_flutter_application/api/backend_service.dart';
import 'package:my_flutter_application/instances/user.dart';
import 'package:http/http.dart' as http;
import 'package:my_flutter_application/localstore/my_controller.dart';

class BackendServiceImpl implements BackendService{
  String MAIN_URI = 'http://10.129.148.41:8080/api';

  Future<dynamic> login(User user) async {
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

  Future<dynamic> register(User user) async {
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

  Future<dynamic> autoLogin(String username) async {
    var response;

    try{
      response = await http.get(
        Uri.parse('${MAIN_URI}/users/auto-login?username=$username'),
      ).timeout(const Duration(seconds: 1), onTimeout: (){
        throw Exception('Time out!'); 
      },);

      debugPrint('C-REAL: ${(jsonDecode(response.body as String) as Map).keys.first}');

      if (response.statusCode == 200) {
        return (true, (jsonDecode(response.body as String) as Map).keys.first);
      } else {
        return (false, (jsonDecode(response.body as String) as Map).keys.first);
      }


    } on Exception catch (e){
      debugPrint('TIME_OUT_EXCEPTION');


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







  Future<dynamic> updateUserInfo(String username, String newName, String newSurname) async {
    final response = await http.put(
      Uri.parse('${MAIN_URI}/users/update'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        User(
          username: username,
          name: newName,
          surname: newSurname,
          password: '---',
          group: '---',
        ).toJson(),
      ),
    );

    debugPrint('YYYYYYY: ${response.body}');

    if (response.statusCode == 200) {
      return (true, User.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      )!);
    } else {
      return (false, response.body);
    }

  }

  Future<dynamic> updatePassword(String username, String newPassword) async {
    final response = await http.put(
      Uri.parse('${MAIN_URI}/users/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        User(
          username: username,
          name: '---',
          surname: '---',
          password: newPassword,
          group: '---',
        ),
      ),
    );

    debugPrint('YYYYYYY: ${response.body}');

    if (response.statusCode == 200) {
      return (true, User.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      )!);
    } else {
      return (false, response.body);
    }

  }

  Future<dynamic> updateGroup(String username, String newGroup) async {
    final response = await http.put(
      Uri.parse('${MAIN_URI}/users/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        User(
          username: username,
          name: '---',
          surname: '---',
          password: '---',
          group: newGroup,
        ),
      ),
    );

    debugPrint('YYYYYYY: ${response.body}');

    if (response.statusCode == 200) {
      return (true, User.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      )!);
    } else {
      return (false, response.body);
    }

  }
}
