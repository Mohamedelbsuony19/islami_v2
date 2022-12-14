import 'package:flutter/material.dart';

class MyTheme {
  static Color lightPryColor = Color(0xFFB7935F);
  static Color darkPryColor = Color(0xFF141A2E);

  static final ThemeData lightTheme = ThemeData(
      primaryColor: lightPryColor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black)),
      textTheme: TextTheme(
          headline1: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.w700),
          subtitle1: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w400)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
      ));
  static final ThemeData Darkheme = ThemeData(
      primaryColor: darkPryColor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.white)),
      textTheme: TextTheme(
          headline1: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),
          subtitle1: TextStyle(
              color: lightPryColor, fontSize: 25, fontWeight: FontWeight.w400)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: lightPryColor,
        unselectedItemColor: Colors.white,
      ));
}
