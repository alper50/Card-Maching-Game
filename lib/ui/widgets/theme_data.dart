import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static final ThemeData lightheme = ThemeData(
    fontFamily: "IndieFlower",
    brightness: Brightness.light,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    primaryColor: Colors.grey[200],
    scaffoldBackgroundColor: Colors.deepOrange[50],
    appBarTheme: AppBarTheme(
      actionsIconTheme: IconThemeData(
        color: Colors.black,
        size: 25.0,
      ),
      backgroundColor: Colors.deepOrange[50],
      elevation: 0,
    ),
    textTheme: TextTheme(
      bodyText2: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      bodyText1: TextStyle(
        fontSize: 18.0,
        color: Colors.black,
      ),
      headline6: TextStyle(
        color: Colors.black,
        fontSize: 23.0,
        letterSpacing: 2.0,
      ),
    ),
  );

  static final ThemeData darktheme = ThemeData(
    fontFamily: "IndieFlower",
    brightness: Brightness.dark,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    primaryColor: Colors.black,
    backgroundColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      actionsIconTheme: IconThemeData(
        color: Colors.white,
        size: 25.0,
      ),
      backgroundColor: Colors.black,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: Colors.white,
        fontSize: 23.0,
        letterSpacing: 2.0,
      ),
       bodyText2: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodyText1: TextStyle(
        fontSize: 18.0,
        color: Colors.white,
      ),
    ),
  );
}
