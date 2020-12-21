import 'package:flutter/material.dart';

enum Options { Settings, Account }

class ThemePopupMenu extends StatefulWidget {
  @override
  _ThemePopupMenuState createState() => _ThemePopupMenuState();
}

class _ThemePopupMenuState extends State<ThemePopupMenu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: Theme.of(context).primaryColor,
      onSelected: (selected) => print(selected.toString()),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<Options>>[
        _menuItem(Options.Account),
        _menuItem(Options.Settings),
      ],
    );
  }

  PopupMenuItem<Options> _menuItem(Options option) {
    return PopupMenuItem(
      child: Text(
        option.toString().split(".").last,
        style: TextStyle(color: Theme.of(context).primaryColorLight),
      ),
      value: option,
    );
  }
}
