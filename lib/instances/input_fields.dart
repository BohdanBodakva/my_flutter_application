import 'package:my_flutter_application/bloc/login_page_bloc/login_page_state.dart';

class InputFields{
  String enteredUsername = '';
  String enteredPassword = '';
  String enteredName = '';
  String enteredSurname = '';
  String enteredGroup = '';

  String usernameMessage = '';
  String passwordMessage = '';
  String nameMessage = '';
  String surnameMessage = '';
  String groupMessage = '';

  InputFields();

  LoginPageState toLoginPageState(String infoMessage){
    return LoginPageState(
      nameValidator: nameMessage,
      surnameValidator: surnameMessage,
      usernameValidator: usernameMessage,
      passwordValidator: passwordMessage,
      groupValidator: groupMessage,
      infoMessage: infoMessage,
    );
  }
}
