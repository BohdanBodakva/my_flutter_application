import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_application/api/implementaion/backend_service_impl.dart';
import 'package:my_flutter_application/bloc/user_info_bloc/user_info_state.dart';
import 'package:my_flutter_application/instances/user.dart';
import 'package:my_flutter_application/localstore/my_controller.dart';

class UserInfoCubit extends Cubit<UserInfoState>{
  UserInfoCubit() : super(UserInfoState(
    name: MyController.getActiveUser()['name'].toString(),
    surname: MyController.getActiveUser()['surname'].toString(),
    password: MyController.getActiveUser()['password'].toString(),
    group: MyController.getActiveUser()['group'].toString(),
  ),);

  void changeUserInfo(String username, String newName, String newSurname) async {
    final user = await BackendServiceImpl().updateUserInfo(username, newName, newSurname);
    await MyController.setUserAsActive(User.fromJson(user.$2)!);

    state.name = User.fromJson(user.$2)!.name;
    state.surname = User.fromJson(user.$2)!.surname;

    emit(state);
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
