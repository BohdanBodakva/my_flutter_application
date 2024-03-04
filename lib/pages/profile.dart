import 'package:flutter/material.dart';
import 'package:my_flutter_application/elements/footer.dart';
import 'package:my_flutter_application/elements/my_app_bar.dart';
import 'package:my_flutter_application/elements/settings_item.dart';
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

    return Scaffold(
      appBar: MyAppBar(preferredHeight: mediaQuery.size.height * 0.07,),
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
                    width: mediaQuery.size.width * 0.33,
                    child: Image.asset('assets/user.png'),
                  ),

                  Container(
                    height: mediaQuery.size.width * 0.08,
                  ),

                  const Text(
                      'User',
                      style: TextStyle(
                        fontSize: 22
                      ),
                    ),
                  
                ],
              ),

              Container(
                height: mediaQuery.size.height * 0.02,
              ),

              SizedBox(
                height: mediaQuery.size.height * 0.47,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SettingsItem(
                      onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Alert'),
                  content: Text('This is a dialog window.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Close'),
                    ),
                  ],
                );
              },
            );
          },
                      icon: const Icon(Icons.person),
                      text: 'Edit profile info',
                    ),
                    SettingsItem(
                      onPressed: changeAppMode,
                      icon: MyApp.rootKey.currentState!.darkMode ? 
                        Icon(Icons.dark_mode) : 
                        Icon(Icons.light_mode),
                      text: 'Change app mode',
                    ),
                    SettingsItem(
                      onPressed: () => {},
                      icon: const Icon(Icons.refresh),
                      text: 'Refresh schedule',
                    ),
                    SettingsItem(
                      onPressed: () => {},
                      icon: const Icon(Icons.info),
                      text: 'About',
                    ),
                    SettingsItem(
                      onPressed: () => {},
                      icon: const Icon(Icons.settings),
                      text: 'Log Out',
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
