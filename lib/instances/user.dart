
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

  static User? fromJson(dynamic parsedJson) {
    if (parsedJson == null || parsedJson == ''){
      return null;
    }

    return User(
      username: parsedJson['username'] as String ?? '',
      password: parsedJson['password'] as String ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
  
}
