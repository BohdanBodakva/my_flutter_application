

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_flutter_application/elements/footer.dart';
import 'package:my_flutter_application/elements/info_dialog.dart';
import 'package:my_flutter_application/elements/my_add_button.dart';
import 'package:my_flutter_application/elements/my_app_bar.dart';
import 'package:my_flutter_application/elements/my_input_form.dart';
import 'package:my_flutter_application/elements/settings_item.dart';
import 'package:my_flutter_application/enums/font_size.dart';
import 'package:my_flutter_application/localstore/MyController.dart';
import 'package:my_flutter_application/logic/user_controller.dart';
import 'package:my_flutter_application/main.dart';


class ProfilePage extends StatefulWidget {
  final dynamic user;
  static dynamic usrname;
  static dynamic fullName;

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

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String dropdownvalue = 'Apple';
  var items = [
    'Apple',
    'Banana',
    'Grapes',
    'Orange',
    'watermelon',
    'Pineapple',
  ];

  @override
  void initState(){
    super.initState();
    getCurrentUsername();
  }

  var userName = '';
  var userSurname = '';
  var userPassword = '';
  var userGroup = '';

  // @override
  // void initState() async {
  //   super.initState();
  //   // var login = await UserController.getUserByUsername();

  //   // if(login == null){
  //   //   userName = '';
  //   //   userSurname = '';
  //   // } else {
  //     // userName = login.$1;
  //     // userSurname = login.$2;
  //   // }
  // }

  void changeAppMode(){
    MyApp.rootKey.currentState?.rebuildApp();
  }

  void logOut(){
    MyController.deleteActiveUser();
    Navigator.pushNamed(context, '/login');
  }

  Future<void> getCurrentUsername() async {
    String r = await MyController.getCurrentUsername() as String;
    debugPrint("CURRENT USERNAME 2: $r");

    dynamic user = await MyController.getActiveUser(); 

    debugPrint("USEEEEEEr: ${user}");
    debugPrint("USEEEEEEr222: ${user['name']}");

    userName = user['name'] as String;
    userSurname = user['surname'] as String;

    setState(() {
      ProfilePage.usrname = r;
      ProfilePage.fullName = '$userName $userSurname';
    });
  }

  final nameController = TextEditingController();
  final surnameController = TextEditingController();

  saveUserInfo()async{
    var enteredName = nameController.text as String;
    var enteredSurname = surnameController.text as String;

    var currUsername = (await MyController.getCurrentUsername()).toString();

    // var user = await MyController.getUserByUsername(
    //   currUsername,
    // );

    // debugPrint('THIS USER: $user');

    // user['name'] = enteredName;
    // user['surname'] = enteredSurname;

    // debugPrint('THIS USER 2: $user');



    // final db = Localstore.instance;
    // Map? users = await db.collection('users').get();
    // for (var user in users!.values){
    //   if(user['username'] == currUsername){
    //     user['name'] = enteredName;
    //     user['surname'] = enteredSurname;
    //   }
    //   debugPrint('ALL USERS: $user');
    // }

    // db.collection('users').delete();
    // db.collection('users').;



    // await MyController.addUser(
    //   User(
    //     username: currUsername, 
    //     password: user['password'].toString(),
    //     name: enteredName.toString(),
    //     surname: enteredSurname.toString(),
    //     group: user['group'].toString(),
    //   ),
    // );

    // await MyController.setUserAsActive(currUsername);

    // Navigator.of(context).pop();
    // Navigator.pushNamed(context, '/profile');

    // setState(() async {
    //   var user = await MyController.getUserByUsername(currUsername);

    //   ProfilePage.fullName = '${user['name']} ${user['surname']}';

      
    // });

    Navigator.of(context).pop();
  }

  

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);

    final formHeight = mediaQuery.height * 0.15;
    final formWidth = mediaQuery.width * 0.6;

    

    return Scaffold(
      appBar: MyAppBar(
        title: ProfilePage.usrname, 
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
                      ProfilePage.fullName.toString(),
                      style: TextStyle(
                        fontSize: MyFontSize.getFontSize(context, 4)
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
                          builder: (_) => InfoDialog(
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
                                    onPressed: saveUserInfo,
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
                          setState(() {
                            dropdownvalue = newValue!;
                          });
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
                          builder: (_) => InfoDialog(
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
                      onPressed: logOut,
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
}
