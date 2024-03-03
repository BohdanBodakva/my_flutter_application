import 'package:flutter/material.dart';

class MyAddButton extends StatelessWidget{
  final String buttonText;
  final VoidCallback onPressed;
  final bool homeworkIsPresent;

  const MyAddButton({
    required this.onPressed, 
    this.homeworkIsPresent = false,
    this.buttonText = '', 
    super.key,
  });

  @override
  Widget build(BuildContext context){
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.transparent,
        side: const BorderSide(
          color: Color.fromARGB(255, 114, 112, 112),
          width: 1.7,
        ),
      ),
      child: Row(
        children: [
          Text( 
            buttonText,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          if (homeworkIsPresent)
            Container(padding: const EdgeInsets.only(left: 8),),
            const Icon(Icons.notification_important),
        ],
      ) ,
    );
  }
}
