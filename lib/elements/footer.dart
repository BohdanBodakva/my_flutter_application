import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return SizedBox(
      // width: _mediaQuery.size.width,
      height: mediaQuery.size.height * 0.07,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            onPressed: () => {
              Navigator.pushNamed(context, '/', arguments: null,),
            },
            child: const Column(
              children: [
                Icon(Icons.home),
                Text('Розклад'),
              ],
            ),
          ),
          TextButton(
            onPressed: () => {
              Navigator.pushNamed(context, '/calendar', arguments: null,),
            },
            child: const Column(
              children: [
                Icon(Icons.calendar_today),
                Text('Календар'),
              ],
            ),
          ),
          TextButton(
            onPressed: () => {
              Navigator.pushNamed(context, '/profile', arguments: null,),
            },
            child: const Column(
              children: [
                Icon(Icons.man),
                Text('Профіль'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
