import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_app/themes/theme_handler.dart';
import 'package:theme_app/ui/ui_main.dart';

void main() {
  runApp(ThemeApp());
}

class ThemeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ThemeHandler())],
      child: UIMain(),
    );
  }
}
