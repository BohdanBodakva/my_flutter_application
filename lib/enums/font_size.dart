// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class MyFontSize{

  static double getFontSize(BuildContext context, int i){
    final width = MediaQuery.of(context).size.width;

    switch(i){
      case 1: return width * 0.035;
      case 2: return width * 0.045;
      case 3: return width * 0.055;
      case 4: return width * 0.065;
      case 5: return width * 0.075;
      case 6: return width * 0.085;
    }
    
    return -1;
  }
  
}
