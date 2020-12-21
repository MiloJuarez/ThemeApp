import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_app/themes/dark_theme.dart';
import 'package:theme_app/themes/default_theme.dart';
import 'package:theme_app/themes/theme_handler.dart';
import 'package:theme_app/utils/drawer.dart';
import 'package:theme_app/utils/popupmenu.dart';
import 'package:theme_app/utils/header.dart';

class UIMain extends StatefulWidget {
  UIMain();
  @override
  _UIMainState createState() => _UIMainState();
}

enum ThemeSelected { Light, Dark }

class _UIMainState extends State<UIMain> {
  bool useDark = false;

  @override
  void initState() {
    super.initState();
    _isUsingDark();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeHandler.instance.getAppTheme,
      title: "Switch Themes",
      home: Scaffold(
        drawer: ThemeDrawer(changeTheme: _useDarkTheme, isUsingDark: useDark,),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(0, 0, 0, 0),
          titleSpacing: 0,
          actions: [
            ThemePopupMenu()
          ],
        ),
        body: Stack(
          children: [
            ListView(
              children: [
                SizedBox(height: 80),
              ],
            ),
            HeaderList("assets/images/header_image.jpg", "Switch Theme"),
          ],
        ),
      ),
    );
  }

  void _useDarkTheme(bool use) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setBool("useDark", use);
    setState(() {
      useDark = use;
      if (use)
        ThemeHandler.instance.changeTheme(
          DarkTheme.getDarkTheme,
          ThemeSelected.Dark.toString(),
        );
      else
        ThemeHandler.instance.changeTheme(
          DefaultTheme.getDefaultTheme,
          ThemeSelected.Light.toString(),
        );
    });
  }

  void _isUsingDark() async {
    SharedPreferences _shared = await SharedPreferences.getInstance();
    setState(() => useDark = _shared?.getBool("useDark") ?? false);
  }
}
