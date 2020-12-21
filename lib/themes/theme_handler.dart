import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_app/themes/dark_theme.dart';
import 'package:theme_app/themes/default_theme.dart';
import 'package:theme_app/ui/ui_main.dart';

class ThemeHandler with ChangeNotifier {
  static ThemeHandler _instance;
  static ThemeHandler instance = _instance ?? (_instance = ThemeHandler());
  static ThemeData _appTheme;
  static ThemeSelected _theme;

  ThemeHandler._getInstance(){
    _getTheme();
  }

  ThemeData get getAppTheme => _appTheme;

  factory ThemeHandler() {
    if (_instance == null) {
      _instance = ThemeHandler._getInstance();
    }
    return _instance;
  }

  void _getThemeSaved() {
    switch(_theme) {
      case ThemeSelected.Light:
        _appTheme = DefaultTheme.getDefaultTheme;
        break;
      case ThemeSelected.Dark:
        _appTheme = DarkTheme.getDarkTheme;
        break;
      default:
        _appTheme = DefaultTheme.getDefaultTheme;
        break;
    }
  }

  void changeTheme(ThemeData theme, String name) async {
    _appTheme = theme;
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString("theme", name);
    notifyListeners();
  }

  void _getTheme() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String themeName = _prefs?.getString("theme") ?? "";
    _theme = ThemeSelected.Light;
    ThemeSelected.values.forEach((_t) {
      if (_t.toString() == themeName) {
        _theme = _t;
        _getThemeSaved();
      }
    });
  }
}