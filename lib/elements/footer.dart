import 'package:flutter/material.dart';
import 'package:my_flutter_application/enums/font_size.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);

    return SizedBox(
      height: mediaQuery.height * 0.075,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 2.5,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            onPressed: () => {
              Navigator.pushNamed(context, '/', arguments: null,),
            },
            child: Column(
              children: [
                const Icon(Icons.home),
                Text(
                  'Розклад',
                  style: TextStyle(
                    fontSize: MyFontSize.getFontSize(context, 1),
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () => {
              Navigator.pushNamed(context, '/calendar', arguments: null,),
            },
            child: Column(
              children: [
                const Icon(Icons.calendar_today),
                Text(
                  'Календар',
                  style: TextStyle(
                    fontSize: MyFontSize.getFontSize(context, 1),
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () => {
              Navigator.pushNamed(context, '/profile', arguments: null,),
            },
            child: Column(
              children: [
                const Icon(Icons.man),
                Text(
                  'Профіль',
                  style: TextStyle(
                    fontSize: MyFontSize.getFontSize(context, 1),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
        ],
      ),
       
    );
  }
}
