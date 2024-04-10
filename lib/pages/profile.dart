import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_application/bloc/user_info_bloc/user_info_cubit.dart';
import 'package:my_flutter_application/bloc/user_info_bloc/user_info_state.dart';
import 'package:my_flutter_application/elements/footer.dart';
import 'package:my_flutter_application/elements/info_dialog.dart';
import 'package:my_flutter_application/elements/my_add_button.dart';
import 'package:my_flutter_application/elements/my_app_bar.dart';
import 'package:my_flutter_application/elements/my_input_form.dart';
import 'package:my_flutter_application/elements/settings_item.dart';
import 'package:my_flutter_application/enums/font_size.dart';
import 'package:my_flutter_application/logic/user_controller.dart';
import 'package:my_flutter_application/main.dart';


class ProfilePage extends StatelessWidget {
  final dynamic user;
  String usrname = '';
  String fullName = '';

  Future<(String, String)> getUserNameAndSurname() async {
    
    var user = await UserController
              .getUserByUsername(UserController.getCurrentUsername()!);

    print('uuuuuuuuuuuuuuuuuuuuser: $user');

    if (user == null){
      return ('', '');
    }

    return (user.name, user.surname);
  }

  ProfilePage({this.user, super.key});

  String dropdownvalue = 'Apple';
  var items = [
    'Apple',
    'Banana',
    'Grapes',
    'Orange',
    'watermelon',
    'Pineapple',
  ];

  var userName = '';
  var userSurname = '';
  var userPassword = '';
  var userGroup = '';

  void changeAppMode(){
    MyApp.rootKey.currentState?.rebuildApp();
  }

  // void logOut(BuildContext context)async{
  //   await MyController.deleteActiveUser();
  //   Navigator.pushNamed(context, '/login');
  // }

  // Future<void> getCurrentUsername() async {
  //   String r = (await MyController.getCurrentUsername()) as String;
  //   debugPrint("CURRENT USERNAME 2: $r");

  //   dynamic user = await MyController.getActiveUser(); 

  //   // debugPrint("USEEEEEEr: ${user}");
  //   // debugPrint("USEEEEEEr222: ${user['name']}");

  //   userName = "user['name'] as String";
  //   userSurname = "user['surname'] as String";
  // }

  final nameController = TextEditingController();
  final surnameController = TextEditingController();

  // saveUserInfo(BuildContext context)async{
  //   var enteredName = nameController.text as String;
  //   var enteredSurname = surnameController.text as String;

  //   var currUsername = (await MyController.getCurrentUsername()).toString();

  //   Navigator.of(context).pop();
  // }

  

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);

    final formHeight = mediaQuery.height * 0.15;
    final formWidth = mediaQuery.width * 0.6;

    

    return BlocBuilder<UserInfoCubit, UserInfoState>(
          builder: (context, state){
            return Scaffold(
      appBar: MyAppBar(
        title: state.username, 
        preferredHeight: mediaQuery.height * 0.07,
      ),
      
      body: Container(
              padding: EdgeInsets.symmetric(
              vertical: mediaQuery.height * 0.02,
              horizontal: mediaQuery.height * 0.05,
              ),
            child: Center(
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: mediaQuery.width * 0.29,
                      child: Image.asset('assets/user.png'),
                    ),
                    Container(
                      height: mediaQuery.width * 0.08,
                    ),
                    Text(
                      '${state.name} ${state.surname}',
                      style: TextStyle(
                        fontSize: MyFontSize.getFontSize(context, 4),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: mediaQuery.height * 0.03,
                ),
                SizedBox(
                  height: mediaQuery.height * 0.47,
                  child: Column(
                    children: [
                      SettingsItem(
                        onPressed: () {
                          showDialog<void>(
                            context: context,
                            builder: (context) => InfoDialog(
                              title: 'Edit Profile',
                              titleWidgets:[
                                Column(
                                  mainAxisAlignment: 
                                    MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      height: formHeight, 
                                      width: formWidth,
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          border: UnderlineInputBorder(),
                                            labelText: 'name',
                                            hintText: '',
                                          ),
                                      controller: nameController,
                                      ),
                                    ),
                                  
                                    SizedBox(
                                      height: formHeight, 
                                      width: formWidth,
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          border: UnderlineInputBorder(),
                                          labelText: 'surname',
                                        ),
                                        controller: surnameController,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                              bottomWidgets: [
                                Container(
                                  height: 35,
                                ),
                                Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      showDialog<void>(
                                        context: context,
                                        builder: (_) => InfoDialog(
                                          title: 'Change password',
                                          titleWidgets: [
                                            MyInputForm(
                                              height: formHeight, 
                                              width: formWidth,
                                              labelText: 
                                                'enter current password',
                                            ),
                                            MyInputForm(
                                              height: formHeight, 
                                              width: formWidth,
                                              labelText: 'enter new password',
                                            ),
                                            MyInputForm(
                                              height: formHeight, 
                                              width: formWidth,
                                              labelText: 
                                                'enter new password again',
                                            ),
                                          ],
                                          saveButton: MyAddButton(
                                            onPressed: () => {
                                              // save password
                                            },
                                            buttonText: 'Save',
                                          ),
                                          closeButtonText: 'Close',
                                          type: 1,
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Change password',
                                      style: TextStyle(
                                        fontSize: 
                                          MyFontSize.getFontSize(context, 1),
                                        decoration: TextDecoration. underline,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                              saveButton: MyAddButton(
                                onPressed: (){
                                  context.read<UserInfoCubit>().changeUserInfo(
                                    state.username,
                                    nameController.text,
                                    surnameController.text,
                                  );
                                  
                                  Navigator.of(context).pop();
                                },
                                buttonText: 'Save',
                              ),
                              closeButtonText: 'Close',
                              type: 1,
                            ),
                          );
                        },
                        icon: const Icon(Icons.person),
                        text: 'Edit profile info',
                      ),
                      SettingsItem(
                        onPressed: () {
                          showDialog<void>(
                            context: context,
                            builder: (_) => InfoDialog(
                              title: 'Change group',
                            titleWidgets:[
                              Column(
                                mainAxisAlignment: 
                                  MainAxisAlignment.spaceAround,
                                children: [
                                  DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: Text(
                          'Select Item',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        items: items
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),)
                            .toList(),
                        value: dropdownvalue,
                        onChanged: (String? newValue) {
                          // setState(() {
                          //   dropdownvalue = newValue!;
                          // });
                        },
                      ),
                    ),
                                  MyInputForm(
                                    height: formHeight, 
                                    width: formWidth,
                                    labelText: 'select group',
                                  ),  
                                ],
                              ),
                            ],
                            saveButton: MyAddButton(
                                    onPressed: () => {
                                      // save user info
                                    },
                                    buttonText: 'Save',
                                  ),
                            closeButtonText: 'Close',
                            type: 1,
                          ),
                        );
                      },
                      icon: const Icon(Icons.group),
                      text: 'Group settings',
                    ),
                    SettingsItem(
                      onPressed: () => {},
                      icon: const Icon(Icons.refresh),
                      text: 'Refresh schedule',
                    ),
                    SettingsItem(
                      onPressed: changeAppMode,
                      icon: MyApp.rootKey.currentState!.darkMode ? 
                        const Icon(Icons.dark_mode) : 
                        const Icon(Icons.light_mode),
                      text: 'Change app mode',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SettingsItem(
                          itemWidthSubtraction: 0.46,
                      onPressed: () => {
                        showDialog<void>(
                          context: context,
                          builder: (context) => InfoDialog(
                            title: 'About this app',
                            titleWidgets: const [Text('sdgdflkgjdfkg')],
                            saveButton: Container(),
                            closeButtonText: 'Close',
                          ),
                        ),
                      },
                      icon: const Icon(Icons.info),
                      text: 'About',
                    ),
                    SettingsItem(
                      itemWidthSubtraction: 0.46,
                      onPressed: (){
                        context.read<UserInfoCubit>().logOut(context);
                      },
                      icon: const Icon(Icons.settings),
                      text: 'Log Out',
                    ),
                      ],
                    ),
                    
                  ],
                ),
              ),
          ],
        ),
      ),  
      ),
          
        
      
       
      
      
      bottomNavigationBar: const Footer(),
    );
          }
    );
    
  }
}
