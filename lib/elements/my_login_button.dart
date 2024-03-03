import 'package:flutter/material.dart';

class MyLoginButton extends StatelessWidget{
  final String buttonText;
  final VoidCallback onPressed;
  final Color color;

  const MyLoginButton({
    required this.onPressed, 
    this.buttonText = '', 
    this.color = Colors.black, 
    super.key,
  });

  @override
  Widget build(BuildContext context){
    return ElevatedButton(
      onPressed: () {
        // Login
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(vertical: 15),
        ),
      ),
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(
          buttonText,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
