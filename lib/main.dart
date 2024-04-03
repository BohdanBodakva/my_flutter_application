import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_application/elements/my_calendar.dart';
import 'package:my_flutter_application/logic/dependency_injection.dart';
import 'package:my_flutter_application/pages/home.dart';
import 'package:my_flutter_application/pages/login.dart';
import 'package:my_flutter_application/pages/profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var initialRoute = '/login';
  
  // var date = (await MyController.getCurrentTimeLoggedIn()).toString();
  // if(date == false || date == 'false'){
  //   initialRoute = '/login';
  // } else {
  //   var date1 = DateTime.parse(date);
  //   final diff = DateTime.now().difference(date1).inSeconds;
  //   debugPrint('DIFFERENCE: $diff');

  //   if (diff < 30){
  //     initialRoute = '/';
  //   } else {
  //     initialRoute = '/login';
  //   }
  // }

  runApp(MyApp(initialRoute: initialRoute));
  DependencyInjection.init();
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
      home: MyApp2(initialRoute: initialRoute, key: rootKey),
    );
  }

  
}

class MyApp2 extends StatefulWidget {
  String initialRoute;
  static bool isConnected = false;

  MyApp2({required this.initialRoute, super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp2> {
  bool darkMode = false;
  String route = '/login';

  @override
  void initState() {
    super.initState();

    // route = a().toString();
  }

  
  
  @override
  Widget build(BuildContext context) {
      return GetMaterialApp (
        debugShowCheckedModeBanner: false,
        initialRoute: route,
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
