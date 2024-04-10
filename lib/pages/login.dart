import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_application/api/implementaion/backend_service_impl.dart';
import 'package:my_flutter_application/bloc/login_page_bloc/login_page_cubit.dart';
import 'package:my_flutter_application/bloc/login_page_bloc/login_page_state.dart';
import 'package:my_flutter_application/enums/font_size.dart';
import 'package:my_flutter_application/localstore/my_controller.dart';

class LoginPage extends StatelessWidget {
  final dynamic user;
  var infoMessage = '';

  static bool isConnectedToInternet = true;

  LoginPage({this.user, super.key});

  final regExp = RegExp(r'[a-zA-Z0-9_-]');

  String autoLoginStatus = 'false';

  void checkAutoLogin(BuildContext context){
    ()async{
      final currentUsername = (await MyController.getCurrentUsername()).toString();

      debugPrint('C-USRNAME: $currentUsername');

      if (currentUsername != 'null'){
      

        autoLoginStatus = (await BackendServiceImpl().autoLogin(
          currentUsername,
        )).$2.toString();

        debugPrint('C-LOGIN: $autoLoginStatus');

        if(autoLoginStatus == 'true'){
          debugPrint('C-STATUS: true');
          Navigator.pushNamed(context, '/');
        }
      }
    }();
  }


  @override
  Widget build(BuildContext context) {    

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

    return PopScope(
      canPop: false,
      child: BlocBuilder<LoginPageCubit, LoginPageState>(
        builder: (context, state){
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
                      state.infoMessage,
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
                        state.usernameValidator,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                    ),
                    
                  ],
                ),
                Column(
                      children: [
                        if (state.isRegistering)
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
                        state.nameValidator,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    
                  ],
                ),
                
              if (state.isRegistering)
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
                        state.surnameValidator,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                  
                  ],
                ),
                
              if (state.isRegistering)
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
                        state.groupValidator,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    
                  ],
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
                  Text(
                        state.passwordValidator,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                ],
              ),
              
              ElevatedButton(
                    onPressed: 
                      state.isRegistering ? (){
                        context.read<LoginPageCubit>().registerUser(
                          usernameController.text, 
                          passwordController.text,
                          nameController.text,
                          surnameController.text,
                          groupController.text, 
                          context,
                        );
                      }  : (){
                        context.read<LoginPageCubit>().loginUser(
                          usernameController.text, 
                          passwordController.text, 
                          context,
                        );
                      },
                    child: Text(
                      state.isRegistering ? 'Register' : 'Log In',
                    ),
                  ),
              

              RichText(
                    text: TextSpan(
                      text: !state.isRegistering ? 
                      'Do not have an account? Register' :
                      'Already have an account? Log In',
                      style: TextStyle(
                        fontSize: MyFontSize.getFontSize(context, 1),
                        color: Colors.black
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                            context.read<LoginPageCubit>().changeRegisterStatus();
                        },
                        
              ),
                
              ),
                
              
              
              



                    ],
                  ),
                ),
        ),
          
        
      
      
    );
        },
      ),
      
    );
    
    
  }
}
