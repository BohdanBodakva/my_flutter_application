import 'package:flutter/material.dart';
// import 'package:my_flutter_application/logic/storage.dart';
import 'package:my_flutter_application/pages/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final GlobalKey<_MyAppState> rootKey = GlobalKey<_MyAppState>();

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
  _MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<_MyApp> {
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
      home: ProfilePage(),
    );
  }

  void rebuildApp() {
    darkMode = !darkMode;
    setState(() {});
  }
}
