import 'package:flutter/material.dart';

class LightColors {
  static const Color primary = Colors.white;
  static const Color background = Colors.white;
  static const Color text = Colors.black;
}

class DarkColors {
  static const Color primary = Colors.black;
  static const Color background = Colors.black;
  static const Color text = Colors.white;
}

final ThemeData lightTheme = ThemeData(
  primaryColor: LightColors.primary,
  scaffoldBackgroundColor: LightColors.background,
  appBarTheme: AppBarTheme(
    backgroundColor: LightColors.primary,
    foregroundColor: LightColors.text,
    iconTheme: const IconThemeData(color: LightColors.text),
  ),
  tabBarTheme: TabBarThemeData(
    labelColor: LightColors.text,
    unselectedLabelColor: LightColors.text.withOpacity(0.6),
    indicator: UnderlineTabIndicator(borderSide: BorderSide(color: LightColors.text, width: 2)),
  ),
  brightness: Brightness.light,
);

final ThemeData darkTheme = ThemeData(
  primaryColor: DarkColors.primary,
  scaffoldBackgroundColor: DarkColors.background,
  appBarTheme: AppBarTheme(
    backgroundColor: DarkColors.primary,
    foregroundColor: DarkColors.text,
    iconTheme: const IconThemeData(color: DarkColors.text),
  ),
  tabBarTheme: TabBarThemeData(
    labelColor: DarkColors.text,
    unselectedLabelColor: DarkColors.text.withOpacity(0.6),
    indicator: UnderlineTabIndicator(borderSide: BorderSide(color: DarkColors.text, width: 2)),
  ),
  brightness: Brightness.dark,
);
