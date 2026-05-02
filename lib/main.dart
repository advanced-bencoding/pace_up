import 'package:flutter/material.dart';
import 'package:pace_up/ui/home.dart';
import 'package:pace_up/ui/theme/material_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PaceUp!",
      home: Home(),
      theme: paceUpMaterialLight(),
      darkTheme: paceUpMaterialDark(),
      themeMode: ThemeMode.system,
    );
  }
}
