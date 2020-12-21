import 'package:flutter/material.dart';

class DefaultTheme {
  static DefaultTheme _defaultTheme;
  static ThemeData _theme;

  DefaultTheme._instance();

  factory DefaultTheme() {
    if (_defaultTheme == null) {
      _defaultTheme = DefaultTheme._instance();
    }
    return _defaultTheme;
  }

  static ThemeData get getDefaultTheme {
    if (_theme == null) {
      _theme = ThemeData(
        primarySwatch: Colors.blue,
        accentColorBrightness: Brightness.light,
        backgroundColor: Colors.blue,
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        primaryColorLight: Colors.white,
      );
    }
    return _theme;
  }
}