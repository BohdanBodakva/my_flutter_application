import 'package:flutter/material.dart';

class MyInputForm extends StatelessWidget{
  final double height;
  final double width;
  final VoidCallback onTap;
  String labelText;

  MyInputForm({
    required this.height,
    required this.width,
    required this.onTap,
    this.labelText = '',
    super.key,
  });

  @override
  Widget build(BuildContext context){

    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            onTap: onTap,
            decoration: InputDecoration(
              border: const UnderlineInputBorder(),
              labelText: labelText,
            ),
          ),
        ),
      ),
    );
  }
}
