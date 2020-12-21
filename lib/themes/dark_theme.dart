import 'package:flutter/material.dart';

class DarkTheme {
  static DarkTheme _darkTheme;
  static ThemeData _theme;

  DarkTheme._instance();

  factory DarkTheme() {
    if (_darkTheme == null) {
      _darkTheme = DarkTheme._instance();
    }
    return _darkTheme;
  }

  static ThemeData get getDarkTheme {
    if (_theme == null) {
      _theme = ThemeData(
        primarySwatch: Colors.blueGrey,
        primaryColorBrightness: Brightness.dark,
        backgroundColor: Colors.grey,
        primaryColor: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.grey,
        primaryColorLight: Colors.white,
      );
    }
    return _theme;
  }
}