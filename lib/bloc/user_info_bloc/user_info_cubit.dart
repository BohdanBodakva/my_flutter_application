import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_application/api/implementaion/backend_service_impl.dart';
import 'package:my_flutter_application/bloc/user_info_bloc/user_info_state.dart';
import 'package:my_flutter_application/instances/user.dart';
import 'package:my_flutter_application/localstore/my_controller.dart';

class UserInfoCubit extends Cubit<UserInfoState>{
  UserInfoCubit() : super(UserInfoState(
    username: '',
    name: '',
    surname: '',
    password: '',
    group: '',
  ),);

  void setActiveUser(User user){
    emit(User.toUserInfoState(user));
  }

  void setActiveUserByUsername(String username) async {
    final response = (await BackendServiceImpl().getUserByUsername(username)).$2;

    if (response is String){
      debugPrint('USER IS STRING: $response');
    } else {
      emit(User.toUserInfoState(response as User));
    }

    
  }

  void logOut(BuildContext context){
    emit(UserInfoState(
      username: '',
      password: '',
      name: '',
      surname: '',
      group: '',
    ),);

    Navigator.pushNamed(context, '/login');
  }

  dynamic changeUserInfo(String username, String newName, String newSurname) async {
    final user = await BackendServiceImpl().updateUserInfo(username, newName, newSurname);
    await MyController.setUserAsActive(User.fromJson(user.$2)!);

    debugPrint('XXXXXXXXXXXXX: ${state.name = User.fromJson(user.$2)!.name}');

    emit(UserInfoState(
      username: state.username,
      password: state.password,
      name: User.fromJson(user.$2)!.name,
      surname: User.fromJson(user.$2)!.surname,
      group: state.group,
    ),);
  }

  void changePassword(String username, String newPassword) async {
    final user = await BackendServiceImpl().updatePassword(username, newPassword);
    await MyController.setUserAsActive(User.fromJson(user.$2)!);

    state.password = User.fromJson(user.$2)!.password;
    
    emit(state);
  }

  void changeGroup(String username, String newGroup) async {
    final user = await BackendServiceImpl().updateGroup(username, newGroup);
    await MyController.setUserAsActive(User.fromJson(user.$2)!);

    state.group = User.fromJson(user.$2)!.group;
    
    emit(state);
  }
  
}
