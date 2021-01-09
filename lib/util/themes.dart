import 'package:flutter/material.dart';

enum AppTheme { Default, Dark, LightGreen, DarkGreen, VioletLight, PurpleLight }

String enumName(AppTheme anyEnum) {
  return anyEnum.toString().split('.')[1];
}

final Map<AppTheme, ThemeData> appThemeData = {
  AppTheme.Default: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    cardColor: Colors.white,
    accentColor: Color(0xFFEF5350),
    textTheme: TextTheme(
      headline6: TextStyle(color: Colors.black),
      headline5: TextStyle(color: Colors.black),
    ),
  ),
  AppTheme.Dark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    accentColor: Colors.tealAccent,
    cardColor: Colors.black,
    textTheme: TextTheme(
      headline6: TextStyle(color: Colors.black),
      headline5: TextStyle(color: Colors.white),
    ),
  ),
  AppTheme.LightGreen: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.lightGreen,
    accentColor: Colors.purple,
    textTheme: TextTheme(
      headline6: TextStyle(color: Colors.black),
      headline5: TextStyle(color: Colors.black),
    ),
  ),
  AppTheme.DarkGreen: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.green,
    accentColor: Colors.purple,
    textTheme: TextTheme(
      headline6: TextStyle(color: Colors.black),
      headline5: TextStyle(color: Colors.black),
    ),
  ),
  AppTheme.PurpleLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xFF9C27B0),
    accentColor: Color(0xFFFFCA28),
    textTheme: TextTheme(
      headline6: TextStyle(color: Colors.black),
      headline5: TextStyle(color: Colors.black),
    ),
  ),
  AppTheme.VioletLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xFF673AB7),
    accentColor: Color(0xFF2196F3),
    textTheme: TextTheme(
      headline6: TextStyle(color: Colors.black),
      headline5: TextStyle(color: Colors.black),
    ),
  ),
};
