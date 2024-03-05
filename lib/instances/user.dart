import 'package:my_flutter_application/enums/user_status.dart';
import 'package:my_flutter_application/instances/user_course.dart';

class User{
  final String username;
  final UserStatus status;
  String password;
  String name;
  String surname;
  Schedule schedule;
  

  User({
    required this.username,
    required this.schedule,
    this.status = UserStatus.user,
    this.password = '',
    this.name = '',
    this.surname = '',
  });
  
}





