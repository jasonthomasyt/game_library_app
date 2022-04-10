import 'package:flutter/material.dart';

class Theme {
  static final ThemeData _lightThemeData = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
  );

  static final ThemeData _darkThemeData = ThemeData(
    primarySwatch: Colors.amber,
    brightness: Brightness.dark,
    primaryColor: Colors.amber,
  );

  ThemeData getThemeData(
    BuildContext context, {
    required bool isDarkModeEnabled,
  }) =>
      isDarkModeEnabled ? _darkThemeData : _lightThemeData;
}
