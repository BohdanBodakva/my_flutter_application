
import 'package:my_flutter_application/enums/user_status.dart';

class User{
  final String username;
  final UserStatus status = UserStatus.user;
  final String password;
  String group;
  String name;
  String surname;
  

  User({
    required this.username,
    required this.password,
    this.group = '',
    this.name = '',
    this.surname = '',
  });

  factory User.fromJson(Map<String, String> parsedJson) {
    return User(
      username: parsedJson['username'] ?? "",
      password: parsedJson['password'] ?? ""
    );
  }
        
  Map<String, dynamic> toJson() {
    return {
      "username": this.username,
      "password": this.password
    };
  }
  
}
