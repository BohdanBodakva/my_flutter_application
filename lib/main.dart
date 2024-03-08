import 'package:flutter/material.dart';
import 'package:my_flutter_application/elements/my_calendar.dart';
import 'package:my_flutter_application/pages/home.dart';
import 'package:my_flutter_application/pages/profile.dart';

void main() {
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
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
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
