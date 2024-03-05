import 'package:flutter/material.dart';
import 'package:my_flutter_application/elements/footer.dart';
import 'package:my_flutter_application/elements/info_dialog.dart';
import 'package:my_flutter_application/elements/my_add_button.dart';
// import 'package:my_flutter_application/elements/my_add_button.dart';
import 'package:my_flutter_application/elements/my_app_bar.dart';
import 'package:my_flutter_application/elements/my_input_form.dart';
import 'package:my_flutter_application/elements/settings_item.dart';
import 'package:my_flutter_application/enums/font_size.dart';
// import 'package:my_flutter_application/logic/storage.dart';
import 'package:my_flutter_application/main.dart';
// import 'package:my_flutter_application/main.dart';


class ProfilePage extends StatefulWidget {
  final dynamic user;

  ProfilePage({this.user, super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  void changeAppMode(){
    MyApp.rootKey.currentState?.rebuildApp();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final formHeight = mediaQuery.size.height * 0.25;
    final formWidth = mediaQuery.size.width * 0.6;

    return Scaffold(
      appBar: MyAppBar(title: 'Профіль', preferredHeight: mediaQuery.size.height * 0.07,),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: mediaQuery.size.height * 0.02,
          horizontal: mediaQuery.size.height * 0.05,
        ),
        child: Center(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    width: mediaQuery.size.width * 0.29,
                    child: Image.asset('assets/user.png'),
                  ),

                  Container(
                    height: mediaQuery.size.width * 0.08,
                  ),

                  Text(
                      'User',
                      style: TextStyle(
                        fontSize: MyFontSize.getFontSize(context, 5),
                      ),
                    ),
                  
                ],
              ),

              Container(
                height: mediaQuery.size.height * 0.03,
              ),

              SizedBox(
                height: mediaQuery.size.height * 0.47,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SettingsItem(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => InfoDialog(
                            title: 'Edit Profile',
                            titleWidgets:[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyInputForm(
                                    height: formHeight, 
                                    width: formWidth,
                                    labelText: 'edit name',
                                    onTap: () => {
                                      
                                    },
                                  ),
                                  MyInputForm(
                                    height: formHeight, 
                                    width: formWidth,
                                    labelText: 'edit surname',
                                    onTap: () => {
                                      
                                    },
                                  ),
                                  // MyInputForm(
                                  //   height: formHeight, 
                                  //   width: formWidth,
                                  //   labelText: 'edit group',
                                  // ),
                                  MyAddButton(
                                    onPressed: () => {
                                      showDialog(
                                        context: context,
                                        builder: (_) => InfoDialog(
                                          title: 'change password',
                                          titleWidgets: [
                                            MyInputForm(
                                    height: formHeight, 
                                    width: formWidth,
                                    labelText: 'enter password',
                                    onTap: () => {
                                      
                                    },
                                  )
                                          ],
                                          buttonText: 'Close',
                                        ),
                                      ),
                                    },
                                    buttonText: 'Change password',
                                  ),
                                ],
                              ),
                  ],
                            buttonText: 'Close',
                            type: 1,
                          ),
                        );
                      },
                      icon: const Icon(Icons.person),
                      text: 'Edit profile info',
                    ),
                    SettingsItem(
                      onPressed: () => {},
                      icon: const Icon(Icons.refresh),
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
                        Icon(Icons.dark_mode) : 
                        Icon(Icons.light_mode),
                      text: 'Change app mode',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SettingsItem(
                          itemWidthSubtraction: 0.46,
                      onPressed: () => {
                        showDialog(
                          context: context,
                          builder: (_) => InfoDialog(
                            title: 'About this app',
                            titleWidgets: [Text('sdgdflkgjdfkg')],
                            buttonText: 'Close',
                          ),
                        ),
                      },
                      icon: const Icon(Icons.info),
                      text: 'About',
                    ),
                    SettingsItem(
                      itemWidthSubtraction: 0.46,
                      onPressed: () => {},
                      icon: const Icon(Icons.settings),
                      text: 'Log Out',
                    ),
                      ],
                    ),
                    
                  ],
                ),
              )
        
          ],
        ),
      ),  
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
