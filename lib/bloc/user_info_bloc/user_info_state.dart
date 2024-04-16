class UserInfoState{
  String name = '';
  String surname = '';
  String username = '';
  String password = '';
  String group = '';

  DateTime timeLoggedIn = DateTime.now();

  UserInfoState({
    required this.name,
    required this.surname,
    required this.username,
    required this.password,
    required this.group,
  }); 
}
