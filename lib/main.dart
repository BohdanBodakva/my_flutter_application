import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_flutter_application/elements/my_calendar.dart';
import 'package:my_flutter_application/logic/user_controller.dart';
import 'package:my_flutter_application/pages/home.dart';
import 'package:my_flutter_application/pages/login.dart';
import 'package:my_flutter_application/pages/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final admin = UserController.getAdmin();
  prefs!.setString('admin', json.encode(admin.toJson()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final GlobalKey<MyAppState> rootKey = GlobalKey<MyAppState>();

  const MyApp({super.key});

  dynamic getRootKey(){
    return rootKey;
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _MyApp(key: rootKey),
    );
  }

  
}

class _MyApp extends StatefulWidget {
  const _MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<_MyApp> {
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/': (context) => const HomePage(),
        '/login': (context) => LoginPage(),
        '/profile': (context) => const ProfilePage(),
        '/calendar': (context) => const MyCalendar(),
      },
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
    );
  }

  void rebuildApp() {
    darkMode = !darkMode;
    setState(() {});
  }
}
