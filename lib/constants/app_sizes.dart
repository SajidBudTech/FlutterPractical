import 'package:flutter/material.dart';

class AppSizes {
 

  static double inputHeight = 50;

  static double productImageHeight = 60;
  static double productImageWidth = 60;


  static BorderRadiusGeometry containerBorderRadiusShape(
          {double radius = 30}) =>
      BorderRadius.all(
        Radius.circular(radius),
      );

  static double getScreenWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }

  static double getScreenheight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }
}
