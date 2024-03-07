import 'package:flutter/material.dart';
import 'package:my_flutter_application/enums/font_size.dart';

class SettingsItem extends StatelessWidget{
  final String text;
  final VoidCallback onPressed;
  final Icon icon;
  final double itemWidthSubtraction;

  const SettingsItem({
    required this.onPressed, 
    this.itemWidthSubtraction = 1,
    this.icon = const Icon(Icons.disabled_by_default),
    this.text = '', 
    super.key,
  });

  @override
  Widget build(BuildContext context){
    final mediaQuery = MediaQuery.of(context);

    return SizedBox(
      width: mediaQuery.size.width * 0.85 * itemWidthSubtraction,
      child: TextButton(
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.all(18),        
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
          Text(
            text,
            style: TextStyle(
              fontSize: MyFontSize.getFontSize(context, 1),
            ),
          ),
          Container(
            child: icon,
          ),
        ],
      ),
    ),
    ),
    );
    
  }
}
