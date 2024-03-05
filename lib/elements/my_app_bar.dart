import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget{
  final double preferredHeight;
  final String title;

  const MyAppBar({required this.title, required this.preferredHeight, super.key});

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(preferredHeight);
}

class _MyAppBarState extends State<MyAppBar> {

  @override
  Widget build(BuildContext context) {

    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(widget.title),
    );
  }
}
