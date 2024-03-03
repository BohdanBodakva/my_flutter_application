// import 'package:flutter/material.dart';
// import 'package:my_flutter_application/elements/my_add_button.dart';
// import 'package:my_flutter_application/elements/my_login_button.dart';
// import 'package:my_flutter_application/pages/home.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               MyLoginButton(
//                 onPressed: ()=>{}, 
//                 buttonText: 'login text', 
//                 color: const Color.fromARGB(255, 226, 103, 103),
//               ),
//               SizedBox(height: 20.0),
//               ElevatedButton(
//                 onPressed: () {
//                   // Implement register functionality
//                 },
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all(
//                    Colors.greenAccent
//                   ),
//                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30.0),
//                     ),
//                   ),
//                   padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
//                     EdgeInsets.symmetric(vertical: 15.0),
//                   ),
//                 ),
//                 child: Container(
//                   width: double.infinity,
//                   alignment: Alignment.center,
//                   child: Text(
//                     'REGISTER',
//                     style: TextStyle(fontSize: 18.0),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 40.0),
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (context) => HomePage(),
//                     ),
//                   );
//                 },
//                 child: Text(
//                   'USE WITHOUT ACCOUNT',
//                   style: TextStyle(
//                    color: const Color.fromARGB(255, 70, 70, 70)
//                   ),
//                 ),
//               ),
//               MyAddButton(onPressed: ()=>{}, buttonText: 'some text'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
