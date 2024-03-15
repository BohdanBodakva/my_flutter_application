import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_application/enums/font_size.dart';
import 'package:my_flutter_application/instances/user.dart';
import 'package:my_flutter_application/logic/user_controller.dart';

class LoginPage extends StatefulWidget {
  final dynamic user;
  var infoMessage = '';
  var isRegistering = false;

  var usernameValidatorMessage = '';
  var nameValidatorMessage = '';
  var surnameValidatorMessage = '';
  var groupValidatorMessage = '';

  void clearAllValidationMessages(){
    usernameValidatorMessage = '';
    nameValidatorMessage = '';
    surnameValidatorMessage = '';
    groupValidatorMessage = '';
  }

  LoginPage({this.user, super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final regExp = RegExp(r'[a-zA-Z]');

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);

    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    final nameController = TextEditingController();
    final surnameController = TextEditingController();
    final groupController = TextEditingController();

    var enteredUsername = '';
    var enteredPassword = '';
    var enteredName = '';
    var enteredSurname = '';
    var enteredGroup = '';

    bool validateInputFields(){
      if (RegExp(r'[a-zA-Z]').hasMatch(enteredUsername) ){
        debugPrint('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk');
        setState(() {
          widget.usernameValidatorMessage = 'enter valid value';
        });
        return false;
      }
      debugPrint('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');

      // if (widget.isRegistering){
      //   if (enteredName == '' || !enteredName.contains(regExp)){
      //     setState(() {
      //       widget.nameValidatorMessage = 'enter valid value';
      //     });
      //     return false;
      //   }
      //   if (enteredSurname == '' || !enteredSurname.contains(regExp)){
      //     setState(() {
      //       widget.surnameValidatorMessage = 'enter valid value';
      //     });
      //     return false;
      //   }
      //   if (enteredGroup == '' || !enteredGroup.contains(regExp)){
      //     setState(() {
      //       widget.groupValidatorMessage = 'enter valid value';
      //     });
      //     return false;
      //   }
      // }

      return true;
    }

    void login(){
        enteredUsername = usernameController.text as String;
        enteredPassword = passwordController.text as String;
      if (validateInputFields()){
        var login = UserController.checkLogin(enteredUsername, enteredPassword);
        final loginStatus = login.$1;
        final info = login.$2;        
        if(loginStatus){
          widget.infoMessage = '';
          widget.clearAllValidationMessages();
          Navigator.pushNamed(context, '/');
        } else {
          setState(() {
            widget.infoMessage = info;
          });
        }
      }
    }

    void register(){
        enteredUsername = usernameController.text as String;
        enteredPassword = passwordController.text as String;
        enteredName = nameController.text as String;
        enteredSurname = surnameController.text as String;
        enteredGroup = groupController.text as String;
      if(validateInputFields()){
        var registerStatus = UserController.addNewUser(
          User(
            username: enteredUsername,
            password: enteredPassword,
            name: enteredName,
            surname: enteredSurname,
            group: enteredGroup,
          ),
        );
        if(registerStatus == 'User was successfully added'){
          widget.infoMessage = '';
          widget.clearAllValidationMessages();
          Navigator.pushNamed(context, '/');
        } else {
          setState(() {
            widget.infoMessage = registerStatus;
          });
        }
      }
    }



    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        padding: EdgeInsets.only(
          left: mediaQuery.width * 0.2,
          right: mediaQuery.width * 0.2,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.infoMessage,
                style: const TextStyle(
                    color: Colors.black,
                ),
              ),
              Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'username',
                    ),
                    
                    controller: usernameController,
                  ),
                  Text(
                    widget.usernameValidatorMessage,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              

              if (widget.isRegistering)
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'name',
                  ),
                  validator: (value) {
                    enteredName= value??'';
                  },
                  controller: nameController,
                ),
              if (widget.isRegistering)  
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'surname',
                  ),
                  validator: (value) {
                    enteredSurname= value??'';
                  },
                  controller: surnameController,
                ),
              if (widget.isRegistering)  
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'group',
                  ),
                  validator: (value) {
                    enteredGroup = value??'';
                  },
                  controller: groupController,
                ),
              
              TextFormField(
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  labelText: 'password',
                ),
                validator: (value) {
                  enteredPassword = value??'';
                },
                controller: passwordController,
              ),
              ElevatedButton(
                onPressed: widget.isRegistering ? register : login,
                child: Text(
                  widget.isRegistering ? 'Register' : 'Log In',
                ),
              ),


              RichText(
                text: TextSpan(
                  text: !widget.isRegistering ? 
                  'Do not have an account? Register' :
                  'Already have an account? Log In',
                  style: TextStyle(
                    fontSize: MyFontSize.getFontSize(context, 1),
                    color: Colors.black
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      setState(() {
                        widget.infoMessage = '';
                        widget.clearAllValidationMessages();
                        widget.isRegistering = !widget.isRegistering;
                      });
                    },
                ),
                
              )
              



                    ],
                  ),
                ),
        ),
          
        
      
      
    );
  }
}
