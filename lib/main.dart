// import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:localstore/localstore.dart';
import 'package:my_flutter_application/elements/my_calendar.dart';
import 'package:my_flutter_application/localstore/MyController.dart';
// import 'package:my_flutter_application/logic/user_controller.dart';
import 'package:my_flutter_application/pages/home.dart';
import 'package:my_flutter_application/pages/login.dart';
import 'package:my_flutter_application/pages/profile.dart';
// import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var initialRoute = '';
  
  var date = (await MyController.getCurrentTimeLoggedIn()).toString();
  if(date == false || date == 'false'){
    initialRoute = '/login';
  } else {
    debugPrint('NOOOOOOOOOOOOOOOOOOOOOOO: $date');
  var date1 = DateTime.parse(date);
  final diff = DateTime.now().difference(date1).inSeconds;
  debugPrint('DIFFERENCE: $diff');

  

  if (diff < 30){
    initialRoute = '/';
  } else {
    initialRoute = '/login';
  }
  }
  

  debugPrint('INITIAL ROUTE: ${initialRoute}');


  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  static final GlobalKey<MyAppState> rootKey = GlobalKey<MyAppState>();

  String initialRoute;

  MyApp({required this.initialRoute, super.key});

  dynamic getRootKey(){
    return rootKey;
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _MyApp(initialRoute: initialRoute, key: rootKey),
    );
  }

  
}

class _MyApp extends StatefulWidget {
  String initialRoute;

  _MyApp({required this.initialRoute, super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<_MyApp> {
  bool darkMode = false;
  // String initialRoute = '/nnn';

  // Future<bool> a() async {
  //   String date = (await MyController.getCurrentTimeLoggedIn()).toString();
  //   debugPrint('NOOOOOOOOOOOOOOOOOOOOOOO: $date');
  //   var date1 = DateTime.parse(date);
  //   final diff = DateTime.now().difference(date1).inSeconds;
  //   debugPrint('DIFFERENCE: $diff');

  //   var initialRoute = true;

  //   if (diff < 30){
  //     initialRoute = true;
  //   } else {
  //     initialRoute = false;
  //   }

  //   return initialRoute;
  // }

  // b() {
  //   return a();
  // }

  // @override
  // void initState() {
  //   // a();
  //   // super.initState();
  // }

  
    
  
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: widget.initialRoute,
      routes: {
        '/': (context) => const HomePage(),
        '/login': (context) => LoginPage(),
        '/profile': (context) => ProfilePage(),
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
    setState(() {
      ProfilePage.usrname = ProfilePage.usrname;
      ProfilePage.fullName = ProfilePage.fullName;
    });
  }
}
