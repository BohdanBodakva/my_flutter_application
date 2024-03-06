import 'package:flutter/material.dart';

class MyInputForm extends StatelessWidget{
  final double height;
  final double width;
  String labelText;

  MyInputForm({
    required this.height,
    required this.width,
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
