
class LoginPageState{
  String nameValidator = '';
  String surnameValidator = '';
  String passwordValidator = '';
  String usernameValidator = '';
  String groupValidator = '';

  String infoMessage = '';

  bool isRegistering = false;

  LoginPageState({
    required this.nameValidator,
    required this.surnameValidator,
    required this.passwordValidator,
    required this.usernameValidator,
    required this.groupValidator,
    required this.infoMessage,
  });
}