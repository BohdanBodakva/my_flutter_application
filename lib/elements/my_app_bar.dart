import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget{
  final double preferredHeight;

  const MyAppBar({required this.preferredHeight, super.key});

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(preferredHeight);
}

class _MyAppBarState extends State<MyAppBar> {
  final title = 'Розклад НУ "ЛП"';

  @override
  Widget build(BuildContext context) {

    return AppBar(
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(title),
    );
  }
}
