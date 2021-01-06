import 'package:flutter/material.dart';

class ThemeDefault {
  static Color _primaryColor = Color.fromRGBO(49, 101, 212, 1);
  static ThemeData apply = ThemeData(
    primaryColor: _primaryColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(_primaryColor),
        backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(255, 255, 255, 1)),
        side: MaterialStateProperty.all<BorderSide>(BorderSide(color: _primaryColor)),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(20.0)),
        shape:  MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0)
        )),
        textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: 20.0)),
        // shape: MaterialStateProperty.all<OutlinedBorder>(OutlineInputBorder()),
      )
      // buttonColor: Color.fromRGBO(49, 101, 212, 1),
      // focusColor: Color.fromRGBO(49, 101, 212, 1),
      // highlightColor:  Color.fromRGBO(255, 255, 255, 1),
      // colorScheme: ColorScheme.dark()
    ),
    // buttonColor: Color.fromRGBO(49, 101, 212, 1),
    textTheme: TextTheme(
      headline1: const TextStyle(
        height: 1.0,
        fontSize: 35.0,
        fontFamily: "Geomanist Book",
        fontFamilyFallback: ["Geomanist Book", "Source Sans Pro Regular"],
        fontWeight: FontWeight.w900,
        color: Color.fromRGBO(149, 149, 149, 1),
      ),
      headline2: const TextStyle(
        height: 1.0,
        fontSize: 20.0,
        fontFamily: "Geomanist Book",
        fontFamilyFallback: ["Geomanist Book", "Source Sans Pro Regular"],
        color: Color.fromRGBO(149, 149, 149, 1),
        fontStyle: FontStyle.normal
      ),
      headline3: const TextStyle(
        height: 1.0,
        fontSize: 30.0,
        fontFamily: "Geomanist Book",
        fontFamilyFallback: ["Geomanist Book", "Source Sans Pro Regular"],
        fontWeight: FontWeight.w600,
        color: Color.fromRGBO(149, 149, 149, 1),
      ),
      bodyText1: const TextStyle(
        height: 0.5,
        fontSize: 20.0,
        fontFamily: "Geomanist Book",
        fontFamilyFallback: ["Geomanist Book", "Source Sans Pro Regular"],
      ),
      bodyText2: const TextStyle(
        height: 1.0,
        fontSize: 24.0,
        fontFamily: "Geomanist Book",
        fontFamilyFallback: ["Geomanist Book", "Source Sans Pro Regular"],
        color: Color.fromRGBO(149, 149, 149, 1),
        decorationStyle: TextDecorationStyle.dotted
      ),
      subtitle1: const TextStyle(
        height: 1.0,
        fontSize: 20.0,
        fontFamily: "Geomanist Book",
        fontFamilyFallback: ["Geomanist Book", "Source Sans Pro Regular"],
        color: Color.fromRGBO(149, 149, 149, 1),
        fontStyle: FontStyle.italic
      ),
    ),
  );
}