import 'package:flutter/material.dart';
import 'package:theme_app/utils/drawer.dart';

class MenuButton extends StatelessWidget {
  final Function updatedScreen;
  MenuButton({@required this.updatedScreen});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ThemeDrawer(changeTheme: updatedScreen),
        ),
      ),
      child: Icon(
        Icons.menu,
        color: Colors.white,
      ),
    );
  }
}
