import 'package:my_flutter_application/enums/user_status.dart';
import 'package:my_flutter_application/instances/user.dart';
import 'package:my_flutter_application/instances/user_course.dart';

class MyStorage{
  static bool darkMode = false;

  List<User> users = [
    User(
      username: 'admin',
      password: 'admin',
      name: 'Admin',
      schedule: Schedule(),
      status: UserStatus.admin
    ),
  ];

  List<String> getAllUsernames(){
    final List<String> usernames = [];
    for (var user in users){
      usernames.add(user.username);
    }
    return usernames;
  }

  

}