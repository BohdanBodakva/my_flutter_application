import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_application/api/implementaion/backend_service_impl.dart';
import 'package:my_flutter_application/bloc/login_page_bloc/login_page_state.dart';
import 'package:my_flutter_application/instances/input_fields.dart';
import 'package:my_flutter_application/instances/user.dart';
import 'package:my_flutter_application/localstore/my_controller.dart';

class LoginPageCubit extends Cubit<LoginPageState>{
  LoginPageCubit() : super(LoginPageState(
    usernameValidator: '',
    nameValidator: '',
    surnameValidator: '',
    groupValidator: '',
    passwordValidator: '',
    infoMessage: '',
  ),);

  final regExp = RegExp(r'[a-zA-Z0-9_-]');

  void changeRegisterStatus(){
    final loginPageState = LoginPageState(
      nameValidator: '', 
      surnameValidator: '', 
      passwordValidator: '', 
      usernameValidator: '', 
      groupValidator: '', 
      infoMessage: '',
    );
    loginPageState.isRegistering = !state.isRegistering;

    emit(loginPageState);
  }

  void clearAllMessages(){
    emit(
      LoginPageState(
        nameValidator: '', 
        surnameValidator: '', 
        passwordValidator: '', 
        usernameValidator: '', 
        groupValidator: '', 
        infoMessage: '',
      ),
    );
  }

  List<dynamic> validateInputFields(InputFields inputFields, bool isRegistering){
    var validated = true;
    final returnedMessages = InputFields();

    if (!regExp.hasMatch(inputFields.enteredUsername)){
      returnedMessages.usernameMessage = 'use only letters, digits or underscores';
      validated = false;
    }

    if (!regExp.hasMatch(inputFields.enteredPassword)){
      returnedMessages.passwordMessage = 'use only letters, digits or underscores';
      validated = false;
    }

    if (isRegistering){
      if (!regExp.hasMatch(inputFields.enteredName)){
        returnedMessages.nameMessage = 'use only letters, digits or underscores';
        validated = false;
      }
      if (!regExp.hasMatch(inputFields.enteredSurname)){
        returnedMessages.surnameMessage = 'use only letters, digits or underscores';
        validated = false;
      }
      if (!regExp.hasMatch(inputFields.enteredGroup)){
        returnedMessages.groupMessage = 'use only letters, digits or underscores';
        validated = false;
      }
    }

      return [
        validated, returnedMessages,
      ];
    }

  dynamic loginUser(String username, String password, BuildContext context) async {
    debugPrint('NNNNNNNNNNNNNNNNNNN: $username + $password');

    final input = InputFields();
    input.enteredUsername = username;
    input.enteredPassword = password;

    final validation = validateInputFields(input, false);
    final validationStatus = validation[0] as bool;
    final returnedInputs = validation[1] as InputFields;

    

    if(validationStatus){
      final login = await BackendServiceImpl().login(
        User(
          username: username,
          password: password,
          name: '',
          surname: '',
          group: '',
        ),
      );

      final status = login.$1 as bool;
      final user = login.$2 as User;

      debugPrint('NNNNNNNNNNNNNNNNNNN: ${status}');

      if(status){
        MyController.setUserAsActive(user);

        emit(input.toLoginPageState(''));

        Navigator.pushNamed(context, '/');

        return user;
      } else {
        debugPrint(returnedInputs.toLoginPageState(user.toString()).toString());
        emit(returnedInputs.toLoginPageState(user.toString()));

        return 'User was not logged in';
      }

      

    } else {
      debugPrint('NNNNNNNNNNNNNNNNNNN: ${returnedInputs.toLoginPageState('').usernameValidator}');
      final finalLoginPageState = returnedInputs.toLoginPageState('');
      finalLoginPageState.isRegistering = false;
      emit(finalLoginPageState);

      return 'Validation was failed';
    }
    
    

  }


  dynamic registerUser(String username, String password, String name, String surname, String group, BuildContext context) async {
    final input = InputFields();
    input.enteredUsername = username;
    input.enteredPassword = password;
    input.enteredName = name;
    input.enteredSurname = surname;
    input.enteredGroup = group;

    final validation = validateInputFields(input, true);
    final validationStatus = validation[0] as bool;
    final returnedInputs = validation[1] as InputFields;

    debugPrint('eeeeeeeeeeeeeeeeeeeeeee: ${returnedInputs.groupMessage}');

    if(validationStatus){
      final register = await BackendServiceImpl().register(
        User(
          username: username,
          password: password,
          name: name,
          surname: surname,
          group: group,
        ),
      );

      final status = register.$1 as bool;
      final user = register.$2;

      debugPrint('NNNNNNNNNNNNNNNNNNN: ${status}');

      if(status){
        MyController.setUserAsActive(user as User);

        emit(returnedInputs.toLoginPageState(''));

        Navigator.pushNamed(context, '/');

        return user;
      } else {
        emit(returnedInputs.toLoginPageState(user.toString()));

        return 'User was not logged in';
      }

      

    } else {
      debugPrint('NNNNNNNNNNNNNNNNNNN: ${returnedInputs.toLoginPageState('').usernameValidator}');
      final finalLoginPageState = returnedInputs.toLoginPageState('');
      finalLoginPageState.isRegistering = true;
      emit(finalLoginPageState);

      return 'Validation was failed';
    }
    
    

  }




  void autoLoginUser(String username, String password, String name, String surname, String group, BuildContext context) async {
    final currentUsername = (await MyController.getCurrentUsername()).toString();

    String autoLoginStatus = 'false';

      if (currentUsername != 'null'){
        autoLoginStatus = (await BackendServiceImpl().autoLogin(
          currentUsername,
        )).$2.toString();

        if(autoLoginStatus == 'true'){
          Navigator.pushNamed(context, '/');
        }
      }
    
    

  }



  
}
