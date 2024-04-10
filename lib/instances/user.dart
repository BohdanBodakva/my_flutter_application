
import 'package:my_flutter_application/bloc/user_info_bloc/user_info_state.dart';
import 'package:my_flutter_application/enums/user_status.dart';

class User{
  final String username;
  final UserStatus status = UserStatus.user;
  String password;
  String group;
  String name;
  String surname;

  User({
    required this.username,
    required this.password,
    required this.group,
    required this.name,
    required this.surname,
  });

  static UserInfoState toUserInfoState(User user){
    return UserInfoState(
      username: user.username,
      password: user.password,
      name: user.name,
      surname: user.surname,
      group: user.group,
    );
  }

  static User? fromJson(dynamic parsedJson) {
    if (parsedJson == null || parsedJson == ''){
      return null;
    }

    return User(
      username: parsedJson['username'] as String ?? '',
      password: parsedJson['password'] as String ?? '',
      name: parsedJson['name'] as String ?? '',
      surname: parsedJson['surname'] as String ?? '',
      group: parsedJson['group'] as String ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'name': name,
      'surname': surname,
      'group': group,
    };
  }
  
}
