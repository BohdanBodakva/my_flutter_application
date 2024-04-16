import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:my_flutter_application/api/implementaion/backend_service_impl.dart';
import 'package:my_flutter_application/bloc/login_page_bloc/login_page_cubit.dart';
import 'package:my_flutter_application/bloc/user_info_bloc/user_info_cubit.dart';
import 'package:my_flutter_application/bloc/user_info_bloc/user_info_state.dart';
import 'package:my_flutter_application/elements/my_calendar.dart';
import 'package:my_flutter_application/instances/user.dart';
import 'package:my_flutter_application/localstore/my_controller.dart';
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

  final currentUser = await MyController.getActiveUser();

  if(currentUser != null){
    User user = User.fromJson(currentUser)!;

    if(!['', 'null', null].contains(user.username)){

      if((await BackendServiceImpl().autoLogin(user.username)).$2.toString() == 'true'){
        initialRoute = '/';
      }
    }
  }

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<UserInfoCubit>(
        create: (BuildContext context) => UserInfoCubit(),
      ),
      BlocProvider<LoginPageCubit>(
        create: (BuildContext context) => LoginPageCubit(),
      ),
    ], 
    child: MyApp(initialRoute: initialRoute, currentUsername: 
      initialRoute == '/' ? 
      User.fromJson(currentUser)!.username :
      '',
    ),),
  );
  DependencyInjection.init();
}

class MyApp extends StatelessWidget {
  static final GlobalKey rootKey = GlobalKey();

  String initialRoute;
  String currentUsername;

  MyApp({required this.initialRoute, required this.currentUsername, super.key});

  dynamic getRootKey(){
    return rootKey;
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyAppWidget(initialRoute: initialRoute, currentUsername: currentUsername, key: rootKey),
    );
  }

  
}

class MyAppWidget extends StatelessWidget {
  String initialRoute;
  static bool isConnected = false;
  String currentUsername;

  MyAppWidget({required this.initialRoute, required this.currentUsername, required super.key});

  bool darkMode = false;
  String route = '/login';

  
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoCubit, UserInfoState>(
      builder: (context, state) {
         
      
      return GetMaterialApp (
        debugShowCheckedModeBanner: false,
        initialRoute: initialRoute == '/' ? 
          (){
            context.read<UserInfoCubit>().setActiveUserByUsername(currentUsername);
            return '/';
          }() : 
          '/login',
        routes: {
          '/': (context) => const HomePage(),
          '/login': (context) => LoginPage(),
          '/profile': (context) =>  ProfilePage(),
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
    },
    );

    
  }

  void rebuildApp() {
    darkMode = !darkMode;
    // setState(() {
    //   ProfilePage.usrname = ProfilePage.usrname;
    //   ProfilePage.fullName = ProfilePage.fullName;
    // });
  }
}
