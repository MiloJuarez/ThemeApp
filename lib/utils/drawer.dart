import 'package:flutter/material.dart';
import 'package:theme_app/utils/switch_theme.dart';

class ThemeDrawer extends StatelessWidget {
  final Function changeTheme;
  final bool isUsingDark;

  ThemeDrawer({@required this.changeTheme, this.isUsingDark});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: ListView(
          children: [
            _menuHeader(context, Icons.arrow_back, "Switch Theme", () => _closeDrawer(context)),
            SwitchThemeButton(useDark: isUsingDark, useDarkTheme: changeTheme),
            _menuOption(context, Icons.call, "Call", () {}),
            _menuOption(context, Icons.message, "Text", () {}),
            _menuOption(context, Icons.print, "Print", () {}),
            _menuOption(context, Icons.update, "Update", () {}),
            _menuOption(context, Icons.lock, "Lock app", () {}),
            _menuOption(context, Icons.calendar_today, "Agenda", () {}),
          ],
        ),
      ),
    );
  }

  Card _menuHeader(BuildContext context, IconData icon, String tag, Function action) {
    return Card(
      elevation: 2.5,
      margin: EdgeInsets.all(0.0),
      color: Theme.of(context).primaryColor,
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).primaryColorLight,),
        title: Text(tag,
          style: TextStyle(
            color: Theme.of(context).primaryColorLight,
          ),
        ),
        onTap: action,

      ),
    );
  }

  ListTile _menuOption(BuildContext context,IconData icon, String tag, Function action) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).primaryColorLight,),
      title: Text(tag,
        style: TextStyle(
          color: Theme.of(context).primaryColorLight,
        ),
      ),
      onTap: action,
    );
  }
  
  void _closeDrawer(BuildContext context) => Navigator.pop(context);
}