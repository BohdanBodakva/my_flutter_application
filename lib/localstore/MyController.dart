import 'package:flutter/foundation.dart';
import 'package:localstore/localstore.dart';
import 'package:my_flutter_application/instances/user.dart';

class MyController{
  static final db = Localstore.instance;

  // static Future<dynamic> getUserByUsername(String username) async {
  //   Map? users = await db.collection('users').get();

    

  //   dynamic user = users!.values.toList().first;
  //     if(user['username'] == username){
  //       return user;
  //     }
  //     debugPrint('ALL USERS: $user');
    

  //   return false;
  // }

  static Future<bool> __checkIfUserAlreadyExists(String username) async {
    Map? users = await db.collection('users').get();

    debugPrint('logged: $users');

    for (var user in users!.values){
      if(user['username'] == username){
        return true;
      }
    }

    return false;
  }

  static addUser(User user) async {
    // if(! await __checkIfUserAlreadyExists(user.username)){
      db.collection('users').doc().set({
        'username': user.username,
        'password': user.password,
        'name': user.name,
        'surname': user.surname,
        'group': user.group,
      });
    // }


    Map? users = await db.collection('users').get();

    

    



    return 'username ${user.username} already exist';
  }

  static setUserAsActive(User user) async {
    await db.collection('timeLoggedIn').delete();
    await db.collection('activeUser').delete();

    await db.collection('timeLoggedIn').doc().set({
        'time': DateTime.now().toString(),
      });

    await db.collection('activeUser').doc().set({
        'username': user.username,
        'password': user.password,
        'name': user.name,
        'surname': user.surname,
        'group': user.group,
      });
    
    // debugPrint("a_c_t_i_v_e: ${db.collection('activeUser').get()}");
  }

  static getActiveUser() async {

    Map<String, dynamic> activeUsers = (await db.collection('activeUser').get())!;

    var activeUser = activeUsers.values.first;

    return activeUser;
    
    // debugPrint("a_c_t_i_v_e: ${db.collection('activeUser').get()}");
  }

  static deleteActiveUser()async{
    await db.collection('activeUser').delete();
    await db.collection('timeLoggedIn').delete();
  }

  static getCurrentUsername()async{
    Map? activeUser = await db.collection('activeUser').get();

    debugPrint('AAAAAAAAAAAAANNNNNNNNNNNNNNNNN: $activeUser');

    for (var user in activeUser!.values){
      return user['username'];
    }
    
  }

  static getCurrentTimeLoggedIn()async{
    Map? time = await db.collection('timeLoggedIn').get();

    debugPrint('RRRRRRRRRRRRRRRRRRRRRRRRRRRR: $time');

    dynamic t = '';

    if(time == null){
      return false;
    }

    for (var tm in time.values){
      t = tm['time'];
    }

    debugPrint('time $t');

    return t;
    
  }

  // static checkLogin(String username, String password) async {
  //   var isUserExist = await __checkIfUserAlreadyExists(username);

  //   if (isUserExist == false){
  //     return (false, 'User $username does not exist');
  //   }

  //   debugPrint('logged: $isUserExist');

  //   var user = await getUserByUsername(username);

  //   if(user['password'] == password){
  //     return (true, '');
  //   }

  //   return (false, 'Wrong password');
  // }

  static register(String username, String password, String name, String surname, String group) async {
    var isUserExist = await __checkIfUserAlreadyExists(username);

    if (isUserExist == true){
      return (false, 'User $username already exists');
    }

    group = group == null ? '' : group;

    db.collection('users').doc().set({
    'username': username,
    'password': password,
    'name': name,
    'surname': surname,
    'group': group,
    });

    return (true, 'User was registered successfully');


  }
}
