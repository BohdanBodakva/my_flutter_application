import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_application/enums/font_size.dart';
import 'package:my_flutter_application/localstore/MyController.dart';

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
  final regExp = RegExp(r'[a-zA-Z0-9_-]');

  @override
  void initState(){
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {

    // @override
    // void initState() async {
      
    // }
    

    final mediaQuery = MediaQuery.sizeOf(context);

    final textFieldRegex = RegExp(r'^[a-zA-Z0-9_]+$');

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
      var validated = true;

      if (!textFieldRegex.hasMatch(enteredUsername)){
        setState(() {
          widget.usernameValidatorMessage = 
            'use only letters, digits or underscores';
        });
        validated = false;
      }

      if (widget.isRegistering){
        if (!textFieldRegex.hasMatch(enteredName)){
          setState(() {
            widget.nameValidatorMessage = 
              'NAME: use only letters, digits or underscores';
          });
          validated = false;
        }
        if (!textFieldRegex.hasMatch(enteredSurname)){
          setState(() {
            widget.surnameValidatorMessage = 
              'use only letters, digits or underscores';
          });
          validated = false;
        }
        if (!textFieldRegex.hasMatch(enteredGroup)){
          setState(() {
            widget.groupValidatorMessage = 
              'use only letters, digits or underscores';
          });
          validated = false;
        }
      }

      return validated;
    }

    void login()async {
        enteredUsername = usernameController.text as String;
        enteredPassword = passwordController.text as String;
        widget.infoMessage = '';
        widget.clearAllValidationMessages();

      if (validateInputFields()){
        var login = await MyController.checkLogin(enteredUsername, enteredPassword);
        final loginStatus = login.$1;
        final info = login.$2;   
        debugPrint('login status: $loginStatus');  

        if(loginStatus.toString() == 'true'){
          MyController.setUserAsActive(enteredUsername);
          MyController.getCurrentTimeLoggedIn();
          Navigator.pushNamed(context, '/');
        } else {
          setState(() {
            widget.infoMessage = info.toString();
          });
        }
      }
    }

    void register() async{
        enteredUsername = usernameController.text as String;
        enteredPassword = passwordController.text as String;
        enteredName = nameController.text as String;
        enteredSurname = surnameController.text as String;
        enteredGroup = groupController.text as String;
        widget.infoMessage = '';
        widget.clearAllValidationMessages();
      if(validateInputFields()){
        var register = await MyController.register(
          enteredUsername, 
          enteredPassword,
          enteredName,
          enteredSurname,
          enteredGroup,
        );
        final registerStatus = register.$1;
        final info = register.$2;   
        debugPrint('register status: $registerStatus');  

        if(registerStatus.toString() == 'true'){
          MyController.setUserAsActive(enteredUsername);
          Navigator.pushNamed(context, '/');
        } else {
          setState(() {
            widget.infoMessage = info.toString();
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
                Column(
                  children: [
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
                    Text(
                      widget.nameValidatorMessage,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                
              if (widget.isRegistering)
                Column(
                  children: [
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
                    Text(
                      widget.surnameValidatorMessage,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                
              if (widget.isRegistering)
                Column(
                  children: [
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
                    Text(
                      widget.groupValidatorMessage,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                
              Column(
                children: [
                  TextFormField(
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      labelText: 'password',
                    ),
                    validator: (value) {
                      enteredPassword = value??'';
                    },
                    controller: passwordController,
                  ),
                ],
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
