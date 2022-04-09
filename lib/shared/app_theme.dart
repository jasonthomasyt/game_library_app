import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appThemeProvider = Provider<AppTheme>((ref) {
  return AppTheme();
});

class AppTheme {
  static final ThemeData _lightThemeData = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
  );

  static final ThemeData _darkThemeData = ThemeData(
    primarySwatch: Colors.amber,
    brightness: Brightness.dark,
    primaryColor: Colors.amber,
  );

  ThemeData getAppThemeData(
    BuildContext context, {
    required bool isDarkModeEnabled,
  }) =>
      isDarkModeEnabled ? _darkThemeData : _lightThemeData;
}
