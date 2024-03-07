import 'package:flutter/material.dart';
import 'package:my_flutter_application/enums/font_size.dart';

class MyAlertDialog extends StatelessWidget{
  final String title;
  final String text;

  const MyAlertDialog({
    required this.title,
    required this.text,
    super.key,
  });

  

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return SizedBox(
      child: AlertDialog(
      content: SizedBox(
        height: mediaQuery.size.height * 0.18,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
            Text(
              title,
              style: TextStyle(
                fontSize: MyFontSize.getFontSize(context, 4),
              ),
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: MyFontSize.getFontSize(context, 2),
                color: Colors.red,
              ),
            ),
          ],
      ),
      ),  
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Close',
          style: TextStyle(
            fontSize: MyFontSize.getFontSize(context, 1),
            ),
          ),
        ),
      ],   
    ),
  );
  }
}
