import 'package:flutter/material.dart';
import 'package:my_flutter_application/enums/font_size.dart';
import 'package:my_flutter_application/enums/my_colors.dart';

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
    final mediaQuery = MediaQuery.sizeOf(context);

    return SizedBox(
      width: mediaQuery.width * 0.85 * itemWidthSubtraction,
      child: TextButton(
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.all(18),        
        decoration: BoxDecoration(
            border: Border.all(
              color: MyColors.myBlueColor,
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
