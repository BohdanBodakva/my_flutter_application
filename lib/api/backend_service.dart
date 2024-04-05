import 'dart:async';
import 'package:my_flutter_application/instances/user.dart';

abstract class BackendService{
  

  Future<dynamic> login(User user);
  Future<dynamic> register(User user);
  Future<dynamic> autoLogin(String username);
}
