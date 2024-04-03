import 'dart:convert';
import 'package:my_flutter_application/instances/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserController{
  static final __admin = 
    User(
      username: 'admin',
      password: 'admin',
      name: 'Admin',
    );

  static final __users = [
    __admin,
  ];

  static Map<String, dynamic> allUsersToJson() {
    return {
      'users': __users,
    };
  }

  static getAllUsers(dynamic parsedJson) {
    if (parsedJson == null || parsedJson == ''){
      return null;
    }

    return parsedJson['users'];
  }





  static usersFromJson() async {

    for (var usr in __users){

    }

    // if (user == null || user.username == ''){
    //   return (false, 'User with username "${username}" does not exist');
    // }
    // if (user.password == password){
    //   __currentUsername = user.username;
    //   return (true, '');
    // }
    // return (false, 'Password is wrong');
  }

  static User getAdmin(){
    return __admin;
  }
  

  static String? __currentUsername;

  static String? getCurrentUsername(){
    return __currentUsername;
  }

  // static List<User> getAllUsers(){
  //   return __users;
  // }

  static void setUsernameAsActive(String username){
    __currentUsername = username;
  }

  static void unsetUser(){
    __currentUsername = null;
  }

  static Future<User?> getUserByUsername(String username) async{
    var prefs = await SharedPreferences.getInstance();
    var user = User.fromJson(jsonDecode((prefs.getString(username))!));

    if (user == null){
      return null;
    }

    return user;
  }

  // static bool __checkIfUsernameIsUnique(String username) async{
  //   var prefs = await SharedPreferences.getInstance();
  //   User user = User.fromJson(jsonDecode((prefs.getString(username))!));

  //   for (var user in __users){
  //     if(user.username == username){
  //       return false;
  //     }
  //   }
  //   return true;
  // }

  static Future<String> addNewUser(User user) async{
    var prefs = await SharedPreferences.getInstance();

    prefs.setString(user.username, json.encode(user.toJson()));

    // if (!__checkIfUsernameIsUnique(user.username)){
    //   return 'User with username "${user.username}" already exists';
    // }
    // __currentUsername = user.username;
    // // __users.add(user);
    return 'User was successfully added';
  }

  static Future<(bool, String)> checkLogin(String username, String password) async{
    var prefs = await SharedPreferences.getInstance();

    var data = prefs.getString('users');

    if (data == null){
      return (false, 'User with username "${username}" does not exist');
    }

    var user = User.fromJson(jsonDecode(data!));

    if (user == null || user.username == ''){
      return (false, 'User with username "${username}" does not exist');
    }
    if (user.password == password){
      __currentUsername = user.username;
      return (true, '');
    }
    return (false, 'Password is wrong');
  }
}
