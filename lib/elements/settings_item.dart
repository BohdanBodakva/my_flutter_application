import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget{
  final String text;
  final VoidCallback onPressed;
  final Icon icon;

  const SettingsItem({
    required this.onPressed, 
    this.icon = const Icon(Icons.disabled_by_default),
    this.text = '', 
    super.key,
  });

  @override
  Widget build(BuildContext context){
    var mediaQuery = MediaQuery.of(context);

    return SizedBox(
      width: mediaQuery.size.width * 0.85,
      child: TextButton(
      onPressed: onPressed,
      child: Container(
        padding: EdgeInsets.all(18),
        
        decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 20, 111, 185),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          Container(
            child: icon,
          )
        ],
      ),
    ),
    ),
    );
    
  }
}
