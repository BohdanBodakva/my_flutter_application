import 'package:my_flutter_application/instances/user.dart';

class Users{
  List<User> users = [];

  Users({required this.users});

  factory Users.fromJson(Map<String, List<User>> parsedJson) {
    return Users(
      users: parsedJson['users'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "users": this.users,
    };
  }
}
