import 'package:flutter/material.dart';

class ThemeDefault {
  static ThemeData apply = ThemeData(
    primarySwatch: Colors.teal,
    textTheme: TextTheme(
      headline1: const TextStyle(
        height: 1.0,
        fontSize: 35.0,
        fontFamily: "Roboto",
        fontWeight: FontWeight.w900,
        fontFamilyFallback: ["Source Sans Pro", "sans-serif"],
        color: Colors.black38,
      ),
      headline2: const TextStyle(
        height: 1.0,
        fontSize: 24.0,
        fontFamily: "Roboto",
        fontFamilyFallback: ["Source Sans Pro", "sans-serif"],
        color: Colors.black38,
        fontStyle: FontStyle.normal
      ),
      bodyText1: const TextStyle(
        height: 0.5,
        fontSize: 20.0,
        fontFamily: "Roboto",
        fontFamilyFallback: ["Source Sans Pro", "sans-serif"],
      ),
      bodyText2: const TextStyle(
        height: 1.0,
        fontSize: 20.0,
        fontFamily: "Roboto",
        fontFamilyFallback: ["Source Sans Pro", "sans-serif"],
        color: Colors.black87,
        decorationStyle: TextDecorationStyle.dotted
      ),
    ),
  );
}