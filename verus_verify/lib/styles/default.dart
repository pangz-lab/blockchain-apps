import 'package:flutter/material.dart';

class StyleDefault {
  static BoxDecoration boxDecoration1 = BoxDecoration(
    color: Colors.grey[200],
    borderRadius: BorderRadius.circular(20.0),
    border: Border.all(
      color: Colors.black38,
      width: 2,
      style: BorderStyle.solid
    ),
  );

  static TextStyle inputStyle1 = const TextStyle( 
    fontSize: 20.0,
    fontFamily: "Roboto",
    fontFamilyFallback: ["Source Sans Pro", "sans-serif"],
  );
}