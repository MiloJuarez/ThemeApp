import 'package:flutter/material.dart';

class SwitchThemeButton extends StatelessWidget {
  final bool useDark;
  final Function useDarkTheme;

  SwitchThemeButton(
      {@required this.useDark,
      @required this.useDarkTheme,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SwitchListTile(
      inactiveTrackColor: Theme.of(context).primaryColorLight,
      selected: useDark,
      value: useDark,
      onChanged: useDarkTheme,
      title: Text(
        "Dark Theme",
        style: TextStyle(
          color: Theme.of(context).primaryColorLight,
        ),
      ),
      activeColor: Theme.of(context).primaryColor,
      activeTrackColor: Theme.of(context).primaryColorLight,
    );
  }
}
