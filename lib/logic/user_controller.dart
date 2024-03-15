import 'package:my_flutter_application/instances/user.dart';

class UserController{

  static List<User> __users = [
    User(
      username: 'admin',
      password: 'admin',
      name: 'Admin'
    )
  ];

  static String? __currentUsername;

  static String? getCurrentUsername(){
    return __currentUsername;
  }

  static List<User> getAllUsers(){
    return __users;
  }

  static void setUsernameAsActive(String username){
    __currentUsername = username;
  }

  static void unsetUser(){
    __currentUsername = null;
  }

  static User? getUserByUsername(String username){
    for (var user in __users){
      if(user.username == username){
        return user;
      }
    }
    return null;
  }

  static bool __checkIfUsernameIsUnique(String username){
    for (var user in __users){
      if(user.username == username){
        return false;
      }
    }
    return true;
  }

  static String addNewUser(User user){
    if (!__checkIfUsernameIsUnique(user.username)){
      return 'User with username "${user.username}" already exists';
    }
    __currentUsername = user.username;
    __users.add(user);
    return 'User was successfully added';
  }

  static (bool, String) checkLogin(String username, String password){
    var user = getUserByUsername(username);
    if (user == null){
      return (false, 'User with username "${username}" does not exist');
    }
    if (user.password == password){
      __currentUsername = user.username;
      return (true, '');
    }
    return (false, 'Password is wrong');
  }

}
